package ldap

import (
	"github.com/spf13/viper"
	"zeus/pkg/api/log"
)

var ldapConn LdapConfig

func Setup() {
	ldapConn = LdapConfig{
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
	log.Info("Successfully init ldap config")
}

func ConnectLdap() {
	e := ldapConn.Connect()
	if e != nil {
		log.Fatal("ldap connect fail!")
	}
}

func GetLdap() LdapConfig {
	ConnectLdap()
	return ldapConn
}
