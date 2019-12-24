package login

import "testing"

var handler = &SmsSendChebao{
	RequestApi: "http://passport-dev.etcchebao.com/passport/user/user-sms",
	PrivateKey: "*3#1+&?4",
}

func TestTwoFaHandlerSms(t *testing.T) {
	if err := handler.Send("13570993466"); err != nil {
		t.Error(err)
	} else {
		t.Log("send ok")
	}
}
