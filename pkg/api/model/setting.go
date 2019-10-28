package model

type LdapSetting struct {
	LdapUrl            string `json:"ldapUrl"`
	LdapSearchDN       string `json:"ldapSearchDN"`
	LdapSearchPassword string `json:"ldapSearchPassword"`
	LdapBaseDN         string `json:"ldapBaseDN"`
	LdapFilter         string `json:"ldapFilter"`
	LdapUID            string `json:"ldapUID"`
	LdapGroupBaseDN    string `json:"ldapGroupBaseDN"`
	LdapGroupFilter    string `json:"ldapGroupFilter"`
	LdapGroupGID       string `json:"ldapGroupGID"`
	LdapGroupAdminDN   string `json:"ldapGroupAdminDN"`
}

type EmailSetting struct {
	Port         int    `json:"port"`
	SmtpServer   string `json:"smtpServer"`
	SmtpAddress  string `json:"smtpAddress"`
	SmtpUser     string `json:"smtpUser"`
	SmtpPassword string `json:"smtpPassword"`
}
