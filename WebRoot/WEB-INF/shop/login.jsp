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
   <style>
   body{
   background-image: url(images/bg.png);
    background-size:1370px 800px;
    	font-family: "Open Sans", Arial, "Hiragino Sans GB", "Microsoft YaHei", 微软雅黑, STHeiti, "WenQuanYi Micro Hei", SimSun, sans-serif;
    
   }
   .login-panel{
   position: absolute;
    z-index: 2;
    top: 50%;
    left: 50%;
    width: 300px;
    height: 370px;
    padding: 20px 40px 50px;
    margin: -290px 0 0 -190px;
    background: rgba(0,0,0,0.1);
   }
   .login-top span{
   
   }
   .login-top span a{
   border-left: 1px solid #fff;
   color:#fff;
   font-size:26px;
  display:block;
  margin-top:-50px;
  margin-left:90px;
  padding-left:10px;
   }
   .acc {
    padding-left: 10px;
    background-position: -5px -1px;
     
   }
   .acc input{
   width: 260px;
    padding: 10px 10px 10px 60px;
    border: 0;
    background:#fff  url(images/login_user.png) no-repeat;
    border-radius:4px;
   }
   .acc2 {
   padding-top:20px;
    padding-left: 10px;
    background-position: -5px -1px;
   }
   .acc2 input{
   width: 260px;
    padding: 10px 10px 10px 60px;
    border: 0;
    background:#fff  url(images/login_pas.png) no-repeat;
    border-radius:4px;
   }
   .acc3 {
   padding-top:20px;
    padding-left: 10px;
    background-position: -5px -1px;
   }
   .acc3 input{
   width: 100px;
    padding: 10px 10px 10px 10px;
    border: 0;
   border-radius:4px;
   }
   .code{
   background:#fff  url(images/login_pas.png) no-repeat;
   }
   .acc4 input{
   width: 260px;
    padding: 10px 10px 10px 10px;
    border: 0;
    background:#ff6537;
    margin-left:10px;
    margin-top:20px;
    color:#fff;
    font-size:16px;
    border-radius:4px;
    cursor: pointer;
    
   }
   .acc4 input:hover{
    background:#ff6537;
   }
   #drag .drag_text{
   width:260px;
   }
   #drag{
    background-color: #fff;
    width: 260px;
    margin-left: 10;
    margin-top: 20px;
    border-radius: 4px;
    font-size: 13px;
    color:#555;
   }
   #drag .drag_bg {
    background-color: #60bfea;
    }
    #message {
    margin-left: 10px;
   visibility: visible;
   height:20px;
    color: red;
    display: block;
    text-align: center;
    }
   </style>
    <script type="text/javascript">
  $(function(){
$("#login_button").click(function() {
if($("#username").val()==""){
$("#message").html("用户名不能为空！");
}else if($("#password").val()==""){
$("#message").html("密码不能为空！");
}
else if(isMove!=true){
$("#message").html("请拖动滑块验证！");
}else{

$("#login_form").submit();

}
  });
  
  
  });
  
  
  
  
  </script>
  </head>
  <body>
    <%
String username= "";
String password = "";
String checked ="";
Cookie [] cookies = request.getCookies();
for(int i=0;cookies!=null&&i<cookies.length;i++){
	Cookie cookie = cookies[i];
	if(cookie.getName()!=null){
	if(cookie!=null&&"username".equals(cookie.getName())){
		username =URLDecoder.decode(cookie.getValue(),"UTF-8");
		checked = "checked";
	}
	if(cookie!=null&&"password2".equals(cookie.getName())){
		password = cookie.getValue();
	}
	}
}
%>
  <div class="login-panel">
  <p class="login-top">
     <img src="images/logo.png" width="80px" height="80px">
     <span><a>福利淘</a></span>
     <a style="color:#fff;margin-left:100px;">商家后台登录</a>
  </p>
  <form method="post" id="login_form" action="${foritou}/shop_login.action">
					<%-- <div class="number">
						<label for="phone">账号:&nbsp;</label> 
						<input type="text" name="phone" />
					</div>
					<div class="pwd"> 
						<label for="password">密码:&nbsp</label> 
						<input type="text" name="password" />
					</div>
					<div>
						${sessionScope.error}  
					</div>
					<div>
						<input type="submit" value="登陆" style="width:60px;height:30px" />
						<input type="button" value="注册" onclick="window.open('${foritou}/index.jsp','_self')" style="width:60px;height:30px" />
					</div> --%>
					<div>
					<span id="message">
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
					</div>
					<div class="acc">
					<input  type="text" name="phone" id="username" placeholder="手机号码" value="<%=username %>" autocomplete="off">
					</div>
					<div class="acc2">
					<input  type="password" name="password" id="password" placeholder="密码" value="<%=password%>"autocomplete="off">
					</div>
					<div class="acc3 drag_style" style="padding:0px;" id="drag">
					
					</div>
					   <script type="text/javascript">
		           $('#drag').drag();
		               </script>
					<div class="acc4">
					<input type="submit" id="login_button"  value="登录"  >
					</div>
					
					<div style="margin-top:10px;">
					<a style="text-decoration: none;color:#fff;font-size:12px;margin-left:10px;"><input style:none; type="checkbox" name="remberme" id="remberme" value="yes" <%=checked %>/>记住密码</a>
					<a style="text-decoration: none;display:inline-block;;margin-left:10px;color:#fff;font-size:12px;" href="#">忘记密码</a>
					</div>
					
			   </form>
			   </div>
  </body>
</html>
