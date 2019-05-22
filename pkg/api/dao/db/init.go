package db

import (
	"errors"
	"fmt"
	"github.com/jinzhu/gorm"
	_ "github.com/jinzhu/gorm/dialects/mysql" // import mysql driver
	"github.com/spf13/viper"
	"zeus/pkg/api/util"
)

var (
	db *gorm.DB
)

// migrate migrates database schemas.
func migrate() {

}

var (
	// ErrInvalidParams defines invalid params error.
	ErrInvalidParams = errors.New("invalid params")
	// ErrSQLExec defines sql execution error.
	ErrSQLExec = errors.New("sql executed fail")
)

func Init() {
	var err error
	db, err = gorm.Open("mysql", viper.GetString("db.default"))
	if err != nil {
		panic(fmt.Errorf("failed to connect database %s", err))
	}
	db.DB().SetMaxIdleConns(10)
	db.DB().SetMaxOpenConns(100)
	db.LogMode(components.Debugs())

	components.Info("[db] init success")
}
