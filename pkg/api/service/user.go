package service

import (
	"github.com/spf13/viper"
	"zeus/pkg/api/dao"
	"zeus/pkg/api/domain/account"
	"zeus/pkg/api/domain/account/login"
	"zeus/pkg/api/domain/perm"
	"zeus/pkg/api/domain/user"
	"zeus/pkg/api/dto"
	"zeus/pkg/api/log"
	"zeus/pkg/api/model"
	dingtalk "github.com/icepy/go-dingtalk/src"
)

const pwHashBytes = 64

var userDao = dao.User{}

type UserService struct {
	userOAuthDao *dao.UserOAuthDao
}

type DingtalkUserInfo struct {
	Openid  string
	Unionid string
	Nick    string
	Dingid  string
}


func (us UserService) InfoOfId(dto dto.GeneralGetDto) model.User {
	return userDao.Get(dto.Id, true)
}

// List - users list with pagination
func (us UserService) List(dto dto.GeneralListDto) ([]model.User, int64) {
	return userDao.List(dto)
}

// Create - create a new account
func (us UserService) Create(dto dto.UserCreateDto) model.User {
	salt, _ := account.MakeSalt()
	pwd, _ := account.HashPassword(dto.Password, salt)
	userModel := model.User{
		Username:     dto.Username,
		Mobile:       dto.Mobile,
		Password:     pwd,
		DepartmentId: dto.DepartmentId,
		Salt:         salt,
	}
	c := userDao.Create(&userModel)
	if c.Error != nil {
		log.Error(c.Error.Error())
	}
	return userModel
}

// Update - update user's information
func (us UserService) Update(dto dto.UserEditDto) int64 {
	userModel := model.User{
		Id:           dto.Id,
		Username:     dto.Username,
		Mobile:       dto.Mobile,
		DepartmentId: dto.DepartmentId,
		Status:       dto.Status,
		Title:        dto.Title,
		Realname:     dto.Realname,
		Email:        dto.Email,
	}

	c := userDao.Update(&userModel)
	return c.RowsAffected
}

// UpdateStatus - update user's status only
func (UserService) UpdateStatus(dto dto.UserEditStatusDto) int64 {
	u := userDao.Get(dto.Id, false)
	u.Status = dto.Status
	c := userDao.Update(&u)
	return c.RowsAffected
}

// UpdatePassword - update password only
func (UserService) UpdatePassword(dto dto.UserEditPasswordDto) int64 {
	salt, _ := account.MakeSalt()
	pwd, _ := account.HashPassword(dto.Password, salt)
	u := userDao.Get(dto.Id, false)
	u.Password = pwd
	u.Salt = salt
	c := userDao.Update(&u)
	return c.RowsAffected
}

// Delete - delete user
func (us UserService) Delete(dto dto.GeneralDelDto) int64 {
	userModel := model.User{
		Id: dto.Id,
	}
	c := userDao.Delete(&userModel)
	return c.RowsAffected
}

//VerifyAndReturnUserInfo - login and return user info
func (UserService) VerifyAndReturnUserInfo(dto dto.LoginDto) (bool, model.User) {
	userModel := userDao.GetByUserName(dto.Username)
	if login.VerifyPassword(dto.Password, userModel) {
		return true, userModel
	}
	return false, model.User{}
}

//AssignRole - assign roles to specific user
func (UserService) AssignRole(userId string, roleNames []string) {
	var groups [][]string
	for _, role := range roleNames {
		groups = append(groups, []string{userId, role})
	}
	user.OverwriteRoles(userId, groups)
}

//GetRelatedDomains - get related domains
func (UserService) GetRelatedDomains(uid string) []model.Domain {
	var domains []model.Domain
	//1.get roles by user
	roles := perm.GetGroupsByUser(uid)
	//2.get domains by roles
	for _, rn := range roles {
		role := roleDao.GetByName(rn[1])
		domains = append(domains, role.Domain)
	}
	return domains
}

// GetAllPermissions - get all permission by specific user
func (UserService) GetAllPermissions(uid string) []string {
	perms := []string{}
	for _, p := range perm.GetAllPermsByUser(uid) {
		perms = append(perms, p[1])
	}
	return perms
}

// MoveToAnotherDepartment - move users to another department
func (UserService) MoveToAnotherDepartment(uids []string, target int) error {
	return userDao.UpdateDepartment(uids, target)
}



//钉钉登陆
func (us UserService) LoginByDingtalk(code string) (user *model.UserOAuth, err error) {
	Info, err := getUserInfo(code)
	if err != nil {
		return nil, err
	}
	User, err := us.userOAuthDao.GetUserByOpenId(Info.Openid, 1)
	if err == nil {
		return User, nil
	}
	return nil, err
}

func getUserInfo(code string) (UserInfo *DingtalkUserInfo, err error) {
	c := GetCompanyDingTalkClient()
	c.RefreshSNSAccessToken()
	perInfo, err := c.SNSGetPersistentCode(code)
	if err != nil {
		return nil, err
	}
	snstoken, err := c.SNSGetSNSToken(perInfo.OpenID, perInfo.PersistentCode)
	if err != nil {
		return nil, err
	}
	Info, _ := c.SNSGetUserInfo(snstoken.SnsToken)
	userInfo := &DingtalkUserInfo{
		Info.UserInfo.OpenID,
		Info.UserInfo.UnionID,
		Info.UserInfo.Nick,
		Info.UserInfo.DingID,
	}
	return userInfo, nil
}

func (us UserService) UnBindUserDingtalk(from int, user_id int) error {
	return us.userOAuthDao.DeleteByUseridAndFrom(from, user_id)
}

func GetCompanyDingTalkClient() *dingtalk.DingTalkClient {
	SNSAppID := viper.GetString("dingtalk.SNSAppID")
	SNSSecret := viper.GetString("dingtalk.SNSSecret")
	config := &dingtalk.DTConfig{
		SNSAppID:  SNSAppID,
		SNSSecret: SNSSecret,
	}
	return dingtalk.NewDingTalkCompanyClient(config)
}

func (us UserService) GetBindOauthUserInfo(userid int) (UserInfo model.UserOAuth) {
	return us.userOAuthDao.Get(userid)
}
