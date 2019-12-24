package login

import "testing"

var handler = &SmsSendChebao{
	RequestApi: "http://sms-send-api",
	PrivateKey: "*****",
}

func TestTwoFaHandlerSms(t *testing.T) {
	if err := handler.Send("135xxxxyyyy"); err != nil {
		t.Error(err)
	} else {
		t.Log("send ok")
	}
}
