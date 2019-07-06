package middleware

import (
	"github.com/appleboy/gin-jwt/v2"
	"github.com/gin-gonic/gin"
	"zeus/pkg/api/model"
)

// JwtPrepare : parse jwt and set login session info
func JwtPrepare(c *gin.Context) {
	claims := jwt.ExtractClaims(c)
	user, _ := c.Get("id")
	c.Set("userId", claims["id"])
	c.Set("userName", user.(model.UserClaims).Name)
	c.Next()
}
