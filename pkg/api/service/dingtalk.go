package service

import (
	dingtalk "github.com/bullteam/go-dingtalk/src"
	"zeus/pkg/api/domain/sync/dingdingtalk"
	"zeus/pkg/api/dto"
)

type DingTalkService struct {}

func (DingTalkService) SyncUsersAndDepartments() {
	idMap := map[int] int{}
	departments,err := dingdingtalk.GetDepartments()
	if err != nil {
		return
	}
	if departments != nil {
		for _, d := range departments.([]dingtalk.Department) {
			users,err2 := dingdingtalk.GetUsers(d.Id)
			if err2 != nil || len(users.([]dingtalk.UDetailedList)) < 1 {
				continue
			}
			created := DeptService.Create(DeptService{}, dto.DeptCreateDto{
				Name:     d.Name,
				ParentId: idMap[d.ParentId],
			})
			idMap[d.Id] = created.Id
			for _, u := range users.([]dingtalk.UDetailedList) {
				_, _ = UserService.Create(UserService{}, dto.UserCreateDto{
					Username: u.Name,
					Mobile: u.Mobile,
					DepartmentId:created.Id,
					Password: "123456",
				})
			}
		}
	}
}
