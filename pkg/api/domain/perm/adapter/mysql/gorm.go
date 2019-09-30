package mysql

import (
	"fmt"
	"github.com/casbin/casbin/model"
	"github.com/casbin/casbin/persist"
	"github.com/jinzhu/gorm"
	"runtime"
	"strings"
	"zeus/pkg/api/dao"
	"zeus/pkg/api/log"
	apiModel "zeus/pkg/api/model"
)

// MysqlGormAdapter represents the Xorm adapter for policy storage.
type GormAdapter struct {
	o *gorm.DB
}

// finalizer is the destructor for MysqlGormAdapter.
func finalizer(a *GormAdapter) {
}

func NewGormAdapter() *GormAdapter {
	a := &GormAdapter{dao.GetDb()}
	// Call the destructor when the object is released.
	runtime.SetFinalizer(a, finalizer)
	return a
}

func loadPolicyLine(line apiModel.CasbinRule, model model.Model) {
	lineText := line.PType
	if line.V0 != "" {
		lineText += ", " + line.V0
	}
	if line.V1 != "" {
		lineText += ", " + line.V1
	}
	if line.V2 != "" {
		lineText += ", " + line.V2
	}
	if line.V3 != "" {
		lineText += ", " + line.V3
	}
	if line.V4 != "" {
		lineText += ", " + line.V4
	}
	if line.V5 != "" {
		lineText += ", " + line.V5
	}

	persist.LoadPolicyLine(lineText, model)
}

// LoadPolicy loads policy from database.
func (a *GormAdapter) LoadPolicy(model model.Model) error {
	var lines []apiModel.CasbinRule
	a.o.Find(&lines)
	for _, line := range lines {
		loadPolicyLine(line, model)
	}

	return nil
}

func savePolicyLine(ptype string, rule []string) apiModel.CasbinRule {
	line := apiModel.CasbinRule{}

	line.PType = ptype
	if len(rule) > 0 {
		line.V0 = rule[0]
	}
	if len(rule) > 1 {
		line.V1 = rule[1]
	}
	if len(rule) > 2 {
		line.V2 = rule[2]
	}
	if len(rule) > 3 {
		line.V3 = rule[3]
	}
	if len(rule) > 4 {
		line.V4 = rule[4]
	}
	if len(rule) > 5 {
		line.V5 = rule[5]
	}

	return line
}

// SavePolicy saves policy to database.
func (a *GormAdapter) SavePolicy(model model.Model) error {
	var lines []*apiModel.CasbinRule
	for ptype, ast := range model["p"] {
		for _, rule := range ast.Policy {
			line := savePolicyLine(ptype, rule)
			lines = append(lines, &line)
		}
	}

	for ptype, ast := range model["g"] {
		for _, rule := range ast.Policy {
			line := savePolicyLine(ptype, rule)
			lines = append(lines, &line)
		}
	}
	var err error
	a.o.Begin()
	for _, line := range lines {
		if do := a.o.Save(line); do.Error != nil {
			a.o.Rollback()
			err = do.Error
		}
	}
	a.o.Commit()
	return err
}

// AddPolicy adds a policy rule to the storage.
func (a *GormAdapter) AddPolicy(sec string, ptype string, rule []string) error {
	line := savePolicyLine(ptype, rule)
	do := a.o.Save(&line)
	return do.Error
}

// RemovePolicy removes a policy rule from the storage.
func (a *GormAdapter) RemovePolicy(sec string, ptype string, rule []string) error {
	line := savePolicyLine(ptype, rule)
	//_, err := a.o.Delete(&line, "p_type", "v0", "v1", "v2", "v3", "v4", "v5")
	do := a.o.Delete(apiModel.CasbinRule{}, "p_type=? and v0=? and v1=? and v2=? and v3=? and v4=? and v5=?", line.PType,
		line.V0,
		line.V1,
		line.V2,
		line.V3,
		line.V4,
		line.V5)
	return do.Error
}

// RemoveFilteredPolicy removes policy rules that match the filter from the storage.
func (a *GormAdapter) RemoveFilteredPolicy(sec string, ptype string, fieldIndex int, fieldValues ...string) error {
	line := apiModel.CasbinRule{}
	line.PType = ptype
	filter := []string{}
	filter = append(filter, "p_type=?")
	val := []interface{}{line.PType}
	if fieldIndex <= 0 && 0 < fieldIndex+len(fieldValues) {
		line.V0 = fieldValues[0-fieldIndex]
		if line.V0 != "" {
			filter = append(filter, "v0=?")
			val = append(val, line.V0)
		}
	}
	if fieldIndex <= 1 && 1 < fieldIndex+len(fieldValues) {
		line.V1 = fieldValues[1-fieldIndex]
		if line.V1 != "" {
			filter = append(filter, "v1=?")
			val = append(val, line.V1)
		}
	}
	if fieldIndex <= 2 && 2 < fieldIndex+len(fieldValues) {
		line.V2 = fieldValues[2-fieldIndex]
		if line.V2 != "" {
			filter = append(filter, "v2=?")
			val = append(val, line.V2)
		}
	}
	if fieldIndex <= 3 && 3 < fieldIndex+len(fieldValues) {
		line.V3 = fieldValues[3-fieldIndex]
		if line.V3 != "" {
			filter = append(filter, "v3=?")
			val = append(val, line.V3)
		}
	}
	if fieldIndex <= 4 && 4 < fieldIndex+len(fieldValues) {
		line.V4 = fieldValues[4-fieldIndex]
		if line.V4 != "" {
			filter = append(filter, "v4=?")
			val = append(val, line.V4)
		}
	}
	if fieldIndex <= 5 && 5 < fieldIndex+len(fieldValues) {
		line.V5 = fieldValues[5-fieldIndex]
		if line.V5 != "" {
			filter = append(filter, "v5=?")
			val = append(val, line.V5)
		}
	}
	//_, err := a.o.Delete(&line, filter...)
	log.Info(fmt.Sprintf("%#v", filter))
	log.Info(fmt.Sprintf("%#v", val))
	params := []interface{}{}
	params = append(params, strings.Join(filter, " and "))
	params = append(params, val...)
	log.Info(fmt.Sprintf("%#v", params))
	//do := a.o.Delete(apiModel.CasbinRule{}, "p_type=? and v0=? and v1=? and v2=? and v3=? and v4=? and v5=?", line.PType,
	//	line.V0,
	//	line.V1,
	//	line.V2,
	//	line.V3,
	//	line.V4,
	//	line.V5)
	do := a.o.Delete(apiModel.CasbinRule{}, params...)
	return do.Error
}
