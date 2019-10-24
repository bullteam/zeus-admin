package dto

type InstallDTO struct {
	SqlType              string `form:"sqlType" json:"sqlType"`
	DataPath             string `form:"dataPath" json:"dataPath"`
	SiteName             string `form:"siteName" json:"siteName"`
	Port                 int    `form:"port" json:"port"`
	BaseUrl              string `form:"baseUrl" json:"baseUrl"`
	LogPath              string `form:"logPath" json:"logPath"`
	SqlHost              string `form:"sqlHost" json:"sqlHost"`
	SqlUser              string `form:"sqlUser" json:"sqlUser"`
	SqlPassword          string `form:"sqlPassword" json:"sqlPassword"`
	SqlName              string `form:"sqlName" json:"sqlName"`
	SqlChatset           string `form:"sqlChatset" json:"sqlChatset"`
	SqlSSL               bool   `form:"sqlSSL" json:"sqlSSL"`
	IsShowMailSetting    bool   `form:"isShowMailSetting" json:"isShowMailSetting"`
	SmtpServer           string `form:"smtpServer" json:"smtpServer"`
	SmtpAddress          string `form:"smtpAddress" json:"smtpAddress"`
	SmtpUser             string `form:"smtpUser" json:"smtpUser"`
	SmtpPassword         string `form:"smtpPassword" json:"smtpPassword"`
	IsShowServerSetting  bool   `form:"isShowServerSetting" json:"isShowServerSetting"`
	IsEnableCode         bool   `form:"isEnableCode" json:"isEnableCode"`
	IsEnableAccess       bool   `form:"isEnableAccess" json:"isEnableAccess"`
	IsShowAdminSetting   bool   `form:"isShowAdminSetting" json:"isShowAdminSetting"`
	AdminUser            string `form:"adminUser" json:"adminUser"`
	AdminPassword        string `form:"adminPassword" json:"adminPassword"`
	AdminConfirmPassword string `form:"adminConfirmPassword" json:"adminConfirmPassword"`
	AdminEmail           string `form:"adminEmail" json:"adminEmail"`
}
