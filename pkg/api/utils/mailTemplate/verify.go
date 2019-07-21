package mailTemplate

func MailBody() string {
	return `<!DOCTYPE html>
<html lang="en"  style="margin: 0; padding: 0; font-family: Helvetica Neue, Microsoft Yahei, Hiragino Sans GB, WenQuanYi Micro Hei, sans-serif; font-size: 14px; text-align: center; word-break: normal; font-weight: normal;">
<head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
        <meta name="viewport" content="width=device-width,initial-scale=1">
</head>
<title>验证邮箱</title>
</head>

<body style="margin: 0; padding: 0; font-family: Helvetica Neue, Microsoft Yahei, Hiragino Sans GB, WenQuanYi Micro Hei, sans-serif; font-size: 14px; text-align: center; word-break: normal; font-weight: normal;">
    <div class="teambition-email" style="margin: 0; font-family: Helvetica Neue, MicrosoftYahei, Hiragino Sans GB, WenQuanYi Micro Hei, sans-serif; font-size: 14px;text-align: center; word-break: normal; font-weight: normal; background: #f2f2f2; padding: 40px 0;">
        <table cellspacing="0" cellpadding="0" class="email-table"  style="padding: 0; font-family: Helvetica Neue, Microsoft Yahei, Hiragino Sans GB, WenQuanYi Micro Hei, sans-serif; font-size: 14px; text-align: center; word-break: normal; font-weight: normal; width: 100%;max-width: 690px; margin: 0 auto;">
            <tbody style="margin: 0; padding: 0; font-family: Helvetica Neue, Microsoft Yahei, Hiragino Sans GB, WenQuanYi Micro Hei, sans-serif; font-size: 14px; text-align: center; word-break: normal; font-weight: normal;">
                <tr style="margin: 0; padding: 0; font-family: Helvetica Neue, Microsoft Yahei, Hiragino Sans GB, WenQuanYi Micro Hei, sans-serif; font-size: 14px; text-align: center; word-break: normal; font-weight: normal;">
                    <td style="margin: 0; padding: 0; font-family: Helvetica Neue, Microsoft Yahei, Hiragino Sans GB, WenQuanYi Micro Hei, sans-serif; font-size: 14px; text-align: center; word-break: normal; font-weight: normal;">
                        <img src="http://p2bu5m6lb.bkt.clouddn.com/msapplication-icon-144x144.png"
                            class="logo"
                            style="padding: 0; font-family: Helvetica Neue, Microsoft Yahei, Hiragino SansGB, WenQuanYi Micro Hei, sans-serif; font-size: 14px; text-align: center; word-break: normal; font-weight: normal; display: block; margin: 30px auto;width: 168px;">
                    </td>
                </tr>
                <tr style="margin: 0; padding: 0; font-family: Helvetica Neue, Microsoft Yahei, Hiragino Sans GB, WenQuanYi Micro Hei, sans-serif; font-size: 14px; text-align: center; word-break: normal; font-weight: normal;">
                    <td class="content" style="font-family: Helvetica Neue, Microsoft Yahei, Hiragino Sans GB, WenQuanYi Micro Hei, sans-serif; font-size: 14px; text-align: center; word-break: normal; font-weight: normal; max-width: 690px; margin: 0 auto; padding: 40px 30px; overflow: hidden; background: #fff; border-radius: 3px; box-sizing: border-box; border: 1px solid #d9d9d9;">
                        <table cellspacing="0" cellpadding="0"  style="margin: 0; padding: 0; font-family: Helvetica Neue, Microsoft Yahei, Hiragino Sans GB, WenQuanYi Micro Hei, sans-serif; font-size: 14px; text-align: center; word-break: normal; font-weight: normal; width: 100%;">
                            <tbody style="margin: 0; padding: 0; font-family: Helvetica Neue, Microsoft Yahei, Hiragino Sans GB, WenQuanYi Micro Hei, sans-serif; font-size: 14px; text-align: center; word-break: normal; font-weight: normal;">
                                <tr style="margin: 0; padding: 0; font-family: Helvetica Neue, Microsoft Yahei, Hiragino Sans GB, WenQuanYi MicroHei, sans-serif; font-size: 14px; text-align: center; word-break: normal; font-weight: normal;">
                                    <td style="margin: 0; padding: 0; font-family: Helvetica Neue, Microsoft Yahei, Hiragino Sans GB, WenQuanYi Micro Hei, sans-serif; font-size: 14px; text-align: center; word-break: normal; font-weight: normal;">
                                        <table cellspacing="0" cellpadding="0" style="margin: 0; padding: 0; font-family: Helvetica Neue, Microsoft Yahei, Hiragino Sans GB, WenQuanYi Micro Hei, sans-serif; font-size: 14px; text-align: center; word-break: normal; font-weight: normal; width: 100%;">
                                            <tbody style="margin: 0; padding: 0; font-family: Helvetica Neue, Microsoft Yahei, Hiragino Sans GB,WenQuanYi Micro Hei, sans-serif; font-size: 14px; text-align: center; word-break: normal; font-weight: normal;">
                                                <tr style="margin: 0; padding: 0; font-family: Helvetica Neue, Microsoft Yahei, Hiragino Sans GB, WenQuanYi Micro Hei, sans-serif; font-size: 14px; text-align: center; word-break: normal; font-weight: normal;">
                                                    <td class="user" style="margin: 0; font-family: Helvetica Neue, Microsoft Yahei, Hiragino Sans GB, WenQuanYi Micro Hei, sans-serif; font-size: 14px; text-align: center; word-break: normal; font-weight: normal; padding: 20px auto;">
                                                        <img src="http://p2bu5m6lb.bkt.clouddn.com/msapplication-icon-144x144.png"
                                                            class="avatar center"
                                                            style="padding: 0; font-family: Helvetica Neue, Microsoft Yahei, Hiragino Sans GB, WenQuanYi Micro Hei, sans-serif; font-size: 14px; text-align: center; word-break: normal; font-weight: normal; display: block; width: 80px; height: 80px; margin: 0 auto; border-radius: 50%;">
                                                    </td>
                                                </tr>
                                                <tr style="margin: 0; padding: 0; font-family: Helvetica Neue, Microsoft Yahei, Hiragino Sans GB, WenQuanYi Micro Hei, sans-serif; font-size: 14px; text-align: center; word-break: normal; font-weight: normal;">
                                                    <td class="message"
                                                        style="margin: 0; padding: 0; font-family: Helvetica Neue, Microsoft Yahei, Hiragino Sans GB, WenQuanYi Micro Hei, sans-serif; font-size: 14px; text-align: center; word-break: normal; font-weight: normal;">
                                                        <h2 style="margin: 0; padding: 0; font-family: Helvetica Neue, Microsoft Yahei, Hiragino Sans GB, WenQuanYi Micro Hei, sans-serif; text-align: center; word-break: normal; font-weight: normal; display: inline; color: #808080; font-size: 18px;">
                                                            您好，欢迎使用 Zeus，您的邮箱刚刚在 Zeus
                                                            注册了帐号，为了保护您的信息安全，我们来信进行邮箱验证，如果此操作不是由您发起的，请忽略此邮件。</h2>
                                                    </td>
                                                </tr>
                                                <tr style="margin: 0; padding: 0; font-family: Helvetica Neue, Microsoft Yahei, Hiragino Sans GB, WenQuanYi Micro Hei, sans-serif;font-size: 14px; text-align: center; word-break: normal; font-weight: normal;">
                                                    <td style="margin: 0; padding: 0; font-family: Helvetica Neue, Microsoft Yahei, Hiragino Sans GB, WenQuanYi Micro Hei, sans-serif; font-size: 14px; text-align: center; word-break: normal; font-weight: normal;">
                                                        <a href="http://admin.bullteam.cn"
                                                            class="btn"
                                                            style="padding: 0; font-family: Helvetica Neue, Microsoft Yahei, Hiragino Sans GB, WenQuanYi Micro Hei, sans-serif; text-align: center; font-weight: normal; word-break: break-word; display: block; width: 200px; height: 54px; margin: 30px auto; margin-bottom: 20px; font-size: 20px; line-height: 54px; border-radius: 2px; background: #3da8f5; text-decoration: none; color: #fff; border: 0; cursor: pointer;">验证邮箱</a>
                                                    </td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </td>
                                </tr>
                                <tr style="margin: 0; padding: 0; font-family: Helvetica Neue, Microsoft Yahei, Hiragino Sans GB, WenQuanYi Micro Hei, sans-serif; font-size: 14px; text-align: center; word-break: normal; font-weight: normal;">
                                    <td class="hint" style="padding: 0; font-family: Helvetica Neue, Microsoft Yahei, Hiragino Sans GB, WenQuanYi Micro Hei, sans-serif; font-size: 14px; text-align: center; word-break: normal; font-weight: normal; display: block; max-width: 600px; margin: 0 auto; color: #a6a6a6; line-height: 24px;">
                                        <p
                                            style="margin: 0; padding: 0; font-family: Helvetica Neue, Microsoft Yahei, Hiragino Sans GB, WenQuanYi Micro Hei, sans-serif; font-size: 14px; text-align: center; word-break: normal; font-weight: normal;">
                                            如果按钮无法点击，请点击以下链接进行验证<br
                                                style="margin: 0; padding: 0; font-family: Helvetica Neue, Microsoft Yahei, Hiragino Sans GB, WenQuanYi Micro Hei, sans-serif; font-size: 14px; text-align: center; word-break: normal; font-weight: normal;"><a
                                                href="http://admin.bullteam.cn"
                                                class="link"
                                                style="margin: 0; padding: 0; font-family: Helvetica Neue, Microsoft Yahei, Hiragino Sans GB, WenQuanYi Micro Hei, sans-serif; font-size:14px; text-align: center; font-weight: normal; word-break: break-word; color: #3da8f5;">https://admin.bullteam.cn/#/active?code=87ff9491efd7a3a98059922cd4b8381d&amp;email=wutongci%40hotmail.com</a>
                                        </p>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </td>
                </tr>
                <tr style="margin: 0; padding: 0; font-family: Helvetica Neue, Microsoft Yahei, Hiragino Sans GB, WenQuanYi Micro Hei, sans-serif; font-size: 14px; text-align: center; word-break: normal; font-weight: normal;">
                    <td class="footer"  style="margin: 0; padding: 0; font-family: Helvetica Neue, Microsoft Yahei, Hiragino Sans GB, WenQuanYi Micro Hei, sans-serif; font-size: 14px; text-align: center; word-break: normal; font-weight: normal;">
                        <p style="font-family: Helvetica Neue, Microsoft Yahei, Hiragino Sans GB, WenQuanYi Micro Hei, sans-serif; text-align: center; word-break: normal; font-weight: normal; display: block; max-width: 540px; margin: 20px auto 0; padding: 0 5px; color: #bdbdbd; font-size: 12px; line-height: 22px;">
                            邮件来自团队协作工具 Zeus 的自动提醒，无需回复。<br
                                style="margin: 0; padding: 0; font-family: Helvetica Neue, Microsoft Yahei, Hiragino Sans GB, WenQuanYi Micro Hei, sans-serif; font-size: 14px; text-align: center; word-break: normal; font-weight: normal;">
                            如有任何产品问题或者建议， 欢迎发送邮件至：<a href="mailto://support@bullteam.cn"
                                style="margin: 0; padding: 0; font-family: Helvetica Neue, Microsoft Yahei, Hiragino Sans GB, WenQuanYi Micro Hei, sans-serif; text-align: center; font-weight: normal; word-break: break-word; font-size: 12px; color: #bdbdbd; text-decoration: underline;">support@bullteam.cn</a>
                        </p>
                    </td>
                </tr>
            </tbody>
        </table>
    </div>
</body>
</html>
<div style="text-align:center">
    <div style="border-top:1px solid #ddd;width: 100%;max-width: 560px;display:inline-block;padding:10px"><a
            style="display:inline-block;background:#ddd; border-radius:4px;padding: 3px 15px;color:#a6a6a6;text-decoration:none;font-size:12px"
            href="http://admin.bullteam.cn">点击这里取消订阅<br>click
            to unsubscribe</a></div>
</div>`
}
