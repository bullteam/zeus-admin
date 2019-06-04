package middleware

import (
	"github.com/beego/i18n"
	"github.com/spf13/viper"
	"strings"
	"zeus/pkg/api/log"
	"github.com/gin-gonic/gin"
)

var CurrentLang string
var langTypes []*langType

type langType struct {
	Lang, Name string
}

func InitLang() {
	langs := strings.Split(viper.GetString("lang.types"), "|")
	names := strings.Split(viper.GetString("lang.names"), "|")
	langTypes = make([]*langType, 0, len(langs))
	for i, v := range langs {
		langTypes = append(langTypes, &langType{
			Lang: v,
			Name: names[i],
		})
	}
	for _, lang := range langs {
		log.Debug("Loading language: " + lang)
		if err := i18n.SetMessage(lang, "config/locale/"+"locale_"+lang+".ini"); err != nil {
			log.Error("Fail to set message file: " + err.Error())
			return
		}
	}
}

/**
  设置语言
*/
func SetLangVer() gin.HandlerFunc {
	return func(c *gin.Context) {
		langs := strings.Split(viper.GetString("lang.types"), "|")
		names := strings.Split(viper.GetString("lang.names"), "|")
		langTypes := make([]*langType, 0, len(langs))
		for i, v := range langs {
			langTypes = append(langTypes, &langType{
				Lang: v,
				Name: names[i],
			})
		}
		hasCookie := false
		// 1. Check URL arguments.
		lang := c.GetString("lang")
		// 2. Get language information from cookies.
		if len(lang) == 0 {
			lang, _ = c.Cookie("lang")
			hasCookie = true
		}

		// Check again in case someone modify by purpose.
		if !i18n.IsExist(lang) {
			lang = ""
			hasCookie = false
		}

		// 3. Get language information from 'Accept-Language'.
		if len(lang) == 0 {
			al := c.Request.Header.Get("Accept-Language")
			if len(al) > 4 {
				al = al[:5] // Only compare first 5 letters.
				if i18n.IsExist(al) {
					lang = al
				}
			}
		}

		// 4. Default language is English.
		if len(lang) == 0 {
			lang = "zh-CN"
		}

		curLang := langType{
			Lang: lang,
		}

		// Save language information in cookies.
		if !hasCookie {
			c.SetCookie("lang", curLang.Lang, 1<<31-1, "/",viper.GetString("domain"),false,false)
		}

		restLangs := make([]*langType, 0, len(langTypes)-1)
		for _, v := range langTypes {
			if lang != v.Lang {
				restLangs = append(restLangs, v)
			} else {
				curLang.Name = v.Name
			}
		}
		// Set language properties.
		CurrentLang = curLang.Lang
	}
}

func GetLang() string {
	return CurrentLang
}