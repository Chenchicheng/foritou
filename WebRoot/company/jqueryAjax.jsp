<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
<%@ include file="/public/head.jspf" %>
 <script>
 
$(function(){
 
	$("#getCheckCode").click(function(){
	var phone = $("#phone").val();
	  $.post("company_getCheckCode.action",//发送请求
   {phone:$("#phone").val(),
   },function(data){//请求成功
  alert(data);
     },"json");	

	return false;
});
});	
		
	
</script>
  </head>
  
  <body>
 		<form id="register" method="post" action="www.baidu.com">
	<span class="tips">请输入你的用户名：</span>
	<input type="text" name="phone" class="phone" />
  <button id="getcheckCode">获取验证码</button>
		<span class="result"></span><br />
	<input type="submit" id="submit" />
</form>
  </body>
</html>
