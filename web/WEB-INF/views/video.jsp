<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextpath" value="${pageContext.request.contextPath}"/>
<html lang="en" class=" js csstransitions">
<!--<![endif]-->

<head>
    <style class="vjs-styles-defaults">
        .video-js {
            width: 300px;
            height: 150px;
        }

        .vjs-fluid {
            padding-top: 56.25%
        }
    </style>
    <style class="vjs-styles-dimensions"></style>
    <style class="vjs-styles-dimensions">
        .example_video_1-dimensions {
            width: 620px;
            height: 427px;
        }

        .example_video_1-dimensions.vjs-fluid {
            padding-top: 56.25%;
        }

        .comment-reply-link-1 {
            color: #FFF;
            background: #9E9E9E;
            padding: 2px 5px;
            -webkit-border-radius: 2px;
            -moz-border-radius: 2px;
            border-radius: 2px;
            -webkit-transition: background-color 0.4s ease-in;
            -moz-transition: background-color 0.4s ease-in;
            -o-transition: background-color 0.4s ease-in;
            transition: background-color 0.4s ease-in;
        }

        .comment-reply-link-1:hover {
            background: #ea4748;
            text-decoration: none;
        }


    </style>

    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <meta name="description" content="News - Clean HTML5 and CSS3 responsive template">
    <meta name="author" content="MyPassion">

    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">

    <title>News - Responsive HTML5 and CSS3 template</title>

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
    <link href="http://fonts.googleapis.com/css?family=Merriweather+Sans:400,300,700,800" rel="stylesheet"
          type="text/css">
    <link rel="stylesheet" type="text/css" href="${contextpath}/static/css/mystyle.css">

    <link href="${contextpath}/static/css/video.css" rel="stylesheet" type="text/css">
    <!-- <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css"> -->
    <!--视频插件-->
    <link rel="stylesheet" href="${contextpath}/static/plugin/video/video-js.css">
    <!--插件-->
    <link rel="stylesheet" type="text/css" href="${contextpath}/static/css/model.css"/>
    <link rel="stylesheet" type="text/css" href="${contextpath}/static/css/mystyle.css"/>
    <link rel="stylesheet" type="text/css" href="${contextpath}/static/css/jquery.growl.css">
    <link rel="stylesheet" type="text/css" href="${contextpath}/static/css/page.css">

</head>
<div style="display: none" data-path="${contextpath}" id="contextpath"></div>
<body class="vsc-initialized" cz-shortcut-listen="true">

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
                                                            <c:if test="${lastCourse.acCourseName!=null}">
                                                            <table>
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
                                                            </table>
                                                            </c:if>
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

            <!-- Content -->
            <section id="content">
                <div class="container">

                    <div class="breadcrumbs column">
                    </div>

                    <!-- Main Content -->
                    <div class="main-content">

                        <!-- Single -->
                        <div class="column-two-third single">
                            <div class="flexslider">
                                <ul class="slides">
                                    <li style="width: 100%; float: left; margin-right: -100%; position: relative; display: list-item;"
                                        class="flex-active-slide">
                                        <video id="example_video_1" class="video-js" controls preload="none" width="620"
                                               height="427" data-setup='{ "html5" : { "nativeTextTracks" : false } }'
                                               poster="${contextpath}/static/img/poster.png">

                                            <source src="//d2zihajmogu5jn.cloudfront.net/elephantsdream/ed_hd.mp4"
                                                    type="video/mp4">

                                            <track kind="descriptions" src="descriptions.en.vtt" srclang="en"
                                                   label="English">

                                            <track kind="chapters" src="chapters.en.vtt" srclang="en" label="English">

                                            <p class="vjs-no-js">To view this video please enable JavaScript, and
                                                consider upgrading to a web browser that
                                                <a href="http://videojs.com/html5-video-support/video.jsp"
                                                   target="_blank">supports HTML5 video</a>
                                            </p>
                                        </video>
                                    </li>
                                </ul>
                                <ul class="flex-direction-nav"></ul>
                            </div>
                            <div class="select-vedio-bar">
                                <form action="openvideo">
                                    <input type="hidden" name="courseId" value="${course.acCourseId}">
                                    <input type="hidden" name="chapterId" value="${preChapterId}">
                                    <input type="hidden" name="episodeId" value="${preEpisodeId}">
                                    <c:if test="${nowUser!=null}">
                                        <input type="hidden" name="userId" value="${nowUser.acUserId}">
                                    </c:if>
                                    <button class="btn btn-success " type="submit">
                                        <i class="icon-left-dir"></i>
                                        <span class="align-middle">点击观看上一节</span>
                                    </button>
                                </form>
                                <form action="openvideo">
                                    <input type="hidden" name="courseId" value="${course.acCourseId}">
                                    <input type="hidden" name="chapterId" value="${nextChapterId}">
                                    <input type="hidden" name="episodeId" value="${nextEpisodeId}">
                                    <c:if test="${nowUser!=null}">
                                        <input type="hidden" name="userId" value="${nowUser.acUserId}">
                                    </c:if>
                                    <button class="btn btn-success " type="submit">
                                        <span class="align-middle">点击观看下一节</span>
                                        <i class="icon-right-dir"></i>
                                    </button>
                                </form>
                            </div>
                            <br>
                            <span class="meta">《${course.acCourseName}》 第${courseVideo.acVideoCourseChapter}章 第${courseVideo.acVideoCourseEpisode}节</span>
                            <h6 class="title">标题：${courseVideo.acVideoCourseTitle}</h6>
                            <%--<h7 class="title">简介：${courseVideo.acVideoCourseLikes}</h7>--%>
                            <div class="comments-box">
                                <h5 class="line">
                                    <span>交流讨论</span>
                                </h5>
                                <ul id="myTab" class="comments-nav-pills">
                                    <li>
                                        <a href="#fabu" data-toggle="tab">
                                            我要发布
                                        </a>
                                    </li>
                                </ul>
                                <div id="myTabContent" class="tab-content">
                                    <div class="tab-pane fade in active" id="quanbu">


                                        <c:forEach items="${level1Comments}" var="level1Comment">
                                            <div class="big_content" style="overflow: auto;overflow-x: hidden;">
                                                <div class="icon-finish"></div>
                                                <div class="big_content2">
                                                    <img src="${contextpath}/static/img/${level1Comment.user.acUserHeadimg}"
                                                         width="60px"
                                                         height="60px"
                                                         style="text-align: center">
                                                </div>
                                                <div class="big_content3">
                                                    <h5><b>提出课程相关问题</b></h5>
                                                    <div class="content3_div">
                                                        <p style="color: green">${level1Comment.user.acUserUsername} <a
                                                                onclick="addcomments(this)" class="comment-reply-link-1"
                                                                from="${nowUser.acUserId}"
                                                                to="${level1Comment.user.acUserId}" level="2"
                                                                pId="${level1Comment.ac_comments.acCommentsId}">reply</a>

                                                        </p>
                                                        <p style="color: black;">
                                                                ${level1Comment.ac_comments.acCommentsMessage}</p>
                                                    </div>
                                                    <div class="content3_div1">
                                                        <span>${level1Comment.ac_comments.acCommentsFromtable}浏览</span>
                                                        <span style="float: right">${level1Comment.ac_comments.acCommentsAddtime}</span>
                                                    </div>
                                                </div>
                                                <div>
                                                    <div class="comments" id="comments_1"
                                                         style="margin: 0px 0px 0px 40px; padding: 0px; overflow: hidden; display: block;">


                                                        <ul style="padding: 0;margin: 0" id="ul-test">
                                                            <c:forEach var="level2comment"
                                                                       items="${level1Comment.childcomments}">
                                                                <li style="padding: 0;margin: 0">
                                                                    <div>
                                                                        <div class="comment-avatar"><img
                                                                                src="${contextpath}/static/img/${level2comment.user.acUserHeadimg}"
                                                                                alt="MyPassion">
                                                                        </div>
                                                                        <div class="commment-text-wrap"
                                                                             style="width: 463px;">
                                                                            <div class="comment-data">
                                                                                <p style=" width: 400px;/* width: 100%; */font-size: 12px">
                                                                                    <a href="javascript:void(0);"
                                                                                       class="url">${level2comment.user.acUserUsername}</a>&nbsp;TO&nbsp;
                                                                                    <a href="javascript:void(0);"
                                                                                       class="url">${level2comment.toUserName}</a>
                                                                                    <br>
                                                                                    <span>${level2comment.ac_comments.acCommentsAddtime} - <a
                                                                                            onclick="addcomments(this)"
                                                                                            class="comment-reply-link"
                                                                                            from="${nowUser.acUserId}"
                                                                                            to="${level2comment.user.acUserId}"
                                                                                            level="3"
                                                                                            pId="${level2comment.ac_comments.acCommentsId}">reply</a>
                                                                                    </span>
                                                                                </p>
                                                                            </div>
                                                                            <div class="comment-text">${level2comment.ac_comments.acCommentsMessage}
                                                                            </div>
                                                                        </div>
                                                                    </div>


                                                                    <ul class="children" id="ul-1">
                                                                        <c:forEach var="level3comment"
                                                                                   items="${level2comment.childcomments}">
                                                                            <li>
                                                                                <div>
                                                                                    <div class="comment-avatar"><img
                                                                                            src="${contextpath}/static/img/${level3comment.user.acUserHeadimg}"
                                                                                            alt="MyPassion"></div>
                                                                                    <div class="commment-text-wrap"
                                                                                         style="width: 433px;">
                                                                                        <div class="comment-data">
                                                                                            <p style=" width: 400px;/* width: 100%; */">
                                                                                                    ${level3comment.user.acUserUsername}&nbsp;TO&nbsp;
                                                                                                    ${level3comment.toUserName}
                                                                                                <br>
                                                                                                <span>${level3comment.ac_comments.acCommentsAddtime} - <a
                                                                                                        onclick="addcomments(this)"
                                                                                                        class="comment-reply-link"
                                                                                                        from="${nowUser.acUserId}"
                                                                                                        to="${level3comment.user.acUserId}"
                                                                                                        level="3"
                                                                                                        pId="${level2comment.ac_comments.acCommentsId}">reply</a>
                                                                                                </span>
                                                                                            </p>
                                                                                        </div>
                                                                                        <div class="comment-text">${level3comment.ac_comments.acCommentsMessage}
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                            </li>
                                                                        </c:forEach>
                                                                    </ul>
                                                                </li>
                                                            </c:forEach>
                                                        </ul>
                                                    </div>
                                                </div>
                                                <button style="padding: 0;float: right;color:white;background-color: #4CAF50;margin-right: 60px"
                                                        class="btn btn-success my_button1">显示全部回答
                                                </button>
                                            </div>
                                        </c:forEach>
                                        <%--问题--%>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- /Single -->


                        <div class="contact-form" name="fabu" id="fabu">
                            <form id="contactForm" name="contactForm">
                                <input type="hidden" name="from" value="${nowUser.acUserId}">
                                <input type="hidden" name="to" value="${course.acCourseId}">
                                <input type="hidden" name="level" value="1">
                                <input type="hidden" name="pId" value="0">
                                <div class="form">
                                    <label>您的问题</label>
                                    <textarea name="message" rows="10" cols="20" placeholder="请输入你的问题"></textarea>
                                </div>
                                <div class="form2">
                                    <!--<input type="submit" class="send-message" value="Send Message" />-->
                                    <c:choose>
                                        <c:when test="${nowUser==null}">
                                            <a onclick="loglogin()" class="send">提交问题</a>
                                        </c:when>
                                        <c:otherwise>
                                            <a onclick="addcommentss()" class="send">提交问题</a>
                                        </c:otherwise>
                                    </c:choose>
                                </div>

                            </form>

                            <div class="alertMessage"></div>
                        </div>
                    </div>
                    <!-- /Main Content -->

                    <!-- Left Sidebar -->
                    <div class="column-one-third">
                        <div class="sidebar cp_box">
                            <div class="teacher">
                                <div class="tea_img">
                                    <img src="${contextpath}/static/img/image-cp/tx.jpg">
                                </div>
                                <div class="tea_name">
                                    <p style="margin-top: 20px;font-size: 14px;margin-bottom: 0px;color: black ">
                                        ${teacher.acTeacherName}</p>
                                    <p>${teacher.acTeacherPassword}</p>
                                </div>
                            </div>
                            <div class="teacher_content">
                                <p>
                                    ${teacher.acTeacherFromconpany}
                                </p>
                            </div>
                            <h4>相关课程</h4>
                            <c:forEach items="${tCourses}" var="tCourse">
                                <div class="teacher_class">
                                    <div class="class_left">
                                        <a href="learing?courseId=${tCourse.acCourseId}" target="_blank"><img
                                                src="${contextpath}/static/${tCourse.acCourseImg}"></a>
                                    </div>
                                    <div class="class_right">
                                        <p>《${tCourse.acCourseName}》</p>
                                        <c:choose>
                                            <c:when test="${tCourse.acCourseMoney==0}">
                                                <p>免费</p>
                                            </c:when>
                                            <c:otherwise>
                                                <p>价格 ￥${tCourse.acCourseMoney}</p>
                                            </c:otherwise>
                                        </c:choose>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>
                        <div class="sidebar">
                            <h5 class="line"><span>登录方式.</span></h5>
                            <ul class="social">
                                <li>
                                    <a href="javascript:void(0);" class="facebook"><i class="icon-facebook"></i></a>
                                    <span>6,800 <br> <i>fans</i></span>
                                </li>
                                <li>
                                    <a href="javascript:void(0);" class="twitter"><i class="icon-twitter"></i></a>
                                    <span>12,475 <br> <i>followers</i></span>
                                </li>
                                <li>
                                    <a href="javascript:void(0);" class="rss"><i class="icon-rss"></i></a>
                                    <span><i>Subscribe via rss</i></span>
                                </li>
                            </ul>
                        </div>

                        <div class="sidebar">
                            <h5 class="line"><span>视频教程.</span></h5>
                            <iframe src="http://player.vimeo.com/video/65110834?title=0&amp;byline=0&amp;portrait=0&amp;color=ffffff"
                                    width="300px" height="170px" frameborder="0" webkitallowfullscreen=""
                                    mozallowfullscreen="" allowfullscreen=""></iframe>
                        </div>

                        <div class="sidebar">
                            <div id="tabs" class="ui-tabs ui-widget ui-widget-content ui-corner-all">
                                <ul class="ui-tabs-nav ui-helper-reset ui-helper-clearfix ui-widget-header ui-corner-all"
                                    role="tablist">
                                    <li class="ui-state-default ui-corner-top ui-tabs-active ui-state-active" role="tab"
                                        tabindex="0" aria-controls="tabs1" aria-labelledby="ui-id-1"
                                        aria-selected="true">
                                        <a href="#tabs1" class="ui-tabs-anchor" role="presentation" tabindex="-1"
                                           id="ui-id-1">注意事项1.</a>
                                    </li>
                                    <li class="ui-state-default ui-corner-top" role="tab" tabindex="-1"
                                        aria-controls="tabs2" aria-labelledby="ui-id-2" aria-selected="false">
                                        <a href="#tabs2" class="ui-tabs-anchor" role="presentation" tabindex="-1"
                                           id="ui-id-2">注意事项2.</a>
                                    </li>
                                    <li class="ui-state-default ui-corner-top" role="tab" tabindex="-1"
                                        aria-controls="tabs3" aria-labelledby="ui-id-3" aria-selected="false">
                                        <a href="#tabs3" class="ui-tabs-anchor" role="presentation" tabindex="-1"
                                           id="ui-id-3">注意事项3.</a>
                                    </li>
                                </ul>
                                <div id="tabs1" aria-labelledby="ui-id-1"
                                     class="ui-tabs-panel ui-widget-content ui-corner-bottom" role="tabpanel"
                                     aria-expanded="true" aria-hidden="false">
                                    <ul>
                                        <li>
                                            <a href="javascript:void(0);" class="title">Blandit Rutrum, Erat et Sagittis
                                                Adipcising Elit.</a>
                                            <span class="meta">26 May, 2013.   \\   <a href="javascript:void(0);">World News.</a>   \\   <a
                                                    href="javascript:void(0);">No Coments.</a></span>
                                            <span class="rating"><span style="width:70%;"></span></span>
                                        </li>
                                        <li>
                                            <a href="javascript:void(0);" class="title">Blandit Rutrum, Erat et Sagittis
                                                Adipcising Elit.</a>
                                            <span class="meta">26 May, 2013.   \\   <a href="javascript:void(0);">World News.</a>   \\   <a
                                                    href="javascript:void(0);">No Coments.</a></span>
                                            <span class="rating"><span style="width:70%;"></span></span>
                                        </li>
                                        <li>
                                            <a href="javascript:void(0);" class="title">Blandit Rutrum, Erat et Sagittis
                                                Adipcising Elit.</a>
                                            <span class="meta">26 May, 2013.   \\   <a href="javascript:void(0);">World News.</a>   \\   <a
                                                    href="javascript:void(0);">No Coments.</a></span>
                                            <span class="rating"><span style="width:70%;"></span></span>
                                        </li>
                                        <li>
                                            <a href="javascript:void(0);" class="title">Blandit Rutrum, Erat et Sagittis
                                                Adipcising Elit.</a>
                                            <span class="meta">26 May, 2013.   \\   <a href="javascript:void(0);">World News.</a>   \\   <a
                                                    href="javascript:void(0);">No Coments.</a></span>
                                            <span class="rating"><span style="width:70%;"></span></span>
                                        </li>
                                    </ul>
                                </div>
                                <div id="tabs2" aria-labelledby="ui-id-2"
                                     class="ui-tabs-panel ui-widget-content ui-corner-bottom" role="tabpanel"
                                     aria-expanded="false" aria-hidden="true" style="display: none;">
                                    <ul>
                                        <li>
                                            <a href="javascript:void(0);" class="title">Mauris eleifend est et turpis.
                                                Duis id erat.</a>
                                            <span class="meta">27 May, 2013.   \\   <a href="javascript:void(0);">World News.</a>   \\   <a
                                                    href="javascript:void(0);">No Coments.</a></span>
                                            <span class="rating"><span style="width:70%;"></span></span>
                                        </li>
                                        <li>
                                            <a href="javascript:void(0);" class="title">Mauris eleifend est et turpis.
                                                Duis id erat.</a>
                                            <span class="meta">27 May, 2013.   \\   <a href="javascript:void(0);">World News.</a>   \\   <a
                                                    href="javascript:void(0);">No Coments.</a></span>
                                            <span class="rating"><span style="width:70%;"></span></span>
                                        </li>
                                        <li>
                                            <a href="javascript:void(0);" class="title">Mauris eleifend est et turpis.
                                                Duis id erat.</a>
                                            <span class="meta">27 May, 2013.   \\   <a href="javascript:void(0);">World News.</a>   \\   <a
                                                    href="javascript:void(0);">No Coments.</a></span>
                                            <span class="rating"><span style="width:70%;"></span></span>
                                        </li>
                                        <li>
                                            <a href="javascript:void(0);" class="title">Mauris eleifend est et turpis.
                                                Duis id erat.</a>
                                            <span class="meta">27 May, 2013.   \\   <a href="javascript:void(0);">World News.</a>   \\   <a
                                                    href="javascript:void(0);">No Coments.</a></span>
                                            <span class="rating"><span style="width:70%;"></span></span>
                                        </li>
                                    </ul>
                                </div>
                                <div id="tabs3" aria-labelledby="ui-id-3"
                                     class="ui-tabs-panel ui-widget-content ui-corner-bottom" role="tabpanel"
                                     aria-expanded="false" aria-hidden="true" style="display: none;">
                                    <ul>
                                        <li>
                                            <a href="javascript:void(0);" class="title"><strong>Someone:</strong>
                                                eleifend est et turpis. Duis id erat.Mauris eleifend est et turpis. Duis
                                                id erat.</a>
                                        </li>
                                        <li>
                                            <a href="javascript:void(0);" class="title"><strong>Someone:</strong>
                                                eleifend est et turpis. Duis id erat.Mauris eleifend est et turpis. Duis
                                                id erat.</a>
                                        </li>
                                        <li>
                                            <a href="javascript:void(0);" class="title"><strong>Someone:</strong>
                                                eleifend est et turpis. Duis id erat.Mauris eleifend est et turpis. Duis
                                                id erat.</a>
                                        </li>
                                        <li>
                                            <a href="javascript:void(0);" class="title"><strong>Someone:</strong>
                                                eleifend est et turpis. Duis id erat.Mauris eleifend est et turpis. Duis
                                                id erat.</a>
                                        </li>
                                        <li>
                                            <a href="javascript:void(0);" class="title"><strong>Someone:</strong>
                                                eleifend est et turpis. Duis id erat.Mauris eleifend est et turpis. Duis
                                                id erat.</a>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <!-- /Left Sidebar -->

                    </div>
                </div>
            </section>
            <!-- / Content -->

            <!-- Footer -->
            <footer id="footer">
                <div class="container">
                    <div class="column-one-fourth">
                        <h5 class="line"><span>Tweets.</span></h5>
                        <div id="tweets">
                            <ul class="tweetList"></ul>
                            <ul class="tweetList"></ul>
                            <ul class="tweetList"></ul>
                        </div>
                    </div>
                    <div class="column-one-fourth">
                        <h5 class="line"><span>Navigation.</span></h5>
                        <ul class="footnav">
                            <li>
                                <a href="javascript:void(0);"><i class="icon-right-open"></i> World.</a>
                            </li>
                            <li>
                                <a href="javascript:void(0);"><i class="icon-right-open"></i> Business.</a>
                            </li>
                            <li>
                                <a href="javascript:void(0);"><i class="icon-right-open"></i> Politics.</a>
                            </li>
                            <li>
                                <a href="javascript:void(0);"><i class="icon-right-open"></i> Sports.</a>
                            </li>
                            <li>
                                <a href="javascript:void(0);"><i class="icon-right-open"></i> Health.</a>
                            </li>
                            <li>
                                <a href="javascript:void(0);"><i class="icon-right-open"></i> Sciences.</a>
                            </li>
                            <li>
                                <a href="javascript:void(0);"><i class="icon-right-open"></i> Spotlight.</a>
                            </li>
                        </ul>
                    </div>
                    <div class="column-one-fourth">
                        <h5 class="line"><span>Flickr Stream.</span></h5>
                    </div>
                    <div class="column-one-fourth">
                        <h5 class="line"><span>About.</span></h5>
                        <p>Blandit rutrum, erat et egestas ultricies, dolor tortor egestas enim, quiste rhon cus sem
                            purus eu sapien. Lorem ipsum dolor sit amet adipcising elit. Elit norem simuls tortor lorem
                            adipcising purus mosteu dsapien egestas.</p>
                    </div>
                    <p class="copyright">Copyright © 2014.Company name All rights reserved.
                        <a target="_blank" href="http://sc.chinaz.com/moban/">网页模板</a>
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
<!--[if lt IE 9]>
<script type="text/javascript" src="${contextpath}/static/js/html5.js"></script> <![endif]-->
<script type="text/javascript" src="${contextpath}/static/js/mypassion.js"></script>
<script type="text/javascript" src="${contextpath}/static/js/bootstrap.button.js"></script>
<script type="text/javascript" src="${contextpath}/static/js/bootstrap.modal.js"></script>
<%--<script type="text/javascript" src="${contextpath}/static/js/video.js"></script>--%>
<script type="text/javascript" src="${contextpath}/static/js/paging.js"></script>
<script type="text/javascript" src="${contextpath}/static/js/jquery.growl.js"></script>
<script src="${contextpath}/static/plugin/video/video.js"></script>
<script type="text/javascript">
    function web_login() {
        $("#modal-register").hide();
        $("#modal-login").show();
    };

    function web_register() {
        $("#modal-login").hide();
        $("#modal-register").show();
    };
</script>
<script>
    function loglogin() {
        $.growl.warning({title: "消息", message: "您还未登录，请先登录！"});
    }

    function addcommentss() {
       $.ajax({
            url: "addcomments",
            type: "post",
            async: false,
            data: $("#contactForm").serialize(),
            traditional: true,
            datatype: "text",
            success: function (data) {
                var message = JSON.parse(data);
                alert("插入成功");
                window.location.reload();
            }
        });
    }

    function addcomments(e) {
        var check = true;
        if ($(e).attr("from") == "") {
            $.growl.warning({title: "消息", message: "您还未登录，请先登录！"});
            check = false;
        }
        if (check) {
            var str = prompt("请输入你要回复的内容^-^", "");
            if (str != null && str != "") {
                $.ajax({
                    url: "addcomments?message=" + str + "&level=" + $(e).attr("level") + "&from=" + $(e).attr("from") + "&to=" + $(e).attr("to") + "&pId=" + $(e).attr("pId"),
                    type: "post",
                    async: false,
                    traditional: true,
                    datatype: "text",
                    success: function (data) {
                        var message = JSON.parse(data);
                        alert("插入成功");
                        window.location.reload();
                    }
                });
            }
        }
    }

    function showNologin() {
        $.growl.warning({title: "消息", message: "您还未登录请您先登录"});
    }

    $(document).ready(function () {
        $(".my_button1").click(function () {
            $(this).parent().children("div").eq(3).slideToggle("3000");
        });
    });
</script>
<!--[if lt IE 9]>
<script type="text/javascript" src="${contextpath}/static/js/customM.js"></script> <![endif]-->

</body>

</html>