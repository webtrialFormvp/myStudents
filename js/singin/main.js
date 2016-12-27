$("#authform").validate({
    rules: {
        username: {
            required: true,
            minlength: 2
        },
        password: {
            required: true,
            minlength: 5
        },
        confirm_password: {
            required: true,
            minlength: 5,
            equalTo: "#password"
        },
        email: {
            required: true,
            email: true
        },
        agree: "required"
    },
    messages: {

        username: {
            required: "请输入用户名",
            minlength: "您的用户名至少包含两个字符"
        },
        password: {
            required: "请输入密码",
            minlength: "您的密码至少包含5个字符"
        },
        confirm_password: {
            required: "请输入确认密码",
            minlength: "您的密码至少包含5个字符",
            equalTo: "请输入一致的确认密码"
        },
        email: "请输入正确的邮箱格式",
        agree: "请阅读协议内容"
    }
});