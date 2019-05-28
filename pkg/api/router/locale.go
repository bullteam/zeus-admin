package router

import (
	"github.com/beego/i18n"
	"github.com/spf13/viper"
	"strings"
	"zeus/pkg/api/log"
)

var langTypes []*langType

type langType struct {
	Lang, Name string
}

func init() {
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
