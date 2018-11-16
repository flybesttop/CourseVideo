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

    <title>搜索页面</title>

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

            <!-- Content -->
            <section id="content">


                <div class="container">
                    <div id="nav-tree-c" class="breadcrumbs nav-tree-c">
                        <p><a href="#">主页.</a> \\ <a href="#">搜索.</a></p>
                    </div>
                    <!-- Main Content -->
                    <div class="content">

                        <!-- Single -->
                        <div class="relatednews search-cloumn-4">
                            <h5 class="line"><span>关于“${message}”的搜索结果.</span></h5>
                            <ul>
                                <c:forEach items="${courses}" var="course">
                                    <li>
                                        <a href="learing?courseId=${course.acCourseId}"}><img src="${contextpath}/static/${course.acCourseImg}"
                                                         alt="MyPassion"/></a>
                                        <p>
                                            <a href="learing?courseId="${course.acCourseId}>《${course.acCourseName}》</a>
                                            <span>授课教师：${course.teacherName}</span>
                                            <span>价格：￥${course.acCourseMoney}</span>
                                        </p>
                                        <c:choose>
                                            <c:when test="${course.acCourseMoney==0}">
                                                <span class="playData"><i class="icon-play"></i>浏览量：<span>${course.acCoursePicknum}</span></span>
                                            </c:when>
                                            <c:otherwise>
                                                <span class="playData"><i class="icon-play"></i>选购量：<span>${course.acCoursePicknum}</span></span>
                                            </c:otherwise>
                                        </c:choose>

                                    </li>
                                </c:forEach>
                            </ul>
                        </div>
                        <ul id="pageBox"></ul>
                        <form action="search" method="get">
                            <c:if test="${message!=null}">
                                <input type="hidden" name="message" value="${message}">
                            </c:if>
                            <input type="hidden" name="pageNum" value="${page}"/>
                        </form>
                        <div id="totalNum" style="display: none" total="${total}"></div>
                    </div>
                    <!-- /Single -->
                </div>
                <!-- /Main Content -->

            </section>
            <!-- / Content -->

            <!-- Footer -->
            <footer id="footer" style="margin-top: 20px">
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

<!--[if lt IE 9]>
<script type="text/javascript" src="${contextpath}/static/js/html5.js"></script> <![endif]-->
<script type="text/javascript" src="${contextpath}/static/js/mypassion.js"></script>
<script type="text/javascript" src="${contextpath}/static/js/select-box.js"></script>
<script type="text/javascript" src="${contextpath}/static/js/jquery.growl.js"></script>
<script type="text/javascript" src="${contextpath}/static/js/paging.js"></script>

<script>
    //        var jq=jQuery.noConflict();
    var options = {
        list: ".list",//列表标识
        currentPage: $("input[name=pageNum]").val(),//初始页（选传，默认1）
        pageSize: 5,//每页列表数
        listTotal: $("#totalNum").attr("total")//列表总数（选传），不传为list总数
    };
    $("#pageBox").paging(options);
    function showNologin() {
        $.growl.warning({title: "消息", message: "您还未登录请您先登录"});
    }
</script>
</body>
</html>
