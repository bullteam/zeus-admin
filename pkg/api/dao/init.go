package dao

import (
	"fmt"
	"github.com/gin-gonic/gin"
	"github.com/jinzhu/gorm"
	_ "github.com/jinzhu/gorm/dialects/mysql" // import mysql driver
	"github.com/spf13/viper"
	"zeus/pkg/api/log"
)

var (
	db *gorm.DB
)

// migrate migrates database schemas.
func migrate() {

}

// Setup : Connect to mysql database
func Setup() {
	var err error
	var conn = viper.GetString("mysql.dsn")
	log.Debug(conn)
	db, err = gorm.Open("mysql", conn)
	if err != nil {
		log.Fatal(fmt.Sprintf("Failed to connect database %s", err.Error()))
	} else {
		db.DB().SetMaxIdleConns(viper.GetInt("mysql.pool.min"))
		db.DB().SetMaxOpenConns(viper.GetInt("mysql.pool.max"))
		if gin.Mode() != gin.ReleaseMode {
			db.LogMode(true)
		}
	}
	log.Info("Successfully connect to database")
}

// Shutdown - close database connection
func Shutdown() error {
	log.Info("Closing database's connections")
	return db.Close()
}

// GetDb - get a database connection
func GetDb() *gorm.DB {
	return db
}
