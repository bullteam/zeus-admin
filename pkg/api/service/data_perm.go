package service

import (
	"context"
	"fmt"
	"html/template"
	"strconv"
	"zeus/pkg/api/dao"
	"zeus/pkg/api/dto"
	"zeus/pkg/api/log"
	"zeus/pkg/api/model"
)

var dataPermDao = dao.DataPerm{}

// DataPermService
type DataPermService struct {
}

// get info by id
func (DataPermService) InfoOfId(dto dto.GeneralGetDto) model.DataPerm {
	return dataPermDao.Get(dto.Id)
}

// List
func (DataPermService) List(dto dto.GeneralListDto) ([]model.DataPerm, int64) {
	return dataPermDao.List(dto)
}

// Create
func (DataPermService) Create(dto dto.DataPermAddDto) model.DataPerm {
	dpsModel := model.DataPerm{
		DomainId:  dto.DomainId,
		ParentId:  dto.ParentId,
		Name:      dto.Name,
		Perms:     dto.Perms,
		PermsRule: dto.PermsRule,
		PermsType: dto.PermsType,
		OrderNum:  dto.OrderNum,
		Remarks:   dto.Remarks,
	}
	c := dataPermDao.Create(&dpsModel)
	if c.Error != nil {
		log.Error(c.Error.Error())
	}
	return dpsModel
}

// Update
func (DataPermService) Update(dto dto.DataPermEditDto) int64 {
	dpsModel := model.DataPerm{
		Id:        dto.Id,
		DomainId:  dto.DomainId,
		ParentId:  dto.ParentId,
		Name:      dto.Name,
		Perms:     dto.Perms,
		PermsRule: dto.PermsRule,
		PermsType: dto.PermsType,
		OrderNum:  dto.OrderNum,
		Remarks:   dto.Remarks,
	}

	c := dataPermDao.Update(&dpsModel)
	return c.RowsAffected
}

// Delete
func (DataPermService) Delete(dto dto.GeneralDelDto) int64 {
	dpsModel := model.DataPerm{
		Id: dto.Id,
	}
	c := dataPermDao.Delete(&dpsModel)
	return c.RowsAffected
}

// GetDataPerm
func (DataPermService) GetDataPermByRoute(ctx context.Context,route string) map[string]string {
	// 1. list all related
	// 2. pick the top 1 according to ordering
	dps := UserService.GetDataPermissionsOfDomain(UserService{},fmt.Sprintf("%#v",ctx.Value("userId")),RootDomainCode)
	perms := map[string]string{}
	weight := 0
	for _,dp := range dps {
		if dp["perm"] != route {
			continue
		}
		w,_ := strconv.Atoi(dp["weight"])
		if w > weight {
			weight = w
			perms = dp
		}
	}
	return perms
}

// GenerateDtoConditions
func (DataPermService) GenerateConditionsSql(ctx context.Context,p string) string {
	account := UserService.InfoOfId(UserService{},dto.GeneralGetDto{Id: int(ctx.Value("userId").(float64))})
	tmpl,err := template.New(p).Parse(p)
	if err != nil {
		_ = tmpl.Execute(nil,account)
	}
	return ""
}
//func (DataPermService) DtoAppendFilter(ctx *gin.Context, gdto *dto.GeneralListDto) {
//	uid := fmt.Sprintf("%#v", ctx.Value("userId").(float64))
//	//log.Info(fmt.Sprintf("%#v -> %#v",uid,ctx.Request.URL.Path))
//	// todo : check if uid has connection to current route,
//	// which means there was a data perm rule
//	// so may has a map struct serve for url route - handler stuff
//	// let program knows that how to deal with a specific route
//	dps := UserService.GetDataPermissionsOfDomain(UserService{}, uid, "root")
//	for _, dp := range dps {
//		if dp["perm"] == strings.TrimLeft(ctx.Request.URL.Path, "/") {
//			log.Info("I should do a filter here")
//			dpHandler[dp["perm"]+"@belong-to"](ctx, gdto)
//			log.Info(fmt.Sprintf("dto is %s", gdto.Q))
//		}
//	}
//	//gdto.Q = "id=1"
//}

//var dpHandler = map[string]func(context.Context, *dto.GeneralListDto){
//	"v1/domains@belong-to": func(ctx context.Context, gdto *dto.GeneralListDto) {
//		uid := fmt.Sprintf("%#v", ctx.Value("userId").(float64))
//		dms := UserService.GetRelatedDomains(UserService{}, uid, false)
//		dids := []string{}
//		for _, dm := range dms {
//			dids = append(dids, strconv.Itoa(dm.Id))
//		}
//		gdto.Q = "(" + strings.Join(dids, ",") + ")"
//	},
//}
