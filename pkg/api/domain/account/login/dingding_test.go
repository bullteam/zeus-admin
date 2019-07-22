package login

import (
	dingtalk "github.com/icepy/go-dingtalk/src"
	"github.com/stretchr/testify/assert"
	"testing"
)
func init(){
	//Overwrite it for tests
	dingTalkClient = dingtalk.NewDingTalkCompanyClient(&dingtalk.DTConfig{
		SNSAppID:  "dingoatdqa3hb5eta4tlvi",
		SNSSecret: "RHNFFTJXh-uxQ2YosdoBt8u0gqBGwWhe8J3dMwqf5gz41vHq9zHvc7D9WNZSDuJ0",
	})
}

func TestGetCompanyDingTalkClient(t *testing.T) {
	assert.NotEqual(t,nil,dingTalkClient)
}

//func TestGetDingTalkUserInfo(t *testing.T) {
//	_,err := GetDingTalkUserInfo("xyzefer")
//	assert.NotEqual(t,nil,err)
//}


