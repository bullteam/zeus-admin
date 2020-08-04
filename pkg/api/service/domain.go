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

var domainDao = dao.DomainDao{}

// DomainService
type DomainService struct {
}

// InfoOfId - get role info by id
func (us DomainService) InfoOfId(dto dto.GeneralGetDto) model.Domain {
	return domainDao.Get(dto.Id)
}

// List - users list with pagination
// @DataPermDtoFilter('DomainService.List')
// @DataPermResultFilter('DomainService.List')
func (us DomainService) List(ctx context.Context, gdto dto.GeneralListDto) ([]model.Domain, int64) {
	//gdto.Q = "name=~权限"
	//todo : data permission control here with a general handler
	//return UserService.GetRelatedDomains(UserService{},"2",false),1
	// gdto.Q = "id=(1,2,3,4,5)"
    gdto.Q =  us.DataPermFilter(ctx,gdto)
    // column filter
    //log.Info(gdto.Q)
	return domainDao.List(gdto)
}

// ListFilter : data permission filter
func (us DomainService) DataPermFilter(ctx context.Context,gdto dto.GeneralListDto) string {
	dp := DataPermService.GetDataPermByRoute(DataPermService{},ctx,"domains")
	if dp["rule"] == "" {
		return gdto.Q
	}
	var ruleData map[string][]string
	_ = json.Unmarshal([]byte(dp["rule"]),&ruleData)
	if len(ruleData["p"]) < 1 {
		return gdto.Q
	}
	sqlQuery := strings.Join(ruleData["p"]," ")
	uid := int(ctx.Value("userId").(float64))
	// get sql
	rows,_ := dao.GetDb().Raw(strings.Replace(sqlQuery,"{@account.Id}",strconv.Itoa(uid),-1)).Rows()
	//cdt := []string{}
	cols,_ := rows.Columns()
	var valuesMap []map[string]string
	//log.Info(fmt.Sprintf("=====%#v=====",cols))
	for rows.Next() {
		values := make([]interface{}, len(cols))
		pointers := make([]interface{}, len(cols))
		for i := range values {
			pointers[i] = &values[i]
		}
		//var ds = make([]interface{},1)
		_ = rows.Scan(pointers...)
		//log.Info(fmt.Sprintf(" ====== %s ======",values[0]))
		m := map[string]string{}
		for i,v:= range values {
			m[cols[i]] = fmt.Sprintf("%s",v)
		}
		valuesMap = append(valuesMap,m)
		//cdt = append(cdt, ds[0].(string))
	}
	//log.Info(fmt.Sprintf("=========%#v==========",valuesMap[0]["domain_id"]))
	if len(ruleData["r"]) < 1 {
		return gdto.Q
	}
	dtoCdt := strings.Join(ruleData["r"],"|")
	re := regexp.MustCompile(`\{@p\.(\w+)\}`)
	dtoCdt = re.ReplaceAllStringFunc(dtoCdt, func(s string) string {
		var ss []string
		p := re.FindStringSubmatch(s)
		for _,v := range valuesMap {
			ss = append(ss,v[p[1]])
		}
		return strings.Join(ss,",")
	})
	//log.Info(fmt.Sprintf("^^^^^^^^%#v",cs))
	//dtoCdt = strings.Replace(dtoCdt,"{@p.domain_id}",strings.Join(cdt,","),-1)
	if gdto.Q != "" {
		dtoCdt += "|" + gdto.Q
	}
	return dtoCdt
}
// Create - create a new domain
func (us DomainService) Create(dto dto.DomainCreateDto) model.Domain {
	domainModel := model.Domain{
		Name:        dto.Name,
		Callbackurl: dto.Callbackurl,
		Remark:      dto.Remark,
		Code:        dto.Code,
	}
	c := domainDao.Create(&domainModel)
	if c.Error != nil {
		log.Error(c.Error.Error())
	}
	return domainModel
}

// Update - update domain's information
func (us DomainService) Update(dto dto.DomainEditDto) int64 {
	domainModel := model.Domain{
		Id:          dto.Id,
		Name:        dto.Name,
		Callbackurl: dto.Callbackurl,
		Remark:      dto.Remark,
		Code:        dto.Code,
	}

	c := domainDao.Update(&domainModel, map[string]interface{}{
		"name":        dto.Name,
		"callbackurl": dto.Callbackurl,
		"remark":      dto.Remark,
		"code":        dto.Code,
	})
	return c.RowsAffected
}

// Delete - delete domain
func (us DomainService) Delete(dto dto.GeneralDelDto) int64 {
	domainModel := model.Domain{
		Id: dto.Id,
	}
	c := domainDao.Delete(&domainModel)
	return c.RowsAffected
}
