package dao

import (
	"fmt"
	"github.com/jinzhu/gorm"
	"zeus/pkg/api/dto"
	"zeus/pkg/api/model"
)

type UserOAuthDao struct {
}

func (u UserOAuthDao) Get(id int) model.UserOAuth {
	var userOAuth model.UserOAuth
	db.Where("id = ?", id).First(&userOAuth)
	return userOAuth
}

func (u UserOAuthDao) Create(UserOAuth *model.UserOAuth) *gorm.DB {
	db := GetDb()
	return db.Save(UserOAuth)
}

func (u UserOAuthDao) Delete(UserOAuth *model.UserOAuth) *gorm.DB {
	db := GetDb()
	return db.Delete(UserOAuth)
}

// List - userOAuth list
func (u UserOAuthDao) List(listDto dto.GeneralListDto) ([]model.UserOAuth, int64) {
	var UserOAuth []model.UserOAuth
	var total int64
	db := GetDb()
	for sk, sv := range dto.TransformSearch(listDto.Q, dto.UserListSearchMapping) {
		db = db.Where(fmt.Sprintf("%s = ?", sk), sv)
	}
	db.Offset(listDto.Skip).Limit(listDto.Limit).Find(&UserOAuth)
	db.Model(&model.UserOAuth{}).Count(&total)
	fmt.Println(total)
	return UserOAuth, total
}

func (dao *UserOAuthDao) GetUserByOpenId(openid string, from int) (*model.UserOAuth, error) {
	var userOAuth *model.UserOAuth
	db.Where("openid = ? and from = ?", openid, from).Find(&userOAuth)
	return userOAuth, nil
}

func (dao *UserOAuthDao) DeleteByUseridAndFrom(from int, user_id int) error {
	db := GetDb()
	var userOAuth model.UserOAuth
	db.Where("openid = ? and from = ?", from, user_id).Delete(&userOAuth)
	return nil
}
