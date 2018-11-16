var jq = jQuery.noConflict();

function loginyanzhengmacuowu() {
    jq("#error-code1").css("display","none");
}

function registeryanzhengmacuowu() {
    jq("#error-code").css("display","none");
}

function login() {
    var check = true;
    // var account = /^(0|86|17951)?(13[0-9]|15[012356789]|17[678]|18[0-9]|14[57])[0-9]{8}$/;
    // var pwd = /^(\w){6,16}$/;
    // if (!account.test(jq("#loginaccount").val())) {
    //     check = false;
    // }
    // if (!pwd.test(jq("#loginpassword").val())) {
    //     check = false;
    // }
    jq.ajax({
        url: "yanzhenma/checkyanzhenma?status=1&yanzheng=" + jq("#checkword").val(),
        type: "post",
        async: false,
        traditional: true,
        datatype: "text",
        success: function (data) {
            var message = JSON.parse(data);
            if (message == "false") {
                check = false;
                jq("#error-code1").css("display","block");
                jq("#checkword").val("");
                jq("#Loginyanzhenimg").attr("src", jq("#contextpath").attr("data-path") + "/yanzhenma/getLoginyanzhenma?time=" + new Date().getTime());
            }
        }
    });
    if (check) {
        jq.ajax({
            url: "login",
            type: "post",
            async: false,
            traditional: true,
            data: jq("#loginForm").serialize(),
            datatype: "text",
            success: function (data) {
                var Mydata = JSON.parse(data);
                if (Mydata.status == 1) {
                    // alert(Mydata.info);
                    // bootoast({
                    //     message: Mydata.info,
                    //     type: 'success',
                    //     position: 'top',
                    //     timeout: 1
                    // });
                    window.location.reload();
                    // jq("loginaccount").val("");
                    // jq("#loginpassword").val("");
                    // jq("#Loginyanzhenimg").attr("src", jq("#contextpath").attr("data-path") + "/yanzhenma/getLoginyanzhenma?time=" + new Date().getTime());
                    // jq("#checkword").val("");
                    // jq("#closelogin").click();
                } else if (Mydata.status == 2) {
                    // alert(Mydata.info);
                    jq.growl.warning({ title: "消息", message: Mydata.info});
                    // bootoast({
                    //     message: Mydata.info,
                    //     type: 'warning',
                    //     position: 'top',
                    //     timeout: 1
                    // });
                    jq("#loginpassword").val("");
                    jq("#checkword").val("");
                    jq("#Loginyanzhenimg").attr("src", jq("#contextpath").attr("data-path") + "/yanzhenma/getLoginyanzhenma?time=" + new Date().getTime());
                } else {
                    jq("loginaccount").focus();
                    jq("#checkword").val("");
                    jq("#Loginyanzhenimg").attr("src", jq("#contextpath").attr("data-path") + "/yanzhenma/getLoginyanzhenma?time=" + new Date().getTime());
                    // bootoast({
                    //     message: Mydata.info,
                    //     type: 'warning',
                    //     position: 'top',
                    //     timeout: 1
                    // });
                    // alert(Mydata.info);
                    jq.growl.warning({ title: "消息", message: Mydata.info});
                }
            },
            error: function () {
                // bootoast({
                //     message: '系统繁忙，请稍后重试',
                //     type: 'warning',
                //     position: 'right-bottom',
                //     timeout: 1
                // });
                jq.growl.warning({ title: "消息", message:"系统繁忙，请稍后重试"});
            }
        });
    }
}

function refreshRegisteryanzhen() {
    jq("#Registeryanzhenimg").attr("src", jq("#contextpath").attr("data-path") + "/yanzhenma/getRegisteryanzhenma?time=" + new Date().getTime());
}

function refreshLoginyanzhen() {
    jq("#Loginyanzhenimg").attr("src", jq("#contextpath").attr("data-path") + "/yanzhenma/getLoginyanzhenma?time=" + new Date().getTime());
}

function register() {
    var check = true;
    var realname = /\w{1,50}|[\u4e00-\u9fa5]{1,20}/;
    var username = /\w{1,20}|[\u4e00-\u9fa5]{1,20}/;
    var passwordTest = /\w{6,16}/;
    var IDtest = /(^[1-9]\d{5}(18|19|([23]\d))\d{2}((0[1-9])|(10|11|12))(([0-2][1-9])|10|20|30|31)\d{3}[0-9Xx]$)|(^[1-9]\d{5}\d{2}((0[1-9])|(10|11|12))(([0-2][1-9])|10|20|30|31)\d{2}$)/;
    var phoNumTest = /((^130)|(^131)|(^132)|(^155)|(^156)|(^185)|(^186)|(^145)|(^176)|(^134)|(^135)|(^136)|(^137)|(^138)|(^139)|(^150)|(^151)|(^152)|(^157)|(^158)|(^159)|(^182)|(^183)|(^184)|(^187)|(^188)|(^147)|(^178)|(^133)|(^153)|(^180)|(^189)|(^177)|(^181))\d{8}/;
    var EmailTest = /^\w(\w|-|_|.)*@\w*.\w*/;

    if (!EmailTest.test(jq("#email").val())) {
        check = false;
    }
    if (!IDtest.test(jq("#idcard").val())) {
        check = false;
    }
    if (!realname.test(jq("#truename").val())) {
        check = false;
    }
    if (!passwordTest.test(jq("#pwd").val())) {
        check = false;
    }
    if (!username.test(jq("#name").val())) {
        check = false;
    }
    if (!phoNumTest.test(jq("#mobile").val())) {
        check = false;
    }

    jq.ajax({
        url: "yanzhenma/checkyanzhenma?status=0&yanzheng=" + jq("#register_checkword").val(),
        type: "post",
        async: false,
        traditional: true,
        datatype: "text",
        success: function (data) {
            var message = JSON.parse(data);
            if (message == "false") {
                check = false;
                jq("#error-code").css("display","block");
                jq("#register_checkword").val("");
                jq("#Registeryanzhenimg").attr("src", jq("#contextpath").attr("data-path") + "/yanzhenma/getRegisteryanzhenma?time=" + new Date().getTime());
            }
        }
    });
    if (check) {
        jq.ajax({
            url: "addAcUser",
            type: "post",
            async: false,
            traditional: true,
            data: jq("#register_form").serialize(),
            datatype: "text",
            success: function (data) {
                var Mydata = JSON.parse(data);
                if (Mydata.status == 1) {
                    // bootoast({
                    //     message: Mydata.info,
                    //     type: 'success',
                    //     position: 'top',
                    //     timeout: 1
                    // });
                    // alert(Mydata.info);
                    jq.growl({ title: "消息", message: Mydata.info});
                    jq("#register_checkword").val("");
                    jq("#mobile").val("");
                    jq("#right-mobile").css('display','none');
                    jq("#require-mobile").css('display','');
                    jq("#name").val("");
                    jq("#right-name").css('display','none');
                    jq("#require-name").css('display','');
                    jq("#pwd").val("");
                    jq("#right-pwd").css('display','none');
                    jq("#require-pwd").css('display','');
                    jq("#truename").val("");
                    jq("#right-truename").css('display','none');
                    jq("#require-truename").css('display','');
                    jq("#idcard").val("");
                    jq("#right-idcard").css('display','none');
                    jq("#require-idcard").css('display','');
                    jq("#email").val("");
                    jq("#right-email").css('display','none');
                    jq("#require-email").css('display','');
                    jq("#Registeryanzhenimg").attr("src", jq("#contextpath").attr("data-path") + "/yanzhenma/getRegisteryanzhenma?time=" + new Date().getTime());
                } else {
                    // bootoast({
                    //     message: Mydata.info,
                    //     type: 'warning',
                    //     position: 'top',
                    //     timeout: 1
                    // });
                    jq.growl.warning({ title: "消息", message: Mydata.info});
                    jq("#register_checkword").val("");
                    jq("#register_account").focus();
                    jq("#Registeryanzhenimg").attr("src", jq("#contextpath").attr("data-path") + "/yanzhenma/getRegisteryanzhenma?time=" + new Date().getTime());
                }
            },
            error: function () {
                // bootoast({
                //     message: '系统繁忙，请稍后重试',
                //     type: 'warning',
                //     position: 'right-bottom',
                //     timeout: 1
                // });
                jq.growl.warning({ title: "消息", message: "系统繁忙，请稍后重试"});
            }
        });
    }
}

function logout() {
    jq.ajax({
        url: "logout",
        type: "post",
        async: false,
        traditional: true,
        datatype: "text",
        success: function (data) {
            window.location.reload();
        }
    });
}