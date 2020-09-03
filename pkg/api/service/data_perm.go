package service

import (
	"context"
	"encoding/json"
	"fmt"
	"regexp"
	"strconv"
	"strings"
	"zeus/pkg/api/dao"
	"zeus/pkg/api/dto"
	"zeus/pkg/api/log"
	"zeus/pkg/api/model"
)

var dataPermDao = dao.DataPerm{}
var dataPermService = DataPermService{}

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
func (DataPermService) GetDataPermByRoute(ctx context.Context, route string) map[string]string {
	// 1. list all related
	// 2. pick the top 1 according to ordering
	dps := UserService.GetDataPermissionsOfDomain(UserService{}, fmt.Sprintf("%#v", ctx.Value("userId")), RootDomainCode)
	perms := map[string]string{}
	weight := 0
	for _, dp := range dps {
		if dp["perm"] != route {
			continue
		}
		w, _ := strconv.Atoi(dp["weight"])
		if w > weight {
			weight = w
			perms = dp
		}
	}
	return perms
}

// ListFilter : data permission filter
func (dps DataPermService) DataPermFilter(ctx context.Context, perms string, gdto dto.GeneralListDto) (dtoCdt string, dtoCols string) {
	dp := dps.GetDataPermByRoute(ctx, perms)
	if dp["rule"] == "" {
		return gdto.Q, dtoCols
	}
	var ruleData map[string][]string
	_ = json.Unmarshal([]byte(dp["rule"]), &ruleData)
	if len(ruleData["p"]) < 1 {
		return gdto.Q, dtoCols
	}
	sqlQuery := strings.Join(ruleData["p"], " ")
	uid := int(ctx.Value("userId").(float64))
	// pretreatment
	// todo: can it be an execution chain?
	rows, _ := dao.GetDb().Raw(strings.Replace(sqlQuery, "{@login.uid}", strconv.Itoa(uid), -1)).Rows()
	cols, _ := rows.Columns()
	var valuesMap []map[string]string
	for rows.Next() {
		values := make([]interface{}, len(cols))
		pointers := make([]interface{}, len(cols))
		for i := range values {
			pointers[i] = &values[i]
		}
		_ = rows.Scan(pointers...)
		m := map[string]string{}
		for i, v := range values {
			m[cols[i]] = fmt.Sprintf("%s", v)
		}
		valuesMap = append(valuesMap, m)
	}
	if len(ruleData["r"]) < 1 {
		return gdto.Q, dtoCols
	}
	dtoCdt = strings.Join(ruleData["r"], "|")
	re := regexp.MustCompile(`\{@p\.(\w+)\}`)
	// sql where statement presents data belongs to current user
	dtoCdt = re.ReplaceAllStringFunc(dtoCdt, func(s string) string {
		var ss []string
		p := re.FindStringSubmatch(s)
		for _, v := range valuesMap {
			ss = append(ss, v[p[1]])
		}
		return strings.Join(ss, ",")
	})
	if gdto.Q != "" {
		dtoCdt += "|" + gdto.Q
	}
    // make sql's where ... in (....) statement
	if len(ruleData["c"]) > 0 {
		dtoCols = strings.Join(ruleData["c"], ",")
	}
	return dtoCdt, dtoCols
}
