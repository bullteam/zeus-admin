package service

import (
	dingtalk "github.com/bullteam/go-dingtalk/src"
	"zeus/pkg/api/domain/sync/dingdingtalk"
	"zeus/pkg/api/dto"
)

type DingTalkService struct{}

func (ds DingTalkService) SyncUsersAndDepartments() {
	departments, err := dingdingtalk.GetDepartments()
	if err != nil {
		return
	}
	ds.SyncRecursive(departments.(map[int][]dingtalk.Department), 0, 0)
}

func (ds DingTalkService) SyncRecursive(departments map[int][]dingtalk.Department, id int, pid int) {
	for _, d := range departments[id] {
		created := DeptService.Create(DeptService{}, dto.DeptCreateDto{
			Name:     d.Name,
			ParentId: pid,
		})
		if _, ok := departments[d.Id]; ok {
			ds.SyncRecursive(departments, d.Id, created.Id)
		}
		users, err2 := dingdingtalk.GetUsers(d.Id)
		if err2 != nil || len(users.([]dingtalk.UDetailedList)) < 1 {
			continue
		}
		for _, u := range users.([]dingtalk.UDetailedList) {
			_, _ = UserService.Create(UserService{}, dto.UserCreateDto{
				Username:     u.Name,
				Mobile:       u.Mobile,
				DepartmentId: created.Id,
				Password:     "zeus@2019",
			})
		}
	}
}
