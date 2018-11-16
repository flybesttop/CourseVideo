<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextpath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<!--[if lt IE 7 ]><html class="ie ie6" lang="en"> <![endif]-->
<!--[if IE 7 ]><html class="ie ie7" lang="en"> <![endif]-->
<!--[if IE 8 ]><html class="ie ie8" lang="en"> <![endif]-->
<!--[if (gte IE 9)|!(IE)]><!-->
<html lang="en">
<!--<![endif]-->

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="description" content="News - Clean HTML5 and CSS3 responsive template">
    <meta name="author" content="MyPassion">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>首页</title>
    <link rel="shortcut icon" href="${contextpath}/static/img/sms-4.ico"/>

    <!-- STYLES -->
    <link rel="stylesheet" type="text/css" href="${contextpath}/static/css/superfish.css" media="screen"/>
    <link rel="stylesheet" type="text/css" href="${contextpath}/static/css/fontello/fontello.css"/>
    <link rel="stylesheet" type="text/css" href="${contextpath}/static/css/flexslider.css" media="screen"/>
    <link rel="stylesheet" type="text/css" href="${contextpath}/static/css/ui.css"/>
    <link rel="stylesheet" type="text/css" href="${contextpath}/static/css/base.css"/>
    <link rel="stylesheet" type="text/css" href="${contextpath}/static/css/style.css"/>
    <link rel="stylesheet" type="text/css" href="${contextpath}/static/css/960.css"/>
    <link rel="stylesheet" type="text/css" href="${contextpath}/static/css/devices/1000.css"
          media="only screen and (min-width: 768px) and (max-width: 1000px)"/>
    <link rel="stylesheet" type="text/css" href="${contextpath}/static/css/devices/767.css"
          media="only screen and (min-width: 480px) and (max-width: 767px)"/>
    <link rel="stylesheet" type="text/css" href="${contextpath}/static/css/devices/479.css"
          media="only screen and (min-width: 200px) and (max-width: 479px)"/>
    <link href='http://fonts.googleapis.com/css?family=Merriweather+Sans:400,300,700,800' rel='stylesheet'
          type='text/css'>
    <link rel="stylesheet" type="text/css" href="${contextpath}/static/css/mystyle.css"/>
    <!--[if lt IE 9]>
    <script type="text/javascript" src="${contextpath}/static/js/customM.js"></script> <![endif]-->
    <link rel="stylesheet" type="text/css" href="${contextpath}/static/css/model.css"/>
    <link rel="stylesheet" type="text/css" href="${contextpath}/static/css/jquery.growl.css">
    <link rel="stylesheet" type="text/css" href="${contextpath}/static/css/page.css">
    <style>
        p {
            word-wrap: break-word;
        }
    </style>
</head>

<body>
<div style="display: none" data-path="${contextpath}" id="contextpath"></div>
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
                                                                    <td>
                                                                        <a href="userinfo_buy?userId=${nowUser.acUserId}">
                                                                            <div class="fix-select">我的课程</div>
                                                                        </a></td>
                                                                    <td><a href="#">
                                                                        <div class="fix-select">订单中心</div>
                                                                    </a></td>
                                                                </tr>
                                                                <tr>
                                                                    <td><a href="userinfo?userId=${nowUser.acUserId}">
                                                                        <div class="fix-select">个人设置</div>
                                                                    </a></td>
                                                                    <td><a href="#" onclick="logout()">
                                                                        <div class="fix-select login-exit">安全退出</div>
                                                                    </a></td>
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
            <!-- Slider -->
            <section id="slider">
                <div class="container">
                    <div class="main-slider">
                        <div class="badg">
                            <p>
                                <a href="#">艺术展示.</a>
                            </p>
                        </div>
                        <div class="flexslider">
                            <ul class="slides">
                                <li>
                                    <img src="${contextpath}/static/img/1-1.png" alt="MyPassion"/>
                                    <p class="flex-caption">老师1 </p>
                                </li>
                                <li>
                                    <img src="${contextpath}/static/img/1-2.png" alt="MyPassion"/>
                                    <p class="flex-caption">老师2. </p>
                                </li>
                                <li>
                                    <img src="${contextpath}/static/img/1-3.png" alt="MyPassion"/>
                                    <p class="flex-caption">老师3. </p>
                                </li>
                                <li>
                                    <img src="${contextpath}/static/img/1-4.png" alt="MyPassion"/>
                                    <p class="flex-caption">老师4 . </p>
                                </li>
                                <li>
                                    <img src="${contextpath}/static/img/1-5.png" alt="MyPassion"/>
                                    <p class="flex-caption">老师5 . </p>
                                </li>
                            </ul>
                        </div>
                    </div>
                    <div class="slider2">
                        <div class="badg">
                            <p>
                                <a href="#">快速了解.</a>
                            </p>
                        </div>
                        <a href="#"><img src="${contextpath}/static/img/2-1.png"/></a>
                        <p class="caption">宣传1. </p>
                    </div>
                    <div class="slider3">
                        <a href="#"><img src="${contextpath}/static/img/3-1.png" alt="MyPassion"/></a>
                        <p class="caption">
                            宣传2.
                           <%-- <a href="#">Happy Birthday, blue jeans! </a>--%>
                        </p>
                    </div>
                    <div class="slider3">
                        <a href="#"><img src="${contextpath}/static/img/3-2.png" alt="MyPassion"/></a>
                        <p class="caption">

                            宣传3.
                           <%-- <a href="#">Fantasy Family Photos </a>--%>
                        </p>
                    </div>
                </div>
            </section>
            <!-- / Slider -->
            <!-- Content -->
            <section id="content">
                <div class="container">
                    <!-- Main Content -->
                    <div class="main-content">
                        <!-- 新闻 -->
                        <div class="column-two-third">
                            <h5 class="line">
                                <span>热点新闻.</span>
                            </h5>
                            <div class="outertight">
                                <h2 class="regular"><a
                                        href="News_content?NewsId=${newifm.acNewsId}">【最新公告】：${newifm.acNewsTitle}.</a>
                                </h2>
                                <span class="meta">${newifm.acNewsDate}.\\ ${newifm.acNewsTime}. \\ 最新公告.</span>
                                <p>${newifm.acNewsContext}</p>
                            </div>
                            <div class="outertight m-r-no clear-marger">
                                <div id="tabs">
                                    <ul>
                                        <li>
                                            <a href="#tabs1">全部.</a>
                                        </li>
                                        <li>
                                            <a href="#tabs2">新闻.</a>
                                        </li>
                                        <li>
                                            <a href="#tabs3">公告.</a>
                                        </li>
                                    </ul>
                                    <div id="tabs1">
                                        <ul>
                                            <c:forEach items="${allnewsifm}" var="newsifm">
                                                <c:choose>
                                                    <c:when test="${newsifm.acNewsType==1}">
                                                        <li>
                                                            <span>[公告]</span><a href="News_content?NewsId=${newsifm.acNewsId}"
                                                                                class="title">${newsifm.acNewsTitle}.</a>
                                                            <span class="meta">${newsifm.acNewsDate}. \\ ${newsifm.acNewsTime}.   \\   公告.</span>
                                                        </li>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <li>
                                                            <span>[新闻]</span><a href="News_content?NewsId=${newsifm.acNewsId}"
                                                                                class="title">${newsifm.acNewsTitle}.</a>
                                                            <span class="meta">${newsifm.acNewsDate}. \\ ${newsifm.acNewsTime}.   \\   新闻.</span>
                                                        </li>
                                                    </c:otherwise>
                                                </c:choose>
                                            </c:forEach>
                                        </ul>
                                    </div>
                                    <div id="tabs2">
                                        <ul>
                                            <c:forEach items="${allnews}" var="news">
                                                <li>
                                                    <span>[新闻]</span><a href="News_content?NewsId=${news.acNewsId}" class="title">${news.acNewsTitle}.</a>
                                                    <span class="meta">${news.acNewsDate}. \\ ${news.acNewsTime}.   \\   新闻.</span>
                                                </li>
                                            </c:forEach>
                                        </ul>
                                    </div>
                                    <div id="tabs3">
                                        <ul>
                                            <c:forEach items="${allifm}" var="ifm">
                                                <li>
                                                    <span>[公告]</span><a href="News_content?NewsId=${ifm.acNewsId}" class="title">${ifm.acNewsTitle}.</a>
                                                    <span class="meta">${ifm.acNewsDate}. \\ ${ifm.acNewsTime}.   \\   公告.</span>
                                                </li>
                                            </c:forEach>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- /新闻 -->
                        <!-- 最新课程 -->
                        <div class="column-one-third">
                            <h5 class="line"><span>最新课程.</span></h5>
                            <div class="outertight">
                                <ul class="block">
                                    <c:forEach var="newcourses" items="${fourNewcourses}">
                                        <li>
                                            <a href="learing?courseId=${newcourses.acCourseId}"><img src="${contextpath}/static/${newcourses.acCourseImg}" alt="MyPassion"
                                                             class="alignleft"/></a>
                                            <p>
                                                <a href="learing?courseId=${newcourses.acCourseId}">《${newcourses.acCourseName}》</a>
                                                <span>简介：${newcourses.acCourseContext}</span>
                                                <c:choose>
                                                    <c:when test="${newcourses.acCourseMoney==0}">
                                                        <span>价格：免费</span>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <span>价格：${newcourses.acCourseMoney}</span>
                                                    </c:otherwise>
                                                </c:choose>
                                            </p>
                                            <%--<span class="rating"><span style="width:100%;"></span></span>--%>
                                        </li>
                                    </c:forEach>
                                </ul>
                            </div>
                        </div>
                        <!-- /最新课程 -->
                        <!-- 最热课程 -->
                        <div class="column-one-third">
                            <h5 class="line"><span>最热课程.</span></h5>
                            <div class="outertight m-r-no">
                                <ul class="block">
                                    <c:forEach var="hotcourses" items="${fourhotcourses}">
                                        <li>
                                            <a href="learing?courseId=${hotcourses.acCourseId}"><img src="${contextpath}/static/${hotcourses.acCourseImg}" alt="MyPassion"
                                                                                            class="alignleft"/></a>
                                            <p>
                                                <a href="learing?courseId=${hotcourses.acCourseId}">《${hotcourses.acCourseName}》</a>
                                                <span>简介：${newcourses.acCourseContext}</span>
                                                <c:choose>
                                                    <c:when test="${hotcourses.acCourseMoney==0}">
                                                        <span>价格：免费</span>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <span>价格：${hotcourses.acCourseMoney}</span>
                                                    </c:otherwise>
                                                </c:choose>
                                                <span>浏览量：${hotcourses.acCoursePicknum}</span>
                                            </p>
                                                <%--<span class="rating"><span style="width:100%;"></span></span>--%>
                                        </li>
                                    </c:forEach>
                                </ul>
                            </div>
                        </div>
                        <!-- /最热课程 -->
                        <!-- 优秀名师 -->
                    </div>
                    <!-- /Main Content -->
                    <!-- Left Sidebar -->
                    <div class="column-one-third">
                        <div class="sidebar">
                            <h5 class="line"><span>外部链接.</span></h5>
                            <ul class="social">
                                <li>
                                    <a href="#" class="facebook"><i class="icon-facebook"></i></a>
                                    <span>6,800 <br/> <i>fans</i></span>
                                </li>
                                <li>
                                    <a href="#" class="twitter"><i class="icon-twitter"></i></a>
                                    <span>12,475 <br/> <i>followers</i></span>
                                </li>
                                <li>
                                    <a href="#" class="rss"><i class="icon-rss"></i></a>
                                    <span><i>Subscribe via rss</i></span>
                                </li>
                            </ul>
                        </div>
                        <div class="sidebar">
                            <h5 class="line"><span>广告位.</span></h5>
                            <ul class="ads125">
                                <li>
                                    <a href="#"><img src="${contextpath}/static/img/banner/3.png" alt="MyPassion"/></a>
                                </li>
                                <li>
                                    <a href="#"><img src="${contextpath}/static/img/banner/1.png" alt="MyPassion"/></a>
                                </li>
                                <li>
                                    <a href="#"><img src="${contextpath}/static/img/banner/2.png" alt="MyPassion"/></a>
                                </li>
                                <li>
                                    <a href="#"><img src="${contextpath}/static/img/banner/4.png" alt="MyPassion"/></a>
                                </li>
                            </ul>
                        </div>
                        <div class="sidebar">
                            <h5 class="line"><span>Q&A.</span></h5>
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
                        </div>
                        <div class="sidebar">
                            <h5 class="line"><span>还是广告.</span></h5>
                            <a href="#"><img src="${contextpath}/static/img/tf_300x250_v1.gif" alt="MyPassion"/></a>
                        </div>
                    </div>
                    <!-- /Left Sidebar -->
                </div>
            </section>
            <!-- / Content -->
            <!-- Footer -->
            <footer id="footer">
                <div class="container">
                    <div class="column-one-fourth">
                        <h5 class="line"><span>友情链接.</span></h5>
                        <div id="tweets"></div>
                    </div>
                    <div class="column-one-fourth">
                        <h5 class="line"><span>站内链接.</span></h5>
                        <ul class="footnav">
                            <li>
                                <a href="#"><i class="icon-right-open"></i> 特聘教师.</a>
                            </li>
                            <li>
                                <a href="#"><i class="icon-right-open"></i> 学生风采.</a>
                            </li>
                            <li>
                                <a href="#"><i class="icon-right-open"></i> 师生留言.</a>
                            </li>
                            <li>
                                <a href="#"><i class="icon-right-open"></i> 历年统计.</a>
                            </li>
                            <li>
                                <a href="#"><i class="icon-right-open"></i> 乐器介绍.</a>
                            </li>
                            <li>
                                <a href="#"><i class="icon-right-open"></i> 应聘投递.</a>
                            </li>
                            <li>
                                <a href="#"><i class="icon-right-open"></i> 意见提交.</a>
                            </li>
                        </ul>
                    </div>
                    <div class="column-one-fourth">
                        <h5 class="line"><span>关于我们.</span></h5>
                        <p>Blandit rutrum, erat et egestas ultricies, dolor tortor egestas enim, quiste rhon cus sem
                            purus eu sapien. Lorem ipsum dolor sit amet adipcising elit. Elit norem simuls tortor lorem
                            adipcising purus mosteu dsapien egestas.</p>
                    </div>
                    <p class="copyright">Copyright &copy; 2014.Company name All rights reserved.
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
<script type="text/javascript" src="${contextpath}/static/js/jquery.growl.js"></script>
<script type="text/javascript" src="${contextpath}/static/js/LoginAndRegister.js"></script>
<%--<script type="text/javascript" src="${contextpath}/static/js/bootstrap.min.js"></script>--%>
<script type="text/javascript" src="${contextpath}/static/js/bootstrap.modal.js"></script>
<script type="text/javascript" src="${contextpath}/static/js/easing.min.js"></script>
<script type="text/javascript" src="${contextpath}/static/js/1.8.2.min.js"></script>
<script type="text/javascript" src="${contextpath}/static/js/ui.js"></script>
<script type="text/javascript" src="${contextpath}/static/js/carouFredSel.js"></script>
<script type="text/javascript" src="${contextpath}/static/js/superfish.js"></script>
<script type="text/javascript" src="${contextpath}/static/js/customM.js"></script>
<script type="text/javascript" src="${contextpath}/static/js/flexslider-min.js"></script>
<script type="text/javascript" src="${contextpath}/static/js/tweetable.js"></script>
<script type="text/javascript" src="${contextpath}/static/js/timeago.js"></script>
<script type="text/javascript" src="${contextpath}/static/js/jflickrfeed.min.js"></script>
<script type="text/javascript" src="${contextpath}/static/js/mobilemenu.js"></script>
<script type="text/javascript" src="${contextpath}/static/js/myjavascript.js"></script>
<script type="text/javascript" src="${contextpath}/static/js/myJquery.js"></script>

<%--<script type="text/javascript" src="${contextpath}/static/js/bootoast.js"></script>--%>

<!--[if lt IE 9]>
<script type="text/javascript" src="${contextpath}/static/js/html5.js"></script> <![endif]-->
<script type="text/javascript" src="${contextpath}/static/js/mypassion.js"></script>
<script type="text/javascript" src="${contextpath}/static/js/paging.js"></script>
<script>
    function showNologin() {
        jq.growl.warning({title: "消息", message: "您还未登录,请您先登录"});
    }
</script>
</body>

</html>