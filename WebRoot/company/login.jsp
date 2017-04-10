<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
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
  
 
  </head>
  
  <body>			   
<div class="head">
	<p>
		<a>福利淘</a>
		<button  onmouseover="this.style.backgroundColor='#ff6537';"  onmouseout="this.style.backgroundColor='#F0AD4E';" > 企业注册</button>
	</p>
</div>
<div class="middle">
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
	
		<input type="text" id="phone" class="form-control" placeholder="手机号码" name="phone"/>
		<input type="password" id="password" class="form-control" placeholder="密码" name="password"/>
		<div  class="box"><div id="drag"></div></div>

		</div>
		<div class="signin-bottom">
			<p>
			<a href="#">忘记密码？</a>
			<a href="#">立即注册</a>
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
