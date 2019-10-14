package ldap

import (
	"github.com/spf13/viper"
	"zeus/pkg/api/log"
)

var ldapConn LDAP_CONFIG

func Setup() {
	ldapConn = LDAP_CONFIG{
		Addr:       viper.GetString("ldap.addr"),
		BaseDn:     viper.GetString("ldap.baseDn"),
		UserDn:     viper.GetString("ldap.userDn"),
		BindDn:     viper.GetString("ldap.bindDn"),
		BindPass:   viper.GetString("ldap.bindPass"),
		AuthFilter: viper.GetString("ldap.authFilter"),
		Attributes: viper.GetStringSlice("ldap.attributes"),
		TLS:        viper.GetBool("ldap.tls"),
		StartTLS:   viper.GetBool("ldap.startTLS"),
	}
	e := ldapConn.Connect()
	if e != nil {
		log.Fatal("ldap connect fail!")
	} else {
		//defer ldapConn.Close()
	}
	log.Info("Successfully init ldap config")
}

func GetLdap() LDAP_CONFIG {
	return ldapConn
}
