package controllers

import (
	"github.com/gin-gonic/gin"
	"zeus/pkg/api/service"
)

type SyncController struct {
	BaseController
}

var dingTalkService = service.DingTalkService{}

// @Tags Sync
// @Summary 钉钉组织架构+用户同步
// @Security ApiKeyAuth
// @Produce  json
// @Success 200 {string} json "{"code":200,"data":""}
// @Router /v1/sync/dingtalk [post]
func (s *SyncController) SyncDingTalk(c *gin.Context) {
	dingTalkService.SyncUsersAndDepartments()
	ok(c, "ok.ActionSuccess")
}
