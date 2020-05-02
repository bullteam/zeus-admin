package service

import (
	"errors"
	"fmt"
	"github.com/spf13/viper"
	"math"
	"strconv"
	"strings"
	"time"
	"zeus/pkg/api/cache"
	"zeus/pkg/api/dao"
	"zeus/pkg/api/domain/account"
	"zeus/pkg/api/domain/account/ldap"
	"zeus/pkg/api/domain/account/login"
	"zeus/pkg/api/domain/perm"
	"zeus/pkg/api/domain/user"
	"zeus/pkg/api/dto"
	"zeus/pkg/api/log"
	"zeus/pkg/api/model"
	"zeus/pkg/api/utils"
)

const pwHashBytes = 64

var (
	/* Dao layer */
	userDao           = dao.User{}
	userOauthDao      = dao.UserOAuthDao{}
	logDao            = dao.LoginLogDao{}
	smsHandler        = &login.SmsSendChebao{}
	errInvalidAccount = errors.New("账号或密码错误")
	errInvalidCode    = errors.New("请输入正确验证码")
	errAccountLocked  = errors.New("账号已被锁定,请联系管理员")
)

const (
	UserStatusNotPub = iota
	UserStatusNormal
	UserStatusLock
)

type UserService struct {
	//oauthdao *dao.UserOAuthDao
}

func (u UserService) InfoOfId(dto dto.GeneralGetDto) model.User {
	return userDao.Get(dto.Id, true)
}

// List - users list with pagination
func (u UserService) List(dto dto.GeneralListDto) ([]model.User, int64) {
	return userDao.List(dto)
}

// Create - create a new account
func (u UserService) Create(userDto dto.UserCreateDto) (*model.User, error) {
	//if username is exits,it can't create this user
	userModel := userDao.GetByUserName(userDto.Username)
	if userModel.Username == userDto.Username {
		return nil, errors.New("username is exits")
	}
	salt, _ := account.MakeSalt()
	pwd, _ := account.HashPassword(userDto.Password, salt)
	newUser := &model.User{
		Username:     userDto.Username,
		Mobile:       userDto.Mobile,
		Password:     pwd,
		DepartmentId: userDto.DepartmentId,
		Salt:         salt,
		Sex:          userDto.Sex,
		Email:        userDto.Email,
		Title:        userDto.Title,
		Realname:     userDto.Realname,
		Status:       userDto.Status,
	}
	c := userDao.Create(newUser)
	if c.Error != nil {
		log.Error(c.Error.Error())
		return nil, errors.New("create user failed")
	}

	if userDto.Roles != "" {
		u.AssignRole(strconv.Itoa(newUser.Id), strings.Split(userDto.Roles, ","))
	}

	return &userModel, nil
}

// Update - update user's information
func (u UserService) Update(userDto dto.UserEditDto) int64 {
	userModel := model.User{
		Id: userDto.Id,
	}
	c := userDao.Update(&userModel, map[string]interface{}{
		"mobile":        userDto.Mobile,
		"department_id": userDto.DepartmentId,
		"status":        userDto.Status,
		"title":         userDto.Title,
		"realname":      userDto.Realname,
		"sex":           userDto.Sex,
		"email":         userDto.Email,
	})
	u.AssignRole(strconv.Itoa(userDto.Id), strings.Split(userDto.Roles, ","))
	return c.RowsAffected
}

// UpdateStatus - update user's status only
func (UserService) UpdateStatus(dto dto.UserEditStatusDto) int64 {
	u := userDao.Get(dto.Id, false)
	//u.Status = dto.Status
	c := userDao.Update(&u, map[string]interface{}{
		"status": dto.Status,
	})
	return c.RowsAffected
}

// UpdatePassword - update password only
func (UserService) UpdatePassword(dto dto.UserEditPasswordDto) int64 {
	salt, _ := account.MakeSalt()
	pwd, _ := account.HashPassword(dto.Password, salt)
	u := userDao.Get(dto.Id, false)
	//u.Password = pwd
	//u.Salt = salt
	c := userDao.Update(&u, map[string]interface{}{
		"password": pwd,
		"salt":     salt,
	})
	return c.RowsAffected
}

// ResetPassword - automatically make a password
func (UserService) ResetPassword(gDto dto.GeneralGetDto) string {
	salt, _ := account.MakeSalt()
	//pwd, _ := account.HashPassword(dto.Password, salt)
	u := userDao.Get(gDto.Id, false)
	autoPwd := utils.RandomPwd(10)
	pwd, _ := account.HashPassword(autoPwd, salt)
	//u.Password = pwd
	//u.Salt = salt
	userDao.Update(&u, map[string]interface{}{
		"password": pwd,
		"salt":     salt,
	})
	return autoPwd
}

// Delete - delete user
func (UserService) Delete(dto dto.GeneralDelDto) int64 {
	userModel := model.User{
		Id: dto.Id,
	}
	c := userDao.Delete(&userModel)
	if c.RowsAffected > 0 {
		user.DeleteUser(strconv.Itoa(dto.Id))
	}
	return c.RowsAffected
}

// UpdateLoginTime update last login time after user successfully sign in
func (UserService) UpdateLoginTime(user dto.UserEditDto) int64 {
	u := userDao.Get(user.Id, false)
	//u.Status = dto.Status
	c := userDao.Update(&u, map[string]interface{}{
		"last_login_time": time.Now(),
	})
	return c.RowsAffected
}

// VerifyAndReturnLdapUserInfo - Verify Ldap user
func (UserService) VerifyAndReturnLdapUserInfo(dto dto.LoginDto) (bool, model.User) {
	ldapConn := ldap.GetLdap()
	_, err := ldapConn.Auth(dto.Username, dto.Password)
	if err != nil {
		return false, model.User{}
	}
	return true, userDao.GetByUserName(dto.Username)
}

// NeedToVerifySmsCode  - check if account need to display sms code input
func (u UserService) VerifySmsCodeIfNeedToShow(twoFaDto dto.TwoFaDto) bool {
	if viper.GetBool("security.2fa.enabled") {
		userModel := userDao.GetByUserName(twoFaDto.Username)
		return u.VerifySmsCodeIfNeeded(userModel)
	}
	return false
}

// VerifySmsCodeIfNeeded  - check if account need sms code verification
func (u UserService) VerifySmsCodeIfNeeded(userModel model.User) bool {
	// first time login then means sms code needed
	if userModel.CreateTime == userModel.LastLoginTime {
		return true
	}
	//p, err := cache.HashGet(viper.GetString("security.2fa.smsConfigHash"), viper.GetString("security.2fa.smsConfigHashKey"))
	//if err != nil {
	//	return true
	//}
	//period, _ := strconv.Atoi(p)
	period := u.GetNoSmsCodeDurationDay()
	// 0 means need sms code forever
	if period < 1 {
		return true
	}
	if time.Now().Sub(userModel.LastLoginTime).Seconds() > float64(24*3600*period) {
		return true
	}
	return false
}

func (UserService) GetNoSmsCodeDurationDay() int {
	p, err := cache.HashGet(viper.GetString("security.2fa.smsConfigHash"), viper.GetString("security.2fa.smsConfigHashKey"))
	if err != nil {
		return 0
	}
	period, _ := strconv.Atoi(p)
	return period
}

// VerifyAndReturnUserInfo - login and return user info
func (u UserService) VerifyAndReturnUserInfo(loginDto dto.LoginDto) (bool, error, model.User) {
	userModel := userDao.GetByUserName(loginDto.Username)
	// Account not exits
	if userModel.Id < 1 {
		return false, errInvalidAccount, model.User{}
	}
	if userModel.Status == UserStatusLock {
		return false, errAccountLocked, model.User{}
	}
	locKey := fmt.Sprintf(viper.GetString("login.failRecordKey"), userModel.Username)
	if login.VerifyPassword(loginDto.Password, userModel) {
		// destroy time records
		_ = cache.Del(locKey)
		if u.VerifySmsCodeIfNeeded(userModel) {
			if err := u.Verify2Fa(loginDto.Code, userModel); err != nil {
				return false, errInvalidCode, model.User{}
			}
		}
		// update last login time
		// 判断是否超过了设置的天数间隔，超过再更新登录时间
		// 这样将实现强制在间隔时间内进行2fa验证
		if viper.GetBool("security.2fa.enabled") {
			period := u.GetNoSmsCodeDurationDay()
			if time.Now().Sub(userModel.LastLoginTime).Seconds() >= float64(24*3600*period) {
				u.UpdateLoginTime(dto.UserEditDto{Id: userModel.Id})
			}
		} else {
			u.UpdateLoginTime(dto.UserEditDto{Id: userModel.Id})
		}
		return true, nil, userModel
	} else {
		if viper.GetBool("security.2fa.enabled") {
			t, _ := cache.Get(locKey)
			failTimes, _ := strconv.Atoi(t)
			// 累计此次错误，已到达错误上限，所以-1
			if failTimes >= viper.GetInt("login.failUntilLock")-1 {
				// lock
				if u.UpdateStatus(dto.UserEditStatusDto{Id: userModel.Id, Status: UserStatusLock}) > 0 {
					// recount
					_ = cache.Del(locKey)
					return false, errAccountLocked, model.User{}
				}
			} else {
				// increase locks let user just can try several times
				_ = cache.Increase(locKey)
				// set ttl at first time
				if failTimes == 0 {
					_ = cache.Expire(locKey, time.Second*24*3600)
				}
				return false, fmt.Errorf("密码输入错误，您还有%d次机会", viper.GetInt("login.failUntilLock")-failTimes-1), model.User{}
			}
		}
	}
	return false, errInvalidAccount, model.User{}
}

// Verify2Fa do custom 2fa verification
func (UserService) Verify2Fa(code string, userModel model.User) error {
	if viper.GetBool("security.2fa.enabled") {
		switch viper.GetString("security.2fa.handler") {
		case "sms":
			// Get verify code in redis and verify it
			storageCode, err := cache.Get(fmt.Sprintf(viper.GetString("security.2fa.smsCodeKey"), userModel.Mobile))
			if err != nil {
				return err
			}
			if storageCode != code {
				return errors.New("verify code not correct")
			}
		}
	}
	return nil
}

// Verify2FaHandler do custom 2fa verification action
func (UserService) Verify2FaHandler(twoFaDto dto.TwoFaDto) (string, error) {
	userModel := userDao.GetByUserName(twoFaDto.Username)
	if viper.GetBool("security.2fa.enabled") {
		switch viper.GetString("security.2fa.handler") {
		default:
		case "sms":
			// send sms code
			if userModel.Mobile == "" {
				return "", errors.New("mobile not valid")
			}
			return userModel.Mobile, smsHandler.Send(userModel.Mobile)
		}
	}
	return "", errors.New("not found handler")
}

// AssignRoleByRoleIds - assign roles to specific user
func (UserService) AssignRoleByRoleIds(userId string, roles string) {
	// update roles
	rs := roleDao.GetRolesByIds(roles)
	var groups [][]string
	for _, role := range rs {
		groups = append(groups, []string{userId, role.RoleName})
	}
	user.OverwriteRoles(userId, groups)
}

// AssignRole - assign roles to specific user
// 这个方法同时作用与用户角色，用户用户组
func (UserService) AssignRole(userId string, roleNames []string) {
	var roles [][]string
	for _, role := range roleNames {
		if userId == "" || role == "" {
			continue
		}
		roles = append(roles, []string{userId, role})
	}
	user.OverwriteRoles(userId, roles)
}

// GetRelatedDomains - get related domains
func (UserService) GetRelatedDomains(uid string) []model.Domain {
	var domains []model.Domain
	var single = map[string]bool{}
	//1.get roles by user
	roles := perm.GetGroupsByUser(uid)
	//2.get domains by roles
	for _, rn := range roles {
		role := roleDao.GetByName(rn[1])
		if role.Domain.Code == "root" {
			continue
		}
		if _, ok := single[role.Domain.Code]; !ok {
			single[role.Domain.Code] = true
			domains = append(domains, role.Domain)
		}
	}
	return domains
}

// GetAllRoles would return all roles of a user
func (UserService) GetAllRoles(uid string) []string {
	groups := perm.GetGroupsByUser(uid)
	roles := []string{}
	for _, group := range groups {
		roles = append(roles, group[1])
	}
	return roles
}

// GetAllPermissions - get all permission by specific user
func (UserService) GetAllPermissions(uid string) []string {
	perms := []string{}
	var path = map[string]bool{}
	for _, perm := range perm.GetAllPermsByUser(uid) {
		prefix := strings.Split(perm[1], ":")
		seg := strings.Split(prefix[0], "/")
		ss := ""
		for _, s := range seg[1:] {
			ss += "/" + s
			if ok := path[ss]; !ok {
				path[ss] = true
				perms = append(perms, ss)
			}
		}
		perms = append(perms, perm[1])
	}
	return perms
}

//GetPermissionsOfDomain - Get pure permission list  in specific domain(another backend system)
func (UserService) GetPermissionsOfDomain(uid string, domain string) []string {
	perms := perm.GetAllPermsByUser(uid)
	var polices []string
	for _, p := range perms {
		if p[3] == domain {
			polices = append(polices, p[1])
		}
	}
	return polices
}

//GetDataPermissionsOfDomain - Get data permission list  in specific domain(another backend system)
func (UserService) GetDataPermissionsOfDomain(uid string, domain string) []map[string]string {
	gs := perm.GetGroupsByUser(uid)
	var (
		polices []map[string]string
		roles []string
	)
	for _, p := range gs {
		roles = append(roles,p[1])
	}
	for _,r := range roleDao.GetRolesByNames(roles){
		for _,dp := range r.DataPerm {
			if dp.PermsType == 2 {
				polices = append(polices, map[string]string{
					"perm": dp.Perms,
					"rule": dp.PermsRule,
				})
			}
		}
	}
	return polices
}

//GetMenusOfDomain - get menus in specific domain
func (UserService) GetMenusOfDomain(uid string, domain string) []model.Role {
	roles := perm.GetGroupsByUser(uid)
	var roleNames []string
	for _, r := range roles {
		roleNames = append(roleNames, r[1])
	}
	return roleDao.GetRolesByNames(roleNames)
}

// MoveToAnotherDepartment - move users to another department
func (UserService) MoveToAnotherDepartment(uids []string, target int) error {
	return userDao.UpdateDepartment(uids, target)
}

//VerifyDTAndReturnUserInfo - verify dingtalk and return user info
func (u UserService) VerifyDTAndReturnUserInfo(code string) (model.User, error) {
	dtUser, err := login.GetDingTalkUserInfo(code)
	if err != nil {
		return model.User{}, err
	}
	thirdUser, err := userOauthDao.GetUserByOpenId(dtUser.Openid, 1)
	user := u.InfoOfId(dto.GeneralGetDto{Id:thirdUser.UserId})
	if err == nil {
		return user, nil
	}
	return model.User{}, err
}

func (u UserService) UnBindUserDingtalk(from int, uid int) error {
	return userOauthDao.DeleteByUseridAndFrom(from, uid)
}

func (u UserService) GetBindOauthUserInfo(uid int) (UserInfo model.UserOAuth) {
	return userOauthDao.Get(uid)
}

//GetDomainMenu -  get specific user's menus of specific domain
func (u UserService) GetDomainMenu(uid string, domain string) []model.Menu {
	roles := u.GetAllRoles(uid)
	mids := []string{}
	for _, r := range roleDao.GetRolesByNames(roles) {
		if r.Domain.Code == domain {
			mids = append(mids, r.MenuIds)
		}
	}
	return menuDao.GetMenusByIds(strings.Join(mids, ","))
}

//CheckPermission - check user's permission in specific domain with specific policy
func (u UserService) CheckPermission(uid string, domain string, policy string) bool {
	//Could it be an alias?
	domainModel := domainDao.GetByCode(domain)
	row := menuPermAliasDao.GetByAlias(policy, domainModel.Id)
	if row.Id > 0 {
		policy = row.Perms
	}
	log.Info(fmt.Sprintf("check permission for : %#v,%#v,%#v", uid, policy, domain))
	return perm.Enforce(uid, policy, "*", domain)
}

// insert login log
func (u UserService) InsertLoginLog(loginLogDto *dto.LoginLogDto) error {
	return logDao.Create(loginLogDto)
}

// GetLastPwdChangeDaySinceNow check when user changed pwd
// if account did not change pwd until 90 days later,should use user created time instead
func (u UserService) GetLastPwdChangeDaySinceNow(uDto dto.GeneralGetDto) (ok bool, days int) {
	if viper.GetInt("security.level") == 0 {
		return false, -1
	}
	oLog := operationLogDao.GetLatestPwdLogOfAccount(uDto.Id)
	// Got action log
	var lastTime time.Time
	if oLog.Id > 0 {
		lastTime = oLog.CreateTime
	} else {
		userInfo := userDao.Get(uDto.Id, false)
		lastTime = userInfo.CreateTime
	}
	deadLineTime := lastTime.Add(time.Second * 24 * 3600 * viper.GetDuration("login.pwdExpiredDays"))
	diff := deadLineTime.Sub(time.Now()).Seconds()
	//less then 7 days,should warn login user to change his/her password
	if diff <= 24*3600*viper.GetFloat64("login.pwdWarningDays") {
		return true, int(math.Ceil(diff / (24 * 3600)))
	}
	return false, -1
}
