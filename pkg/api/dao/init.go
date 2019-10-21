package dao

import (
	"fmt"
	"github.com/gin-gonic/gin"
	"github.com/jinzhu/gorm"
	_ "github.com/jinzhu/gorm/dialects/mysql"
	_ "github.com/jinzhu/gorm/dialects/sqlite"
	"github.com/spf13/viper"
	"zeus/pkg/api/log"
)

var (
	db *gorm.DB
)

const DRIVER_MYSQL = "mysql"
const DRIVER_SQLITE = "sqlite"

// Setup : Connect to mysql database
func Setup() {
	var err error
	var conn string
	switch viper.Get("database.driver") {
	case DRIVER_SQLITE:
		db, err = gorm.Open("sqlite3", viper.GetString("database.sqlite.dsn"))
		if err != nil {
			log.Error(fmt.Sprintf("Failed to connect sqlite %s", err.Error()))
		} else {
			db.LogMode(true)
		}
	case DRIVER_MYSQL:
	default:
		conn = viper.GetString("database.mysql.dsn")
		db, err = gorm.Open("mysql", conn)
		if err != nil {
			log.Error(fmt.Sprintf("Failed to connect mysql %s", err.Error()))
		} else {
			db.DB().SetMaxIdleConns(viper.GetInt("database.mysql.pool.min"))
			db.DB().SetMaxOpenConns(viper.GetInt("database.mysql.pool.max"))
			if gin.Mode() != gin.ReleaseMode {
				db.LogMode(true)
			}
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
