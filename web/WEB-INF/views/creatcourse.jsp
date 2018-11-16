<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<!--[if lt IE 7 ]>
<html class="ie ie6" lang="en"> <![endif]-->
<!--[if IE 7 ]>
<html class="ie ie7" lang="en"> <![endif]-->
<!--[if IE 8 ]>
<html class="ie ie8" lang="en"> <![endif]-->
<!--[if (gte IE 9)|!(IE)]><!-->
<html lang="en">
<!--<![endif]-->

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="description" content="News - Clean HTML5 and CSS3 responsive template">
    <meta name="author" content="MyPassion">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>课程页面</title>
    <link rel="shortcut icon"
          href="${pageContext.request.contextPath}/static/img/sms-4.ico"/>
    <!-- STYLES -->
    <link rel="stylesheet" type="text/css"
          href="${pageContext.request.contextPath}/static/css/superfish.css"
          media="screen"/>
    <link rel="stylesheet" type="text/css"
          href="${pageContext.request.contextPath}/static/css/fontello/fontello.css"/>
    <link rel="stylesheet" type="text/css"
          href="${pageContext.request.contextPath}/static/css/flexslider.css"
          media="screen"/>
    <link rel="stylesheet" type="text/css"
          href="${pageContext.request.contextPath}/static/css/ui.css"/>
    <link rel="stylesheet" type="text/css"
          href="${pageContext.request.contextPath}/static/css/base.css"/>
    <link rel="stylesheet" type="text/css"
          href="${pageContext.request.contextPath}/static/css/style.css"/>
    <link rel="stylesheet" type="text/css"
          href="${pageContext.request.contextPath}/static/css/960.css"/>
    <link rel="stylesheet" type="text/css"
          href="${pageContext.request.contextPath}/static/css/devices/1000.css"
          media="only screen and (min-width: 768px) and (max-width: 1000px)"/>
    <link rel="stylesheet" type="text/css"
          href="${pageContext.request.contextPath}/static/css/devices/767.css"
          media="only screen and (min-width: 480px) and (max-width: 767px)"/>
    <link rel="stylesheet" type="text/css"
          href="${pageContext.request.contextPath}/static/css/devices/479.css"
          media="only screen and (min-width: 200px) and (max-width: 479px)"/>
    <link rel="stylesheet" type="text/css"
          href="${pageContext.request.contextPath}/static/css/mystyle.css"/>
    <!--[if lt IE 9]>
    <!--<script type="text/javascript" src="${pageContext.request.contextPath}../../static/js/customM.js"></script>-->
    <![endif]-->
    <link rel="stylesheet" type="text/css"
          href="${pageContext.request.contextPath}/static/css/model.css"/>
    <link rel="stylesheet" type="text/css"
          href="${pageContext.request.contextPath}/static/css/learning.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}../../static/css/jquery.growl.css">

    <script type="text/javascript">
        function web_login() {
            j("#modal-register").hide();
            j("#modal-login").show();
        };

        function web_register() {
            j("#modal-login").hide();
            j("#modal-register").show();
        };
    </script>
</head>
<contextPath style="display: none;"> ${pageContext.request.contextPath}</contextPath>
<body>
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
                                <a href="index"><img src="${pageContext.request.contextPath}/static/img/logo.png" alt="MyPassion"/></a>
                            </div>
                            <c:choose>
                                <c:when test="${nowUser==null}">
                                    <div class="haed-c-user">
                                        <ul class="sf-menu user-menu">
                                            <li>
                                                <a data-toggle="modal" data-target="#web_user" onclick="web_login2()"
                                                   style="border: none;">
                                                    <div class="user-c">
                                                        <div class="user-c-username"
                                                             data-id="${nowUser.acUserId}">请登录</div>
                                                        <div class="user-c-photo">
                                                            <img class="photo-c"
                                                                 src="${pageContext.request.contextPath}/static/img/head.png">
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
                                                        <div class="user-c-username"
                                                             data-id="${nowUser.acUserId}">${nowUser.acUserUsername}</div>
                                                        <div class="user-c-photo">
                                                            <img class="photo-c"
                                                                 src="${pageContext.request.contextPath}/static/img/${nowUser.acUserHeadimg}">
                                                        </div>
                                                    </div>
                                                </a>
                                                <ul>
                                                    <li>
                                                        <div class="login-head-c  breadcrumbs">
                                                            <div class="login-head-left">
                                                                <a href="userinfo?userId=${nowUser.acUserId}">
                                                                    <img src="${pageContext.request.contextPath}/static/img/${nowUser.acUserHeadimg}"></a>
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
                                                     src="${pageContext.request.contextPath}/static/img/require_error.png">账号不存在
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
                                                     src="${pageContext.request.contextPath}/static/img/require_error.png">密码错误
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="modal-table-text" style="padding-top:0px">
                                                <div class="code-img-c">
                                                    <img class="code-img"
                                                         src="${pageContext.request.contextPath}/yanzhenma/getLoginyanzhenma"
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
                                                                                        src="${pageContext.request.contextPath}/static/img/require_error.png">验证码错误！
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
                                                                                        src="${pageContext.request.contextPath}/static/img/require_error.png">请填写正确的手机号
                                                </div>
                                            </td>
                                        </tr>
                                        <tr id="right-mobile" style="display: none;">
                                            <td>&nbsp;</td>
                                            <td class="require-c-modal">
                                                <div class="require-c-modal-true"><img class="require-img"
                                                                                       src="${pageContext.request.contextPath}/static/img/require_true.png">手机号码可用
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
                                                                                        src="${pageContext.request.contextPath}/static/img/require_error.png">请填写正确的昵称格式
                                                </div>
                                            </td>
                                        </tr>
                                        <tr id="right-name" style="display: none;">
                                            <td>&nbsp;</td>
                                            <td class="require-c-modal">
                                                <div class="require-c-modal-true"><img class="require-img"
                                                                                       src="${pageContext.request.contextPath}/static/img/require_true.png">该昵称可用
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
                                                                                        src="${pageContext.request.contextPath}/static/img/require_error.png">密码格式不正确
                                                </div>
                                            </td>
                                        </tr>
                                        <tr id="right-pwd" style="display: none;">
                                            <td>&nbsp;</td>
                                            <td class="require-c-modal">
                                                <div class="require-c-modal-true"><img class="require-img"
                                                                                       src="${pageContext.request.contextPath}/static/img/require_true.png">该密码可用
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
                                                                                        src="${pageContext.request.contextPath}/static/img/require_error.png">请勿实用单字或特殊字符
                                                </div>
                                            </td>
                                        </tr>
                                        <tr id="right-truename" style="display: none;">
                                            <td>&nbsp;</td>
                                            <td class="require-c-modal">
                                                <div class="require-c-modal-true"><img class="require-img"
                                                                                       src="${pageContext.request.contextPath}/static/img/require_true.png">名称格式正确
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
                                                                                        src="${pageContext.request.contextPath}/static/img/require_error.png">请输入正确身份证格式
                                                </div>
                                            </td>
                                        </tr>
                                        <tr id="right-idcard" style="display: none;">
                                            <td>&nbsp;</td>
                                            <td class="require-c-modal">
                                                <div class="require-c-modal-true"><img class="require-img"
                                                                                       src="${pageContext.request.contextPath}/static/img/require_true.png">身份证可用
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
                                                                                        src="${pageContext.request.contextPath}/static/img/require_error.png">请填写正确的邮箱格式
                                                </div>
                                            </td>
                                        </tr>
                                        <tr id="right-email" style="display: none;">
                                            <td>&nbsp;</td>
                                            <td class="require-c-modal">
                                                <div class="require-c-modal-true"><img class="require-img"
                                                                                       src="${pageContext.request.contextPath}/static/img/require_true.png">格式正确，可以使用
                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="modal-table-text" style="padding-top:0px">
                                                <div class="code-img-c">
                                                    <img class="code-img"
                                                         src="${pageContext.request.contextPath}/yanzhenma/getRegisteryanzhenma"
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
                                                                                        src="${pageContext.request.contextPath}/static/img/require_error.png">验证码错误！
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
            <div class="modal fade" id="add-section-modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
                 aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <!--登录界面-->
                        <div>
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                                    &times;
                                </button>
                                <h4 class="modal-title">
                                    添加新节
                                </h4>
                            </div>
                            <form method="POST">
                                <div class="modal-body">
                                    <table>
                                        <tr>
                                            <td>标题</td>
                                            <td><input type="text" name="section-title"></td>
                                        </tr>
                                        <tr>
                                            <td>上传视频</td>
                                            <td><input type="file" name="section-video"></td>
                                        </tr>
                                        <tr>
                                            <td>上传PPT(没有可以不传)</td>
                                            <td><input type="file" name="sectionr-PPT" accept=".ppt"></td>
                                        </tr>
                                    </table>
                                </div>
                                <div class="modal-footer" style="margin: 0px auto;">
                                    <button type="button" class="btn btn-default close" data-dismiss="modal"
                                            aria-hidden="true">
                                        取消
                                    </button>
                                    <button type="button" class="btn btn-primary" onclick="creat_section()">
                                        确定
                                    </button>
                                </div>
                            </form>
                        </div>
                    </div><!-- /.modal -->
                </div>
            </div>
            <div class="modal fade" id="add-chapter-modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
                 aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div>
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                                    &times;
                                </button>
                                <h4 class="modal-title">
                                    添加新章
                                </h4>
                            </div>
                            <form method="POST">
                                <div class="modal-body">
                                    <table>
                                        <tr>
                                            <td>章名</td>
                                            <td><input type="text" name="chapter-name"></td>
                                        </tr>
                                        <tr>
                                            <td>简介</td>
                                            <td><input type="text" name="chapter-summary"></td>
                                        </tr>
                                        <tr>
                                            <td>上传视频</td>
                                            <td><input type="file" name="chapter-video" accept=".mp4"></td>
                                        </tr>
                                        <tr>
                                            <td>上传PPT(没有可以不传)</td>
                                            <td><input type="file" name="chapter-PPT" accept=".ppt"></td>
                                        </tr>
                                    </table>
                                </div>
                                <div class="modal-footer" style="margin: 0px auto;">
                                    <button type="button" class="btn btn-default close" data-dismiss="modal"
                                            aria-hidden="true">
                                        取消
                                    </button>
                                    <button type="button" class="btn btn-primary" onclick="creat_chapter()">
                                        确定
                                    </button>
                                </div>
                            </form>
                        </div>
                    </div><!-- /.modal -->
                </div>
            </div>

            <div class="modal fade" id="add-course-modal" tabindex="-1" role="dialog"
                 aria-labelledby="myModalLabel"
                 aria-hidden="true">
                <div class="modal-dialog" style="width:300px;">
                    <div class="modal-content">
                        <!--登录界面-->
                        <div class="course-info">
                            <img src="${pageContext.request.contextPath}static/img/trash/24.png" alt="MyPassion"/>
                            <form action="#" method="POST">
                                <div>
                                    <table>
                                        <tr class="editcourse-box-name">
                                            <td colspan="2">
                                                <input id="editcourse-photo-url1" type="file" name="photo-url"
                                                       onkeyup="require_mobile()" required="required">
                                            </td>
                                        </tr>
                                        <tr class="editcourse-box-name">
                                            <td>课名</td>
                                            <td>
                                                <input id="editcourse-name1" type="text" name="mobile"
                                                       required="required">
                                            </td>
                                        </tr>
                                        <tr class="editcourse-box-price">
                                            <td class="modal-table-text">定价</td>
                                            <td class="modal-table-input">
                                                <input id="editcourse-price1" type="text" name="price"
                                                       required="required" placeholder="请谨慎修改" size="10">
                                            </td>
                                        </tr>
                                        <tr class="editcourse-box-content">
                                            <td class="modal-table-text">方向</td>
                                            <td class="modal-table-input">
                                                <select data-type="lv11">

                                                </select>
                                            </td>
                                        </tr>
                                        <tr class="editcourse-box-content">
                                            <td class="modal-table-text">类型</td>
                                            <td class="modal-table-input">
                                                <select data-type="lv21">

                                                </select>
                                            </td>
                                        </tr>
                                        <tr class="editcourse-box-content">
                                            <td class="modal-table-text">简介</td>
                                            <td class="modal-table-input">
                                                <textarea id="editcourse-content1" name="content"
                                                          rows="3" cols="20" required="required"
                                                          placeholder="不得为空" maxlength="200">
                                                </textarea>
                                            </td>
                                        </tr>
                                    </table>
                                </div>
                                <div class="modal-footer" style="margin: 0px auto;">
                                    <button type="button" class="btn btn-primary" data-method="addCourse">
                                        确认修改
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
                    <div id="nav-tree-c" class="breadcrumbs nav-tree-c">
                        <p><a href="index">主页.</a> \\ 管理课程. </p>
                    </div>
                    <!-- Main Content -->
                    <div class="content">
                        <!-- <div class="relatednews editcourse-box"> -->
                        <div class="editcourse-box">
                            <h5 class="line"><span>开课/修改 内容.</span></h5>
                            <div class="editcourse-box-c">
                                <div class="editcourse-box-left">
                                    <div class="course-info">
                                        <img src="${pageContext.request.contextPath}/static/img/trash/24.png"
                                             alt="MyPassion"/>
                                        <form action="#" method="POST">
                                            <div>
                                                <table>
                                                    <tr class="editcourse-box-name">
                                                        <td colspan="2">
                                                            <input id="editcourse-photo-url" type="file"
                                                                   name="photo-url" onkeyup="require_mobile()"
                                                                   required="required">
                                                        </td>
                                                    </tr>
                                                    <tr class="editcourse-box-name">
                                                        <td>课名</td>
                                                        <td>
                                                            <input id="editcourse-name" type="text" name="mobile"
                                                                   onkeyup="require_mobile()" required="required">
                                                        </td>
                                                    </tr>
                                                    <tr class="editcourse-box-price">
                                                        <td class="modal-table-text">定价</td>
                                                        <td class="modal-table-input">
                                                            <input id="editcourse-price" type="text" name="price"
                                                                   onkeyup="require_truename()" required="required"
                                                                   placeholder="请谨慎修改" size="10">
                                                        </td>
                                                    </tr>
                                                    <tr class="editcourse-box-content">
                                                        <td class="modal-table-text">方向</td>
                                                        <td class="modal-table-input">
                                                            <select data-type="lv1">

                                                            </select>
                                                        </td>
                                                    </tr>
                                                    <tr class="editcourse-box-content">
                                                        <td class="modal-table-text">类型</td>
                                                        <td class="modal-table-input">
                                                            <select data-type="lv2">
                                                            </select>
                                                        </td>
                                                    </tr>
                                                    <tr class="editcourse-box-content">
                                                        <td class="modal-table-text">简介</td>
                                                        <td class="modal-table-input">
                                                                <textarea id="editcourse-content" name="content"
                                                                          rows="3" cols="20" required="required"
                                                                          placeholder="不得为空" maxlength="200">
                                                                </textarea>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </div>
                                            <div class="modal-footer" style="margin: 0px auto;">
                                                <button type="button" data-type='addNewCourse' class="btn btn-primary"
                                                        onclick="">
                                                    填写完毕申请开课
                                                </button>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- Single -->
                        <div class="relatednews search-cloumn-4">
                            <h5 class="line"><span>我的课程.</span></h5>
                            <ul data-class="MyCourse">

                            </ul>
                        </div>
                    </div>
                    <!-- /Single -->
                </div>
                <!-- /Main Content -->
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


<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/jquery.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/easing.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/1.8.2.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/ui.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/carouFredSel.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/superfish.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/customM.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/flexslider-min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/timeago.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/jflickrfeed.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/mobilemenu.js"></script>
<!--[if lt IE 9]>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/html5.js"></script> <![endif]-->
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/bootstrap.modal.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/mypassion.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/select-box.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/LoginAndRegister.js"></script>

<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/jquery.growl.js"></script>

<script type="text/javascript">
    var section_index = -1;
    var chapter_index = -1;
    var j = jQuery.noConflict();
    var id = j("div[class=user-c-username]");
    var context = j("contextPath").val();
    var course = j("ul[data-class=MyCourse]");
    var courseBox = j("div[class=editcourse-box-c]");
    var data1 = undefined;
    var flag = false;

    j("button[data-method=addCourse]").on({
        click: function () {
            var formData = new FormData();
            formData.append("image", j("#editcourse-photo-url1")[0].files[0]);
            j.ajax({
                url: '${pageContext.request.contextPath}/upload/uploadImage',
                type: "post",
                cache: false,
                dataType: "json",
                data: formData,
                processData: false,
                contentType: false,
                success: function (data) {
                    console.log(data);
                    if (data.status == 1) {
                        j.growl.notice({
                            title: "处理完成",
                            message: data.info
                        })
                        j.ajax({
                            url: '${pageContext.request.contextPath}/addCourse',
                            type: "post",
                            dataType: "json",
                            data: {
                                img: data.data.imageUrl,
                                courseName: j("#editcourse-name1").val(),
                                price: j("#editcourse-price1").val(),
                                lv2: j("select[data-type=lv21]").val(),
                                context: j("#editcourse-content1").val(),
                                id: id.attr("data-id")
                            },
                            cache: false,
                            async: false,
                            success: function (data) {
                                if (data.status == 1) {
                                    j.growl.notice({
                                        title: "处理完成",
                                        message: data.info
                                    })
                                }
                                j('#add-course-modal').modal("hide");
                            },
                        });
                    }
                },
            });
        }
    })

    j(document).ready(function () {
        j.ajax({
            url: '${pageContext.request.contextPath}/getAllCourse',
            type: "post",
            dataType: "json",
            data: {
                id: id.attr("data-id"),
            },
            cache: false,
            async: false,
            success: function (data) {
                data = data.data;
                for (var i = 0; i < data.length; i++) {
                    course.append("<li>" +
                        "    <a href='javascript:void(0)'><img src='" + context + "/static/img/trash/5.png'" +
                        "                     alt='MyPassion'/></a>" +
                        "    <p>" +
                        "        <a href='javascript:void(0)'>《" + data[i].acCourseName + "》&nbsp;&nbsp;&nbsp;￥" + data[i].acCourseMoney + " </a>" +
                        "    </p>" +
                        "        <i class='icon-plus'></i>购买量：<span>" + data[i].acCoursePicknum + "</span></span>" +
                        "<span data-type='course-context' style='display: none'>" + data[i].acCourseContext + "</span>" +
                        "<span data-type='courseId' data-courseId='" + data[i].acCourseId + "'></span><span data-type='lv1name' data-value='" + data[i].lv1Name + "'></span><span data-value='" + data[i].lv2Name + "' data-type='lv2name'></span>" +
                        "</li>")
                }
                bind();
            }
        });
        j.ajax({
            url: '${pageContext.request.contextPath}/getAllRelations',
            type: "post",
            dataType: "json",
            data: {},
            cache: false,
            async: false,
            success: function (data) {
                data1 = data;
                j("select[data-type=lv1]").empty();
                for (var i = 0; i < data1.length; i++) {
                    if (data1[i].acRelationshipsLevel == 1) {
                        j("select[data-type=lv1]").append("<option  value='" + data1[i].id + "'>" + data1[i].acRelationshipsItemname + "</option>")
                    }
                }
                j("select[data-type=lv1]").off();
                j("select[data-type=lv1]").on({
                    click: function () {
                        j("select[data-type=lv2]").empty();
                        for (var i = 0; i < data1.length; i++) {
                            if (data1[i].acRelationshipsLevel == 2 && data1[i].acRelationshipsParendid == j(this).val()) {
                                j("select[data-type=lv2]").append("<option data-id='" + data1[i].id + "' value='" + data1[i].id + "'>" + data1[i].acRelationshipsItemname + "</option>")
                            }
                        }
                    }
                })
            },

        });


    })

    function bind() {
        var course = j("ul[data-class=MyCourse]");
        var courseLi = course.find("li");
        var addButton = j("button[data-type=addNewCourse]");
        addButton.off();
        addButton.on({
            click: function () {
                j('#add-course-modal').modal()
                j("select[data-type=lv11]").empty();
                for (var i = 0; i < data1.length; i++) {
                    if (data1[i].acRelationshipsLevel == 1) {
                        j("select[data-type=lv11]").append("<option  value='" + data1[i].id + "'>" + data1[i].acRelationshipsItemname + "</option>")
                    }
                }
                j("select[data-type=lv11]").off();
                j("select[data-type=lv11]").on({
                    click: function () {
                        j("select[data-type=lv21]").empty();
                        for (var i = 0; i < data1.length; i++) {
                            if (data1[i].acRelationshipsLevel == 2 && data1[i].acRelationshipsParendid == j(this).val()) {
                                j("select[data-type=lv21]").append("<option data-id='" + data1[i].id + "' value='" + data1[i].acRelationshipsItemid + "'>" + data1[i].acRelationshipsItemname + "</option>")
                            }
                        }
                    }
                })
            }
        })
        courseLi.off();
        courseLi.on({
            click: function () {
                courseBox.empty();
                courseBox.append("<div class='editcourse-box-left' data-editid='" + j(this).find("span[data-type=courseId]").attr("data-courseId") + "'>" +
                    "    <div class='course-info'>" +
                    "        <img src='" + j(this).find("img").attr("src") + "' alt='MyPassion'/>" +
                    "        <form action='#' method='POST'>" +
                    "            <div>" +
                    "                <table>" +
                    "                    <tr class='editcourse-box-name'>" +
                    "                        <td colspan='2'>" +
                    "                            <input disabled='disabled' id='editcourse-photo-url' type='file'" +
                    "                                   name='photo-url' onkeyup=''" +
                    "                                   required='required'>" +
                    "                        </td>" +
                    "                    </tr>" +
                    "                    <tr class='editcourse-box-name'>" +
                    "                        <td>课名</td>" +
                    "                        <td>" +
                    "                            <input disabled='disabled' id='editcourse-name' type='text' name='courseName'" +
                    "                                   onkeyup='' required='required' value='" + j(this).find("p").find("a").html().split('&nbsp;')[0] + "'>" +
                    "                        </td>" +
                    "                    </tr>" +
                    "                    <tr class='editcourse-box-price'>" +
                    "                        <td class='modal-table-text'>定价</td>" +
                    "                        <td class='modal-table-input'>" +
                    "                            <input disabled='disabled' id='editcourse-price' type='text' name='price'" +
                    "                                   onkeyup='' required='required'" +
                    "                                   placeholder='请谨慎修改' size='10' value='" + j(this).find("p").find("a").html().split('&nbsp;')[3] + "'>" +
                    "                        </td>" +
                    "                    </tr>" +
                    "                    <tr class='editcourse-box-content'>" +
                    "                        <td class='modal-table-text'>方向</td>" +
                    "                        <td class='modal-table-input'>" +
                    "                           " + j("span[data-type=lv1name]").attr("data-value") +
                    "                        </td>" +
                    "                    </tr>" +
                    "                    <tr class='editcourse-box-content'>" +
                    "                        <td class='modal-table-text'>类型</td>" +
                    "                        <td class='modal-table-input'>" +
                    "                            " + j("span[data-type=lv2name]").attr("data-value") +
                    "                        </td>" +
                    "                    </tr>" +
                    "                    <tr class='editcourse-box-content'>" +
                    "                        <td class='modal-table-text'>简介</td>" +
                    "                        <td class='modal-table-input'>" +
                    "                                <textarea disabled='disabled' id='editcourse-content' name='content'" +
                    "                                          rows='3' cols='20' required='required'" +
                    "                                          placeholder='不得为空' maxlength='200' form='' value=''>" + j(this).find("span[data-type=course-context]").html() + "</textarea>" +
                    "                        </td>" +
                    "                    </tr>" +
                    "                </table>" +
                    "            </div>" +
                    "            <div class='modal-footer' style='margin: 0px auto;'>" +
                    "                <button type='button' data-type='addNewCourse' class='btn btn-default'>" +
                    "                     填写完毕申请开课" +
                    "                </button>" +
                    "            </div>" +
                    "        </form>" +
                    "    </div>" +
                    "</div>" +
                    "<div class='editcourse-box-right m-r-no'><div class='main-content'>" +
                    "</div></div>");
                j.ajax({
                    url: '${pageContext.request.contextPath}/getAllChapter',
                    type: "post",
                    dataType: "json",
                    data: {
                        id: j("div[class=editcourse-box-left]").attr("data-editid"),
                    },
                    cache: false,
                    async: false,
                    success: function (data) {
                        console.log(data);
                        for (var i = 0; i < data.length; i++) {
                            if (data[i].acVideoCourseParentchapter == "0") {
                                j(".main-content").append(
                                    "<div class='container-learn-box'>" +
                                    "<h4 class='breadcrumbs'>第" + data[i].acVideoCourseChapter + "章" + data[i].acVideoCourseTitle + "</h4>" +
                                    "<p>" + data[i].acVideoCourseLikes + "</p>" +
                                    "<ul class='p2-ul-nourl' data-chapid='" + data[i].acVideoCourseChapter + "'><li data-type='add'>" +
                                    "<div class='p2-div3 add-section'>" +
                                    "<button class='p2-button'><i class='icon-plus'></i>增加节数</button>" +
                                    "</div>" +
                                    "</li>" +
                                    "</ul></div>"
                                );
                            }
                        }
                        for (var i = 0; i < data.length; i++) {
                            if (data[i].acVideoCourseParentchapter != "0") {
                                var id = data[i].acVideoCourseChapter;
                                j("ul[data-chapid=" + id + "]").find("li[data-type=add]").before(" <li>" +
                                    "    <div class='p2-div1'>" +
                                    "        <img src='" + context + "/static/img/learning/video_fill.png'" +
                                    "             class='p2-img'>" +
                                    "    </div>" +
                                    "    <div class='p2-div2'>" +
                                    "        <P>" + data[i].acVideoCourseChapter + "-" + data[i].acVideoCourseEpisode + " " + data[i].acVideoCourseTitle + "</P>" +
                                    "    </div>" +
                                    "</li>"
                                );
                            }
                        }
                        if (data.length == 0) {
                            flag = true
                            j(".main-content").append("<div class='container-learn-box'></div>");
                        } else {
                            flag = false;
                        }
                        j(".main-content").append("<div class='container-learn-box'>" +
                            "    <div class='add-chapter'>" +
                            "        <button class='p2-button'><i" +
                            "                class='icon-plus'></i>增加章数" +
                            "        </button>" +
                            "    </div>" +
                            "</div>")
                    }

                    ,

                });

                j("select[data-type=lv1]").empty();
                for (var i = 0; i < data1.length; i++) {
                    if (data1[i].acRelationshipsLevel == 1) {
                        j("select[data-type=lv1]").append("<option  value='" + data1[i].id + "'>" + data1[i].acRelationshipsItemname + "</option>")
                    }
                }
                j("select[data-type=lv1]").off();
                j("select[data-type=lv1]").on({
                    click: function () {
                        j("select[data-type=lv2]").empty();
                        for (var i = 0; i < data1.length; i++) {
                            if (data1[i].acRelationshipsLevel == 2 && data1[i].acRelationshipsParendid == j(this).val()) {
                                j("select[data-type=lv2]").append("<option data-id='" + data1[i].acRelationshipsItemid + "' value='" + data1[i].acRelationshipsItemname + "'>" + data1[i].acRelationshipsItemname + "</option>")
                            }
                        }
                    }
                })

                bind();
            }
        })

        bind1();
    }


    function bind1() {
        j('.editcourse-box-right').off();
        j(".add-chapter button").off();
        j('.editcourse-box-right').on('click', '.add-section button', function () {
            section_index = j(this).parent().parent().index();
            chapter_index = j(this).parent().parent().parent().parent('.container-learn-box').index();
            j('#add-section-modal').modal();
        });

        j(".add-chapter button").click(function () {
            if (j('.p2-ul-nourl:last li').length == 1) {
                alert("上一章内容不得为空！");
            } else {
                chapter_index = j(this).parent().parent().parent().parent('.container-learn-box').index();
                j('#add-chapter-modal').modal();
            }
        });


        j('.editcourse-box-right').on('click', '.add-section button', function () {
            section_index = j(this).parent().parent().index();
            console.log("1" + chapter_index)
            chapter_index = j(this).parent().parent().parent().parent('.container-learn-box').index();
            console.log("2" + chapter_index)
            j('#add-section-modal').modal();
            console.log("3" + chapter_index)
        });

        j(".add-chapter button").click(function () {
            if (j('.p2-ul-nourl:last li').length == 1) {
                alert("上一章内容不得为空！");
            } else {
                chapter_index = j(this).parent().parent().parent().parent('.container-learn-box').index();
                j('#add-chapter-modal').modal();
            }
        });
    }

    function creat_section() {
        var sectionName = j('#add-section-modal input[name="section-title"]');

        if (sectionName.val() == '') {
            alert("字段未填写完整");
        } else {
            var chapter = chapter_index;
            if (flag) {
            } else {
                chapter = chapter_index + 1
            }
            var formData = new FormData();
            formData.append('videoFile', j('input[name=chapter-video]')[0].files[0]);
            formData.append('ppt', j('input[name=chapter-PPT]')[0].files[0]);
            j.ajax({
                url: '${pageContext.request.contextPath}/upload/uploadFile',
                type: 'POST',
                cache: false,
                dataType: "json",
                data: formData,
                processData: false,
                contentType: false,
                success: function (data) {
                    console.log(data);
                    j.ajax({
                        url: '${pageContext.request.contextPath}/addCourseVideo',
                        type: "post",
                        dataType: "json",
                        data: {
                            videoPath: data.data.videoUrl,
                            pptPath: data.data.pptUrl,
                            chapter: (chapter),
                            parentChapter: chapter,
                            episode: (section_index + 1),
                            courseId: j(".editcourse-box-left").attr("data-editid"),
                            title: sectionName.val()
                        },
                        cache: false,
                        async: false,
                        success: function (data) {
                            if (data.status == 1) {
                                j.growl.notice({
                                    title: "处理完成",
                                    message: data.info
                                })
                                console.log(chapter);
                                var str = '<li><div class="p2-div1"><img src="${pageContext.request.contextPath}/static/img/learning/video_fill.png" class="p2-img" ></div><div class="p2-div2"><p>' + chapter + '-' + (section_index + 1) + ' ' + sectionName.val() + '</p></div></li>';
                                var liNum = j('.container-learn-box').eq(chapter_index).find('li').length;
                                console.log(liNum)
                                if (liNum == 1) {
                                    j('.container-learn-box').eq(chapter_index).find('li').eq(-1).before(str);
                                } else {
                                    j('.container-learn-box').eq(chapter_index).find('li').eq(-2).after(str);
                                }
                                j('#add-section-modal').modal('hide')
                            } else {
                                j.growl.error({
                                    title: "发生错误",
                                    message: data.info
                                })
                            }
                        },
                    });
                },
            });
        }
    }

    function creat_chapter() {
        var chapterNum = j('.p2-ul-nourl').length + 1;
        var chapterName = j('#add-chapter-modal input[name="chapter-name"]');
        var chapterSummary = j('#add-chapter-modal input[name="chapter-summary"]');
        if (chapterName.val() == '' || chapterSummary.val() == '') {
            alert("字段未填写完整");
        } else {
            var formData = new FormData();
            formData.append('videoFile', j('input[name=chapter-video]')[0].files[0]);
            formData.append('ppt', j('input[name=chapter-PPT]')[0].files[0]);
            j.ajax({
                url: '${pageContext.request.contextPath}/upload/uploadFile',
                type: 'POST',
                cache: false,
                dataType: "json",
                data: formData,
                processData: false,
                contentType: false,
                success: function (data) {
                    console.log(data);
                    j.ajax({
                        url: '${pageContext.request.contextPath}/addCourseVideo',
                        type: "post",
                        dataType: "json",
                        data: {
                            videoPath: data.data.videoUrl,
                            pptPath: data.data.pptUrl,
                            chapter: chapterNum,
                            parentChapter: "0",
                            episode: "0",
                            courseId: j(".editcourse-box-left").attr("data-editid"),
                            context: chapterSummary.val(),
                            title: chapterName.val()
                        },
                        cache: false,
                        async: false,
                        success: function (data) {
                            if (data.status == 1) {
                                j.growl.notice({
                                    title: "处理完成",
                                    message: data.info
                                })
                                var str = '<div class="container-learn-box"><h4 class="breadcrumbs">第' + chapterNum + '章 ' + chapterName.val() + '</h4><p>' + chapterSummary.val() + '</p><ul class="p2-ul-nourl">' + '<li><div class="p2-div3 add-section"><button class="p2-button"><i class="icon-plus"></i>增加节数</button></div></li></ul></div>';
                                j('.container-learn-box').eq(-2).after(str);
                                clear_content(chapterName);
                                clear_content(chapterSummary);
                                j('#add-chapter-modal').modal('hide')
                            } else {
                                j.growl.error({
                                    title: "发生错误",
                                    message: data.info
                                })
                            }
                        },
                    });
                },
            });
        }
    }


    function clear_content(c) {
        c.val("");
        section_index = -1;
        chapter_index = -1;
    }
    function showNologin() {
        j.growl.warning({title: "消息", message: "您还未登录请您先登录"});
    }

</script>
</body>

</html>