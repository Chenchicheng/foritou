<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
<%@ include file="/public/head.jspf" %>
 <style>
body{
	margin:0px;
	background:#e7e7e7;
	font-family: "Open Sans", Arial, "Hiragino Sans GB", "Microsoft YaHei", 微软雅黑, STHeiti, "WenQuanYi Micro Hei", SimSun, sans-serif;
	font-size:14px;
}
.navbar{
	height:60px;
	background:#f8f8f8;
	width:100%;
	border-color:#e7e7e7;
}
.navbar-default{
	margin-left:150px;
    width:1180px;
}
.navbar-head {
    padding-left: 10px;
    margin-left: 10px;
    border-left: 1px solid #ccc; 
    color: #777;
    display: block;
    overflow: hidden;
	font-size:18px;
	line-height:30px;
	height：30px;
	margin-top:-50px;
	margin-left:90px;
}
.r_box{
	width:1080px;
	height:450px;
	background-color:#fff;
	margin:auto;
	border: 1px solid #dedede;
	margin-left:150px;
	margin-top:20px;
}
.image{
	padding:30px;
	text-align:center;
}
.r_box .success{
	margin-top:20px;
    font-weight:500;
	font-size:24px;
}
.r_box  a{
	text-align:center;
	width:100px;
	height:40px;
	background:#ff6537;
	border:1px solid #ff6537;
	color:#fff;
	font-size:16px;
	font-weight:600;
	 border-radius: 4px;
	 display: block;
	 line-height: 2.5;
	 text-decoration: none;
}
</style>

  </head>
  
  <body>
<div class="navbar">
    <div class="navbar-default">
        <a><img src="${foritou }/company/img/logo.png" width:"80px"; height="80px"style="margin-top:-15px;" />
       
        </a>
         <span class="navbar-head">福利淘企业注册</span>
    </div>
</div>
<div>
     <div class="r_box">
         <div class="image"><img src="${foritou }/company/img/3.png" width="852" height="54"/></div>
         
         <div class="success" align="center">
         <img src="${foritou }/company/img/gou.png" width="72" height="72" />
         <p >恭喜你，企业注册成功！</p>
         <p >贵公司的内部邀请码为：${sessionScope.interpassword }！</p>
         <a href="${foritou }/company/login.jsp">去登录</a>
         </div>
         </div>
         </div>
  </body>
</html>
