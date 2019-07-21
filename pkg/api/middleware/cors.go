package middleware

import (
	"github.com/gin-contrib/cors"
	"github.com/gin-gonic/gin"
	"github.com/spf13/viper"
	"time"
)

func Cors() gin.HandlerFunc {
	return cors.New(cors.Config{
		AllowOrigins:     viper.GetStringSlice("cors.allow_origins"),
		AllowMethods:     viper.GetStringSlice("cors.allow_methods"),
		AllowHeaders:     viper.GetStringSlice("cors.allow_headers"),
		AllowCredentials: viper.GetBool("cors.allow_credentials"),
		MaxAge:           time.Second * time.Duration(viper.GetInt("cors.max_age")),
	})
}
