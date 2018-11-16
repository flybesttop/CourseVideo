<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextpath" value="${pageContext.request.contextPath}"/>
<html lang="en" class=" js csstransitions">
<!--<![endif]-->

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="description" content="News - Clean HTML5 and CSS3 responsive template">
    <meta name="author" content="MyPassion">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>课程</title>
    <link rel="shortcut icon" href="${contextpath}/static/img/sms-4.ico">
    <!-- STYLES -->
    <link rel="stylesheet" type="text/css" href="${contextpath}/static/css/superfish.css" media="screen">
    <link rel="stylesheet" type="text/css" href="${contextpath}/static/css/fontello/fontello.css">
    <link rel="stylesheet" type="text/css" href="${contextpath}/static/css/flexslider.css" media="screen">
    <link rel="stylesheet" type="text/css" href="${contextpath}/static/css/ui.css">
    <link rel="stylesheet" type="text/css" href="${contextpath}/static/css/base.css">
    <link rel="stylesheet" type="text/css" href="${contextpath}/static/css/style.css">
    <link rel="stylesheet" type="text/css" href="${contextpath}/static/css/960.css">
    <link rel="stylesheet" type="text/css" href="${contextpath}/static/css/devices/1000.css"
          media="only screen and (min-width: 768px) and (max-width: 1000px)">
    <link rel="stylesheet" type="text/css" href="${contextpath}/static/css/devices/767.css"
          media="only screen and (min-width: 480px) and (max-width: 767px)">
    <link rel="stylesheet" type="text/css" href="${contextpath}/static/css/devices/479.css"
          media="only screen and (min-width: 200px) and (max-width: 479px)">
    <link rel="stylesheet" type="text/css" href="${contextpath}/static/css/mystyle.css"/>
    <!--[if lt IE 9]>
    <script type="text/javascript" src="${contextpath}/static/js/customM.js"></script> <![endif]-->
    <link rel="stylesheet" type="text/css" href="${contextpath}/static/css/model.css"/>
    <link rel="stylesheet" type="text/css" href="${contextpath}/static/css/learning.css"/>
    <link rel="stylesheet" type="text/css" href="${contextpath}/static/css/jquery.growl.css">
    <link rel="stylesheet" type="text/css" href="${contextpath}/static/css/page.css">
    <!--美化按钮-->
    <style>
        .button, input[type="reset"], button {
            background: #ea4748;
            color: #fff;
            cursor: pointer;
            height: auto;
            overflow: visible;
            padding: 3px 20px 4px 20px;
            -webkit-transition: background-color .3s ease;
            -moz-transition: background-color .3s ease;
            -ms-transition: background-color .3s ease;
            -o-transition: background-color .3s ease;
            transition: background-color .3s ease;
            width: auto;
        }

    </style>
</head>
<div style="display: none" data-path="${contextpath}" id="contextpath"></div>
<body class="vsc-initialized">
<!-- Body Wrapper -->
<div class="body-wrapper">
    <div class="controller">
        <div class="controller2">
            <!-- Header -->
            <header id="header">
                <div class="container">
                    <div class="column">
                        <div class="head-c">
                            <div class="logo">
                                <a href="index"><img src="${contextpath}/static/img/logo.png" alt="MyPassion"/></a>
                            </div>
                            <c:choose>
                                <c:when test="${nowUser==null}">
                                    <div class="haed-c-user">
                                        <ul class="sf-menu user-menu">
                                            <li>
                                                <a data-toggle="modal" data-target="#web_user" onclick="web_login2()"
                                                   style="border: none;">
                                                    <div class="user-c">
                                                        <div class="user-c-username">请登录</div>
                                                        <div class="user-c-photo">
                                                            <img class="photo-c"
                                                                 src="${contextpath}/static/img/head.png">
                                                        </div>
                                                    </div>
                                                </a>
                                                <ul class="user-c-info" style="border-top: none;">
                                                    <li><i class="icon-right-open"></i>
                                                        <a data-toggle="modal" data-target="#web_user"
                                                           onclick="web_login2()"
                                                           href="#">登录.</a>
                                                    </li>
                                                    <li><i class="icon-right-open"></i>
                                                        <a data-toggle="modal" data-target="#web_user"
                                                           onclick="web_register2()"
                                                           href="#">注册.</a>
                                                    </li>
                                                </ul>
                                            </li>
                                        </ul>
                                    </div>
                                </c:when>
                                <c:otherwise>
                                    <div class="haed-c-user">
                                        <ul class="sf-menu login-item">
                                            <li>
                                                <a style="border: none;" href="userinfo?userId=${nowUser.acUserId}">
                                                    <div class="user-c">
                                                        <div class="user-c-username">${nowUser.acUserUsername}</div>
                                                        <div class="user-c-photo">
                                                            <img class="photo-c"
                                                                 src="${contextpath}/static/img/${nowUser.acUserHeadimg}">
                                                        </div>
                                                    </div>
                                                </a>
                                                <ul>
                                                    <li>
                                                        <div class="login-head-c  breadcrumbs">
                                                            <div class="login-head-left">
                                                                <a href="userinfo?userId=${nowUser.acUserId}">
                                                                    <img src="${contextpath}/static/img/${nowUser.acUserHeadimg}"></a>
                                                            </div>
                                                            <div class="login-head-right">
                                                                <div><p>${nowUser.acUserUsername}</p></div>
                                                            </div>
                                                        </div>
                                                        <div class="login-fix breadcrumbs">
                                                            <table>
                                                                <tr>
                                                                    <td><a href="userinfo_buy?userId=${nowUser.acUserId}"><div class="fix-select">我的课程</div></a></td>
                                                                    <td><a href="#"><div class="fix-select">订单中心</div></a></td>
                                                                </tr>
                                                                <tr>
                                                                    <td><a href="userinfo?userId=${nowUser.acUserId}"><div class="fix-select">个人设置</div></a></td>
                                                                    <td><a href="#" onclick="logout()"><div class="fix-select login-exit">安全退出</div></a></td>
                                                                </tr>
                                                            </table>
                                                        </div>
                                                        <div class="history-item">
                                                            <table>
                                                                <c:if test="${lastCourse.acCourseName!=null}">
                                                                    <tr>
                                                                        <td class="history-1th"></td>
                                                                        <td class="history-2th">
                                                                            <span>上次学习：《${lastCourse.acCourseName}》</span>
                                                                        </td>
                                                                        <td class="history-3th" rowspan="2"><a
                                                                                href="openvideo?courseId=${lastCourseId}&chapterId=${lastChapter}&episodeId=${lastEpidode}&userId=${nowUser.acUserId}">继续</a>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td></td>
                                                                        <td class="history-2th">
                                                                            <list>第${lastChapter}章 第${lastEpidode}节</list>
                                                                        </td>
                                                                    </tr>
                                                                </c:if>
                                                            </table>
                                                        </div>
                                                    </li>
                                                </ul>
                                            </li>
                                        </ul>
                                    </div>
                                </c:otherwise>
                            </c:choose>

                            <div class="search">
                                <form action="search" method="get" target="_blank">
                                    <input type="text" placeholder="Search." class="ft" name="message"/>
                                    <input type="submit" value="" class="fs">
                                </form>
                            </div>
                        </div>

                        <!-- Nav -->
                        <nav id="nav">
                            <ul class="sf-menu">
                                <li class="current">
                                    <a href="index">首页.</a>
                                </li>
                                <li>
                                    <a href="selectFreeCourse">免费课程.</a>
                                    <ul>
                                        <c:forEach var="bestObj" items="${bestObjs}">
                                            <li><i class="icon-right-open"></i>
                                                <a href="selectFreeCourse?bestObjId=${bestObj.id}">${bestObj.acRelationshipsItemname}</a>
                                            </li>
                                        </c:forEach>
                                    </ul>
                                </li>
                                <li>
                                    <a href="selectPayCourse">付费课程.</a>
                                    <ul>
                                        <c:forEach var="bestObj" items="${bestObjs}">
                                            <li><i class="icon-right-open"></i>
                                                <a href="selectPayCourse?bestObjId=${bestObj.id}">${bestObj.acRelationshipsItemname}</a>
                                            </li>
                                        </c:forEach>
                                    </ul>
                                </li>
                                <li>
                                    <a href="News">新闻公告.</a>
                                </li>
                                <c:if test="${nowUser.acUserRole==2}">
                                    <li>
                                        <a href="creatcourse">管理课程.</a>
                                    </li>
                                </c:if>
                                <li>
                                    <c:choose>
                                        <c:when test="${nowUser==null}">
                                            <a onclick="showNologin()">个人中心.</a>
                                        </c:when>
                                        <c:otherwise>
                                            <a href="userinfo?userId=${nowUser.acUserId}">个人中心.</a>
                                        </c:otherwise>
                                    </c:choose>
                                </li>
                                <li>
                                    <a href="reviews.html">关于我们.</a>
                                </li>
                            </ul>
                        </nav>
                        <!-- /Nav -->
                    </div>
                </div>
            </header>
            <!-- /Header -->

            <div class="modal fade" id="web_user" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
                 aria-hidden="true">
                <div class="modal-dialog" style="width: 35%;">
                    <div class="modal-content">
                        <!--登录模态框-->
                        <div id="web_login">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true"
                                        id="closelogin">
                                    &times;
                                </button>
                                <h4 class="modal-title" id="myModalLabel1">
                                    登录页面
                                </h4>
                            </div>
                            <form method="POST" id="loginForm">
                                <div class="modal-body">
                                    <table class="modal-table">
                                        <tr>
                                            <td class="modal-table-text">账号</td>
                                            <td class="modal-table-input">
                                                <input type="text" name="account" onfocus="loginaccount_error()"
                                                       placeholder="请输入账号" id="loginaccount">
                                            </td>
                                            <td id="loginaccount-error" class="modal-table-require"
                                                style="display: none;">
                                                <img class="require-img"
                                                     src="${contextpath}/static/img/require_error.png">账号不存在
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="modal-table-text">密码</td>
                                            <td class="modal-table-input">
                                                <input type="password" name="password" onfocus="loginpwd_error()"
                                                       placeholder="请不要将密码告诉他人" id="loginpassword">
                                            </td>
                                            <td id="loginpwd-error" class="modal-table-require" style="display: none;">
                                                <img class="require-img"
                                                     src="${contextpath}/static/img/require_error.png">密码错误
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="modal-table-text" style="padding-top:0px">
                                                <div class="code-img-c">
                                                    <img class="code-img"
                                                         src="${contextpath}/yanzhenma/getLoginyanzhenma"
                                                         onclick="refreshLoginyanzhen()" id="Loginyanzhenimg">
                                                </div>
                                            </td>
                                            <td class="modal-table-input">
                                                <input type="text" name="code" placeholder="验证码" id="checkword"
                                                       onfocus="loginyanzhengmacuowu()">
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="padding-top: 0px;text-align: right;">
                                                <div class="code-change">
                                                    <a onclick="refreshRegisteryanzhen()">看不清？换一张</a>
                                                </div>
                                            </td>
                                            <td id="error-code1" class="require-c-modal" style="display: none;">
                                                <div class="require-c-modal-error"><img class="require-img"
                                                                                        src="${contextpath}/static/img/require_error.png">验证码错误！
                                                </div>
                                            </td>
                                        </tr>
                                    </table>
                                </div>
                                <div class="modal-footer" style="margin: 0px auto;">
                                    <button type="button" onclick="web_register()" class="btn btn-default">
                                        注册
                                    </button>
                                    <button type="button" class="btn btn-primary" onclick="login()">
                                        登录
                                    </button>
                                </div>
                            </form>
                        </div>

                        <!--注册模态框-->
                        <div id="web_register" style="display: none;">
                            <!--注册界面-->
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                                    &times;
                                </button>
                                <h4 class="modal-title" id="myModalLabel">
                                    注册页面
                                </h4>
                            </div>
                            <form class="modal-formstyle" method="POST" id="register_form">
                                <div class="modal-body">
                                    <table class="modal-table">
                                        <tr>
                                            <td class="modal-table-text"><span>*</span>手机号</td>
                                            <td class="modal-table-input">
                                                <input id="mobile" type="text" name="account" onblur="require_mobile()"
                                                       required="required">
                                            </td>
                                        </tr>
                                        <tr id="require-mobile">
                                            <td class="require-c-modal" colspan="2">
                                                <div class="require-c-modal-content">忘记密码时，可以通过该手机号码快速找回密码</div>
                                            </td>
                                        </tr>
                                        <tr id="error-mobile" style="display: none;">
                                            <td>&nbsp;</td>
                                            <td class="require-c-modal">
                                                <div class="require-c-modal-error"><img class="require-img"
                                                                                        src="${contextpath}/static/img/require_error.png">请填写正确的手机号
                                                </div>
                                            </td>
                                        </tr>
                                        <tr id="right-mobile" style="display: none;">
                                            <td>&nbsp;</td>
                                            <td class="require-c-modal">
                                                <div class="require-c-modal-true"><img class="require-img"
                                                                                       src="${contextpath}/static/img/require_true.png">手机号码可用
                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="modal-table-text"><span>*</span>昵称</td>
                                            <td class="modal-table-input">
                                                <input id="name" type="text" name="username" onblur="require_name()"
                                                       required="required">
                                            </td>
                                        </tr>
                                        <tr id="require-name">
                                            <td class="require-c-modal" colspan="2">
                                                <div class="require-c-modal-content">中英文均可，最长14个英文或7个汉字</div>
                                            </td>
                                        </tr>
                                        <tr id="error-name" style="display: none;">
                                            <td>&nbsp;</td>
                                            <td class="require-c-modal">
                                                <div class="require-c-modal-error"><img class="require-img"
                                                                                        src="${contextpath}/static/img/require_error.png">请填写正确的昵称格式
                                                </div>
                                            </td>
                                        </tr>
                                        <tr id="right-name" style="display: none;">
                                            <td>&nbsp;</td>
                                            <td class="require-c-modal">
                                                <div class="require-c-modal-true"><img class="require-img"
                                                                                       src="${contextpath}/static/img/require_true.png">该昵称可用
                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="modal-table-text"><span>*</span>密码</td>
                                            <td class="modal-table-input">
                                                <input id="pwd" type="password" name="password" onblur="require_pwd()"
                                                       required="required">
                                            </td>
                                        </tr>
                                        <tr id="require-pwd">
                                            <td class="require-c-modal" colspan="2">
                                                <div class="require-c-modal-content">密码（6-16个字符组成，区分大小写）</div>
                                            </td>
                                        </tr>
                                        <tr id="error-pwd" style="display: none;">
                                            <td>&nbsp;</td>
                                            <td class="require-c-modal">
                                                <div class="require-c-modal-error"><img class="require-img"
                                                                                        src="${contextpath}/static/img/require_error.png">密码格式不正确
                                                </div>
                                            </td>
                                        </tr>
                                        <tr id="right-pwd" style="display: none;">
                                            <td>&nbsp;</td>
                                            <td class="require-c-modal">
                                                <div class="require-c-modal-true"><img class="require-img"
                                                                                       src="${contextpath}/static/img/require_true.png">该密码可用
                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="modal-table-text"><span>*</span>真实姓名</td>
                                            <td class="modal-table-input">
                                                <input id="truename" type="text" name="realname"
                                                       onblur="require_truename()" required="required">
                                            </td>
                                        </tr>
                                        <tr id="require-truename">
                                            <td class="require-c-modal" colspan="2">
                                                <div class="require-c-modal-content">因网站要求需实用真实姓名</div>
                                            </td>
                                        </tr>
                                        <tr id="error-truename" style="display: none;">
                                            <td>&nbsp;</td>
                                            <td class="require-c-modal">
                                                <div class="require-c-modal-error"><img class="require-img"
                                                                                        src="${contextpath}/static/img/require_error.png">请勿实用单字或特殊字符
                                                </div>
                                            </td>
                                        </tr>
                                        <tr id="right-truename" style="display: none;">
                                            <td>&nbsp;</td>
                                            <td class="require-c-modal">
                                                <div class="require-c-modal-true"><img class="require-img"
                                                                                       src="${contextpath}/static/img/require_true.png">名称格式正确
                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="modal-table-text"><span>*</span>身份证号</td>
                                            <td class="modal-table-input">
                                                <input id="idcard" type="text" name="realId" onblur="require_idcard()"
                                                       required="required">
                                            </td>
                                        </tr>
                                        <tr id="require-idcard">
                                            <td class="require-c-modal" colspan="2">
                                                <div class="require-c-modal-content">建议使用新一代18位身份证</div>
                                            </td>
                                        </tr>
                                        <tr id="error-idcard" style="display: none;">
                                            <td>&nbsp;</td>
                                            <td class="require-c-modal">
                                                <div class="require-c-modal-error"><img class="require-img"
                                                                                        src="${contextpath}/static/img/require_error.png">请输入正确身份证格式
                                                </div>
                                            </td>
                                        </tr>
                                        <tr id="right-idcard" style="display: none;">
                                            <td>&nbsp;</td>
                                            <td class="require-c-modal">
                                                <div class="require-c-modal-true"><img class="require-img"
                                                                                       src="${contextpath}/static/img/require_true.png">身份证可用
                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="modal-table-text"><span>*</span>邮箱</td>
                                            <td class="modal-table-input">
                                                <input id="email" type="text" name="email" onblur="require_email()"
                                                       required="required">
                                            </td>
                                        </tr>
                                        <tr id="require-email">
                                            <td class="require-c-modal" colspan="2">
                                                <div class="require-c-modal-content">邮箱格式为xxxx@xx.com</div>
                                            </td>
                                        </tr>
                                        <tr id="error-email" style="display: none;">
                                            <td>&nbsp;</td>
                                            <td class="require-c-modal">
                                                <div class="require-c-modal-error"><img class="require-img"
                                                                                        src="${contextpath}/static/img/require_error.png">请填写正确的邮箱格式
                                                </div>
                                            </td>
                                        </tr>
                                        <tr id="right-email" style="display: none;">
                                            <td>&nbsp;</td>
                                            <td class="require-c-modal">
                                                <div class="require-c-modal-true"><img class="require-img"
                                                                                       src="${contextpath}/static/img/require_true.png">格式正确，可以使用
                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="modal-table-text" style="padding-top:0px">
                                                <div class="code-img-c">
                                                    <img class="code-img"
                                                         src="${contextpath}/yanzhenma/getRegisteryanzhenma"
                                                         id="Registeryanzhenimg" onclick="refreshRegisteryanzhen()">
                                                </div>
                                            </td>
                                            <td class="modal-table-input">
                                                <input type="text" name="code" placeholder="验证码" required="required"
                                                       id="register_checkword" onfocus="registeryanzhengmacuowu()">
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="padding-top: 0px;text-align: right;">
                                                <div class="code-change">
                                                    <a onclick="refreshRegisteryanzhen()">看不清？换一张</a>
                                                </div>
                                            </td>
                                            <td id="error-code" class="require-c-modal" style="display: none;">
                                                <div class="require-c-modal-error"><img class="require-img"
                                                                                        src="${contextpath}/static/img/require_error.png">验证码错误！
                                                </div>
                                            </td>
                                        </tr>
                                    </table>
                                </div>
                                <div class="modal-footer" style="margin: 0px auto;">
                                    <button type="button" onclick="web_login()" class="btn btn-default">
                                        已有账号、登录
                                    </button>
                                    <button type="button" class="btn btn-primary" onclick="register()">
                                        确认注册
                                    </button>
                                </div>
                            </form>
                        </div>
                    </div><!-- /.modal -->
                </div>
            </div>
            <div class="modal fade" id="div-class" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
                 aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <!--join_class-->
                        <div id="modal-class">
                            <div id="class-join">
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                                        ×
                                    </button>
                                    <h4 class="modal-title">
                                        信息填报
                                    </h4>
                                </div>
                                <form action="user/login" method="POST">
                                    <div class="modal-body">
                                        <div>
                                        </div>
                                        <table>
                                            <tbody>
                                            <tr>
                                                <td>教室编号</td>
                                                <td><input type="text" name="classid" required="required"></td>
                                            </tr>
                                            <tr>
                                                <td>密码确认</td>
                                                <td><input type="text" name="pwd" required="required"></td>
                                            </tr>
                                            <tr>
                                                <td>账号类型</td>
                                                <td>
                                                    <center>
                                                        <input type="radio" value="学生" name="type" onclick="web_join()">学生
                                                        <input type="radio" value="教师" name="type" onclick="web_new()">教师&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                    </center>
                                                </td>
                                            </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                    <div class="modal-footer" style="margin: 0px auto;">
                                        <button type="submit" class="btn btn-primary">
                                            确认加入
                                        </button>
                                    </div>
                                </form>
                            </div>
                            <div id="class-new" hidden="hidden">
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                                        ×
                                    </button>
                                    <h4 class="modal-title">
                                        信息填报
                                    </h4>
                                </div>
                                <form action="user/login" method="POST">
                                    <div class="modal-body">
                                        <div>
                                        </div>
                                        <table>
                                            <tbody>
                                            <tr>
                                                <td>教室类型</td>
                                                <td><input type="text" name="classtype" required="required"></td>
                                            </tr>
                                            <tr>
                                                <td>密码确认</td>
                                                <td><input type="text" name="pwd" required="required"></td>
                                            </tr>
                                            <tr>
                                                <td>账号类型</td>
                                                <td>
                                                    <center>
                                                        <input type="radio" value="学生" name="type" onclick="web_join()">学生
                                                        <input type="radio" value="教师" name="type" onclick="web_new()">教师&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                    </center>
                                                </td>
                                            </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                    <div class="modal-footer" style="margin: 0px auto;">
                                        <button type="submit" class="btn btn-primary">
                                            确认创建
                                        </button>
                                    </div>
                                </form>
                            </div>
                        </div>
                        <!--创建教室-->
                    </div>
                </div>
            </div>
            <!-- Content -->
            <section id="content">
                <div class="container">
                    <!-- 右栏 -->
                    <div class="main-content">
                        <div class="container-head">
                            <h5 class="line"><span>简介：</span></h5>
                            <h1>课程名：《${course.acCourseName}》</h1>
                            <%--<div data-id="${course.acCourseId}" id="courseIdMessage"></div>--%>
                            <blockquote>${course.acCourseContext}</blockquote>
                        </div>
                        <br>
                        <c:forEach var="chapter" items="${courseChapters}">
                            <br>
                            <div class="container-learn-box">
                                <h4 class="breadcrumbs">第${chapter.chapterId}章 ${chapter.chapterName}</h4>
                                <p>${chapter.chapterContext}</p>
                                <ul class="p2-ul">
                                    <c:forEach var="episode" items="${chapter.episodes}">
                                        <li>
                                            <div class="p2-div1">
                                                <img src="${contextpath}/static/img/learning/video_greed.png"
                                                     class="p2-img learned">
                                            </div>
                                            <div class="p2-div2">
                                                <P>${episode.acVideoCourseChapter}-${episode.acVideoCourseEpisode} ${episode.acVideoCourseTitle}</P>
                                            </div>
                                            <div class="p2-div3">
                                                <form action="openvideo" onsubmit="return opencourseCheckedLogin()">
                                                    <input type="hidden" name="courseId" value="${episode.acVideoCourseCourseid}">
                                                    <input type="hidden" name="chapterId" value="${episode.acVideoCourseChapter}">
                                                    <input type="hidden" name="episodeId" value="${episode.acVideoCourseEpisode}">
                                                    <c:if test="${nowUser!=null}">
                                                        <input type="hidden" name="userId" value="${nowUser.acUserId}">
                                                    </c:if>
                                                <button class="p2-button" type="submit">开始学习
                                                </button>
                                                </form>
                                            </div>
                                        </li>
                                    </c:forEach>
                                </ul>
                            </div>
                            <br>
                        </c:forEach>
                    </div>
                    <!-- /右栏 -->
                    <!-- 左栏 -->
                    <div class="column-one-third">
                        <div class="sidebar">
                            <h5 class="line"><span>加入我的课程.</span></h5>
                            <ul class="social">
                                <c:choose>
                                    <c:when test="${course.acCourseMoney==0}">
                                        <button class="btn-success" onclick="checkHasCourse()">加入我的课程</button><br>
                                        <h7>// 加入我的课程，方便下次查询</h7>
                                    </c:when>
                                    <c:otherwise>
                                    <h3>课程价格：￥${course.acCourseMoney}</h3>
                                        <h7 style="color: #6c6c6c">// 正在连载中的课程也可以购买，若后期课程断更或者出现问题，可以在下方的投诉按钮进行投诉，工作人员会在2天内给您答复。</h7><br>
                                        <button class="btn-success" onclick="checkHasCourse()">购买课程</button>
                                    </c:otherwise>
                                </c:choose>
                            </ul>
                        </div>
                        <div class="sidebar">
                            <h5 class="line" style="margin: 5px;margin-left: 5px"><span>课程举报</span></h5>
                            <button class="warming " id="warming" onclick="warming()">举报</button>
                            <form style="border: 1px solid; display: none" id="test">
                                <input type="hidden" value="${course.acCourseId}" name="courseId">
                                <input type="hidden" value="${nowUser.acUserId}" name="userId">
                                <span style="float: left">邮箱:</span>
                                <input id="test1" type="email" placeholder="请输入您的邮箱方便反馈,仔细核对,切勿填错！" name="email"
                                       style="border: solid 1px black;" autofocus="autofocus" onblur="shiqu()">
                                <br>
                                <span style="float:left;">内容:</span>
                                <textarea id="test2" rows="10" name="message" cols="22"
                                          style="border: solid 1px black;border-top:0px " onblur="shiqu()"
                                          placeholder="请输入你要反馈的问题"></textarea>
                                <br>
                                <input style="margin-left: 28px" class="btn-success" type="button" value="提交" onclick="sendMessage()">
                                <input type="reset" value="取消">
                            </form>
                        </div>
                        <div class="sidebar">
                            <h5 class="line"><span>相关课程.</span></h5>
                            <ul class="ads125">
                                <li><a href="#"><img src="${contextpath}/static/img/banner/3.png" alt="MyPassion"></a>
                                </li>
                                <li><a href="#"><img src="${contextpath}/static/img/banner/1.png" alt="MyPassion"></a>
                                </li>
                                <li><a href="#"><img src="${contextpath}/static/img/banner/2.png" alt="MyPassion"></a>
                                </li>
                                <li><a href="#"><img src="${contextpath}/static/img/banner/4.png" alt="MyPassion"></a>
                                </li>
                            </ul>
                        </div>
                        <div class="sidebar">
                            <h5 class="line"><span>关于课程.</span></h5>
                            <div id="accordion">
                                <h3>我怎样成为一名老师？.</h3>
                                <div>
                                    <p>Vestibulum tempor feugiat est in posuere. Sed auctor libero augue, a faucibus
                                        turpis. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices.
                                        posuere.</p>
                                </div>
                                <h3>这么看。。。.</h3>
                                <div>
                                    <p>Sed non urna. Donec et ante. Phasellus eu ligula. Vestibulum sit amet purus.
                                        Vivamus hendrerit, dolor at aliquet laoreet, mauris turpis porttitor velit,
                                        faucibus interdum tellus libero ac justo. Vivamus non quam. In suscipit faucibus
                                        urna.</p>
                                </div>
                                <h3>为什么。。。。？.</h3>
                                <div>
                                    <p>Nam enim risus, molestie et, porta ac, aliquam ac, risus. Quisque lobortis.
                                        Phasellus pellentesque purus in massa. Aenean in pede. Phasellus ac liberoac
                                        tellus pellentesque semper. Sed ac felis. Sed commodo, magna quis lacinia
                                        ornare, quam ante aliquam nisi, eu iaculis leo purus venenatis dui.</p>
                                </div>
                                <h3>可不可以。。。。？.</h3>
                                <div>
                                    <p>Cras dictum. Pellentesque habitant morbi tristique senectus et netuset malesuada
                                        fames ac turpis egestas. Vestibulum ante ipsum primis in faucibus orci luctus et
                                        ultrices posuere cubilia Curae; Aenean lacinia mauris vel est.</p>
                                </div>
                            </div>
                            <div class="sidebar">
                                <h5 class="line"><span>客服问答.</span></h5>
                                <a href="#"><img src="${contextpath}/static/img/tf_300x250_v1.gif" alt="MyPassion"></a>
                            </div>
                            <div class="sidebar">
                                <h5 class="line"><span>打折优惠.</span></h5>
                                <iframe src="http://www.facebook.com/plugins/likebox.php?href=http%3A%2F%2Fwww.facebook.com%2Fenvato&amp;width=298&amp;height=258&amp;show_faces=true&amp;colorscheme=light&amp;stream=false&amp;border_color=%23BCBCBC&amp;header=false"
                                        scrolling="no" frameborder="0"
                                        style="border:none; overflow:hidden; width:298px; height:258px;"
                                        allowtransparency="true"></iframe>
                            </div>
                        </div>
                        <!-- /左栏 -->
                    </div>
                </div>
            </section>
            <!-- / Content -->
            <!-- Footer -->
            <footer id="footer">
                <div class="container">
                    <div class="column-one-fourth">
                        <h5 class="line"><span>Tweets.</span></h5>
                        <div id="tweets"></div>
                    </div>
                    <div class="column-one-fourth">
                        <h5 class="line"><span>Navigation.</span></h5>
                        <ul class="footnav">
                            <li><a href="#"><i class="icon-right-open"></i> World.</a></li>
                            <li><a href="#"><i class="icon-right-open"></i> Business.</a></li>
                            <li><a href="#"><i class="icon-right-open"></i> Politics.</a></li>
                            <li><a href="#"><i class="icon-right-open"></i> Sports.</a></li>
                            <li><a href="#"><i class="icon-right-open"></i> Health.</a></li>
                            <li><a href="#"><i class="icon-right-open"></i> Sciences.</a></li>
                            <li><a href="#"><i class="icon-right-open"></i> Spotlight.</a></li>
                        </ul>
                    </div>
                    <div class="column-one-fourth">
                        <h5 class="line"><span>Flickr Stream.</span></h5>
                        <div class="flickrfeed">
                            <ul id="basicuse" class="thumbs">
                                <li class="hide"></li>
                            </ul>
                        </div>
                    </div>
                    <div class="column-one-fourth">
                        <h5 class="line"><span>About.</span></h5>
                        <p>Blandit rutrum, erat et egestas ultricies, dolor tortor egestas enim, quiste rhon cus sem
                            purus eu sapien. Lorem ipsum dolor sit amet adipcising elit. Elit norem simuls tortor lorem
                            adipcising purus mosteu dsapien egestas.</p>
                    </div>
                    <p class="copyright">Copyright &copy; 2014.Company name All rights reserved.<a target="_blank"
                                                                                                   href="http://sc.chinaz.com/moban/">&#x7F51;&#x9875;&#x6A21;&#x677F;</a>
                    </p>
                </div>
            </footer>
            <!-- / Footer -->
        </div>
    </div>
</div>
<!-- / Body Wrapper -->
<!-- SCRIPTS -->
<script type="text/javascript" src="${contextpath}/static/js/jquery.js"></script>
<script type="text/javascript" src="${contextpath}/static/js/LoginAndRegister.js"></script>
<script type="text/javascript" src="${contextpath}/static/js/bootstrap.modal.js"></script>
<script type="text/javascript" src="${contextpath}/static/js/easing.min.js"></script>
<script type="text/javascript" src="${contextpath}/static/js/1.8.2.min.js"></script>
<script type="text/javascript" src="${contextpath}/static/js/ui.js"></script>
<script type="text/javascript" src="${contextpath}/static/js/carouFredSel.js"></script>
<script type="text/javascript" src="${contextpath}/static/js/superfish.js"></script>
<script type="text/javascript" src="${contextpath}/static/js/customM.js"></script>
<script type="text/javascript" src="${contextpath}/static/js/flexslider-min.js"></script>
<script type="text/javascript" src="${contextpath}/static/js/timeago.js"></script>
<script type="text/javascript" src="${contextpath}/static/js/jflickrfeed.min.js"></script>
<script type="text/javascript" src="${contextpath}/static/js/mobilemenu.js"></script>
<!--[if lt IE 9]>
<script type="text/javascript" src="${contextpath}/static/js/html5.js"></script> <![endif]-->
<script type="text/javascript" src="${contextpath}/static/js/bootstrap.modal.js"></script>
<script type="text/javascript" src="${contextpath}/static/js/mypassion.js"></script>
<script type="text/javascript" src="${contextpath}/static/js/paging.js"></script>
<script type="text/javascript" src="${contextpath}/static/js/myjavascript.js"></script>
<script type="text/javascript" src="${contextpath}/static/js/myJquery.js"></script>
<script type="text/javascript" src="${contextpath}/static/js/jquery.growl.js"></script>
<!--插件-->
<script src="${contextpath}/static/js/learing.js"></script>
<script type="text/javascript">
    var jq=jQuery.noConflict();
    function sendMessage() {
        var check=true;
        if(${nowUser==null}){
            jq.growl.warning({title:"系统消息",message:"请您先登陆！"});
            check=false;
        }
        if(check){
            jq.ajax({
                url: "sendMessage",
                type: "post",
                async: false,
                data:jq("#test").serialize(),
                traditional: true,
                datatype: "Text",
                success: function (data) {
                    jq.growl.warning({title:"系统消息",message:"您的举报信息已成功上传，系统将会在两天内给您答复！"});
                },
                error:function () {
                    jq.growl.warning({title:"系统消息",message:"系统繁忙，请稍后重试！"});
                }
            });
        }
    }

    function checkedlogin() {
        if(${nowUser==null}){
            jq.growl.warning({title:"系统消息",message:"请您先登录！"});
        }
    }

    function opencourseCheckedLogin() {
        if(${course.acCourseMoney==0}){
            return true;
        }else{
            if(${nowUser==null}){
                jq.growl.warning({title:"系统消息",message:"当前课程为付费课程，请您先登陆！"});
                return false;
            }else{
                return true;
            }
        }
    }
    function checkHasCourse() {
        var check=true;
        if(${nowUser==null}){
            jq.growl.warning({title:"系统消息",message:"请您先登陆！"});
            check=false;
        }
        if(check){
            jq.ajax({
                url: "checkHasCourse",
                type: "post",
                async: false,
                data:{courseId:${course.acCourseId},userId:${nowUser.acUserId==null?0:nowUser.acUserId}},
                traditional: true,
                datatype: "Text",
                success: function (data) {
                    var message=JSON.parse(data);
//                    console.log(data);
                    if(message.status==0){
                        console.log(1);
                        if(${course.acCourseMoney==0}){
                            jq.ajax({
                                url: "insertcourse",
                                type: "post",
                                async: false,
                                data:{courseId:${course.acCourseId},userId:${nowUser.acUserId==null?0:nowUser.acUserId}},
                                traditional: true,
                                datatype: "JSON",
                                success: function (data) {
                                    jq.growl.notice({title:"消息",message:"成功加入我的课程"});
                                },
                                error:function () {
                                    jq.growl.warning({title:"系统消息",message:"系统繁忙，请稍后重试！"});
                                }
                            });
                        }else{
                            var r=confirm("是否确定购买？");
                            if(r){
                                jq.ajax({
                                    url: "insertcourse",
                                    type: "post",
                                    async: false,
                                    data:{courseId:${course.acCourseId},userId:${nowUser.acUserId==null?0:nowUser.acUserId}},
                                    traditional: true,
                                    datatype: "JSON",
                                    success: function (data) {
                                        jq.growl.notice({title:"消息",message:"成功加入我的课程"});
                                    },
                                    error:function () {
                                        jq.growl.warning({title:"系统消息",message:"系统繁忙，请稍后重试！"});
                                    }
                                });
                            }else{
                                jq.growl({title:"消息",message:"已取消购买"});
                            }
                        }
                    }else{
                        jq.growl({title:"消息",message:"已在我的课程中,请勿重复点击"});
                    }
                }
            });
        }
    }

    function web_login() {
        jq("#modal-register").hide();
        jq("#modal-login").show();
    };

    function web_register() {
        jq("#modal-login").hide();
        jq("#modal-register").show();
    };

    function web_join() {
        jq("#class-new").hide();
        jq("#class-join").show();
    };

    function web_new() {
        jq("#class-join").hide();
        jq("#class-new").show();
    };

    function warming() {
        var from = jq("#warming").next();
        var warming = jq("#warming");
        warming.hide();
        //alert(from.attr("id"));
        from.show();
    }

    function shiqu() {
        var from = jq("#warming").next();
        var warming = jq("#warming");
        var context1 = from.find("input");
        var context2 = from.find("textarea");
        //alert(context1.val()+context2.val());
        if (context1.val() == "" && context2.val() == "") {
            from.hide();
            warming.show();
        }
    }
    function showNologin() {
        jq.growl.warning({title: "消息", message: "您还未登录请您先登录"});
    }
</script>
</body>

</html>