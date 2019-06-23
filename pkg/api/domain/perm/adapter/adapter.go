package adapter

import (
	"github.com/casbin/casbin/model"
	"zeus/pkg/api/domain/perm/adapter/mysql"
)

type Adapter interface {
	LoadPolicy(model model.Model) error
	SavePolicy(model model.Model) error
	AddPolicy(sec string, ptype string, rule []string) error
	RemovePolicy(sec string, ptype string, rule []string) error
	RemoveFilteredPolicy(sec string, ptype string, fieldIndex int, fieldValues ...string) error
}

func NewMysqlAdapter() *mysqlAdapter {
	ad := &mysqlAdapter{
		a: mysql.NewGormAdapter(),
	}
	return ad
}

type mysqlAdapter struct {
	a Adapter
}

func (ca *mysqlAdapter) LoadPolicy(model model.Model) error { return ca.a.LoadPolicy(model) }
func (ca *mysqlAdapter) SavePolicy(model model.Model) error { return ca.a.SavePolicy(model) }
func (ca *mysqlAdapter) AddPolicy(sec string, ptype string, rule []string) error {
	return ca.a.AddPolicy(sec, ptype, rule)
}
func (ca *mysqlAdapter) RemovePolicy(sec string, ptype string, rule []string) error {
	return ca.a.RemovePolicy(sec, ptype, rule)
}
func (ca *mysqlAdapter) RemoveFilteredPolicy(sec string, ptype string, fieldIndex int, fieldValues ...string) error {
	return ca.a.RemoveFilteredPolicy(sec, ptype, fieldIndex, fieldValues...)
}
