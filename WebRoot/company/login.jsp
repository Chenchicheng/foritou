<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="java.net.URLDecoder"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
<%@ include file="/public/head.jspf" %>
<script type="text/javascript" src="${foritou }/js/jquery-1.7.2.js"></script>
<script type="text/javascript" src="${foritou }/js/jquery.validate.js"></script>
<script src="${foritou}/js/drag.js" type="text/javascript"></script>
<link href="${foritou}/css/drag.css" rel="stylesheet" type="text/css">
<link href="${foritou}/company/css/signin.css" rel="stylesheet" type="text/css">
<link href="${foritou}/company/css/bootstrap.min.css" rel="stylesheet" type="text/css">
  <script type="text/javascript">
  $(function(){
$("#login_button").click(function() {
if($("#phone").val()==""){
$("#message").html("手机号码不能为空！");
}else if(isMove!=true){
$("#message").html("请拖动滑块验证！");
}else{

$("#login_form").submit();

}
/* 
 $.post("", 
    { 
        name:"菜鸟教程", 
        url:"http://www.runoob.com" 
    }, 
        function(data,status){ 
        alert("数据: \n" + data + "\n状态: " + status); 
    }); */ 


  });
  
  
  });
  
  
  
  
  </script>
  <style>
   body{
	margin:0px;
	background:#e7e7e7;
	font-family: "Open Sans", Arial, "Hiragino Sans GB", "Microsoft YaHei", 微软雅黑, STHeiti, "WenQuanYi Micro Hei", SimSun, sans-serif;
	font-size:14px;
}
   #drag .drag_text {
    position: absolute;
    top: 0px;
    width: 330px;
    } 
     #drag{
     width:330px;
     }
     .navbar{
	height:70px;
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
.reg{
    float: right;
    margin-top: -27px;
    margin-right: 100px;
    display: block;
    width: 120px;
    height: 33px;
    border-radius: 4px;
    border: 1px solid #ff6537;
    background: #FF6537;
    color: #fff;
    text-align: center;
    line-height: 2;
}
  </style>
 
  </head>
  
  <body>	
  <%
String phone= "";
String password = "";
String checked ="";
Cookie [] cookies = request.getCookies();
for(int i=0;cookies!=null&&i<cookies.length;i++){
	Cookie cookie = cookies[i];
	if(cookie!=null&&"phone".equals(cookie.getName())){
		phone =URLDecoder.decode(cookie.getValue(),"UTF-8");
		checked = "checked";
	}
	if(cookie!=null&&"password".equals(cookie.getName())){
		password = cookie.getValue();
	}
}
%>
   <div class="navbar">
    <div class="navbar-default">
        <a><img src="${foritou }/company/img/logo.png" width="80px" height="80px"style="margin-top:-15px;" />
       
        </a>
         <span class="navbar-head">福利淘</span>
         <span><a  class="reg"  href="${foritou }/company/enroll1.jsp"> 企业注册</a></span>
    </div>
</div>		   

<div class="middle" style="margin-top:-20px;">
<div class="signin">
	<div class="signin-head">福利淘账号登录</div>
	<form class="form-signin"  method="post" id="login_form" action="${foritou}/company_login.action">
		<div>
	
        <span id="message" class="message">
      
            <c:choose>  
    <c:when test="${not empty requestScope.loginError}">  
             ${requestScope.loginError }
      <!--如果 --> 
    </c:when>  
      
    <c:otherwise>  <!--否则 -->  
      <c:if test="${not empty sessionScope.nopower}">
       ${sessionScope.nopower }
       
       </c:if>
    </c:otherwise>  
 </c:choose>
      </span>
	
		<input type="text" id="phone" class="form-control" placeholder="手机号码" name="phone" value="<%=phone%>"/>
		<input type="password" id="password" class="form-control" placeholder="密码" name="password" value="<%=password %>" />
		<div  class="box"><div id="drag"></div></div>

		</div>
		<div class="signin-bottom" style="margin-left:-40px;">
			<p>
			<a style="color:gray;margin-left:-100px;margin-right:100px;text-decoration: none;"><input type="checkbox" name="remberme" id="remberme" value="yes" <%=checked%>/>记住我</a>
			<a href="#">忘记密码？</a>
			<a href="${foritou }/company/enroll1.jsp">立即注册</a>
			</p>
		</div>
	</form>
	<button id="login_button" style="width: 85%;margin-left:32px;" class="btn btn-lg btn-warning btn-block" >登录</button>
</div>
</div>
<div class="bottom">
	<p align="center"><a>关于我们</a><a>|</a><a>使用帮助</a></p>
</div>
<div style="text-align:center;">

</div>
	<script type="text/javascript">
$('#drag').drag();
</script>   		   
  </body>
</html>
