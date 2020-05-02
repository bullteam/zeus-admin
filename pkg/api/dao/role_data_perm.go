package dao

import (
	"fmt"
	"zeus/pkg/api/dto"
	"zeus/pkg/api/model"
)

type RoleDataPermDao struct {
}

// assign data permission
func (dao RoleDataPermDao) InsertMulti(dtos []dto.AssignDataPermDto) error {
	db := GetDb()
	sql := "insert into role_data_perm (role_id,data_perm_id) values "
	for key, v := range dtos {
		if len(dtos)-1 == key {
			sql += fmt.Sprintf("(%d,%d);", v.RoleId, v.DataPermId)
		} else {
			sql += fmt.Sprintf("(%d,%d),", v.RoleId, v.DataPermId)
		}
	}

	return db.Exec(sql).Error
}

// batch delete
func (dao RoleDataPermDao) DeleteMulti(roleId int, dataPermIds []int) error {
	db := GetDb()
	return db.Where("role_id = ? and data_perm_id in(?)", roleId, dataPermIds).
		Delete(model.RoleDataPerm{}).
		Error
}

// delete by dataPermId
func (dao RoleDataPermDao) DeleteByDataPermId(dataPermId int) error {
	db := GetDb()
	return db.Where("data_perm_id=?", dataPermId).
		Delete(model.RoleDataPerm{}).
		Error
}

// delete by role_id
func (dao RoleDataPermDao) DeleteByRoleId(roleId int) error {
	db := GetDb()
	return db.Where("role_id = ?", roleId).Delete(model.RoleDataPerm{}).Error
}

// get by role_id
func (dao RoleDataPermDao) GetByRoleId(roleId int) ([]model.GetByRoleIdData, int64) {
	var rdps []model.GetByRoleIdData
	var total int64
	db := GetDb()
	fields := "role_data_perm.role_id,data_perm.name,data_perm.perms,data_perm.id"
	query := db.Table("role_data_perm").
		Select(fields).
		Joins("left join data_perm on role_data_perm.data_perm_id=data_perm.id").
		Where("role_data_perm.role_id=?", roleId)

	rows, _ := query.Rows()
	query.Count(&total)
	defer rows.Close()
	for rows.Next() {
		var data model.GetByRoleIdData
		_ = db.ScanRows(rows, &data)
		rdps = append(rdps, data)
	}

	return rdps, total
}
