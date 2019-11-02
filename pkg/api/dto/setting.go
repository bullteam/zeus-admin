package dto

type SettingDTO struct {
	LdapUrl            string `form:"ldapUrl" json:"ldapUrl"`
	LdapSearchDN       string `form:"ldapSearchDN" json:"ldapSearchDN"`
	LdapSearchPassword string `form:"ldapSearchPassword" json:"ldapSearchPassword"`
	LdapBaseDN         string `form:"ldapBaseDN" json:"ldapBaseDN"`
	LdapFilter         string `form:"ldapFilter" json:"ldapFilter"`
	LdapUID            string `form:"ldapUID" json:"ldapUID"`
	LdapGroupBaseDN    string `form:"ldapGroupBaseDN" json:"ldapGroupBaseDN"`
	LdapGroupFilter    string `form:"ldapGroupFilter" json:"ldapGroupFilter"`
	LdapGroupGID       string `form:"ldapGroupGID" json:"ldapGroupGID"`
	LdapGroupAdminDN   string `form:"ldapGroupAdminDN" json:"ldapGroupAdminDN"`
}

type EmailSettingDTO struct {
	Port         int    `form:"port" json:"port"`
	SmtpServer   string `form:"smtpServer" json:"smtpServer"`
	SmtpAddress  string `form:"smtpAddress" json:"smtpAddress"`
	SmtpUser     string `form:"smtpUser" json:"smtpUser"`
	SmtpPassword string `form:"smtpPassword" json:"smtpPassword"`
}
