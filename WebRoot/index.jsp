<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
<%@ include file="/public/head.jspf" %>
   
  </head>
  
  <body>
  <a href="${foritou}/send_shop_login.action">商家登录</a>
  
  
		<form method="post" action="${foritou}/company_login.action">
					<div>
						<label for="phone">账号:&nbsp;</label> 
						<input type="text" name="phone" />
					</div>
						<div>
						<label for="address">地址:&nbsp;</label> 
						<input type="text" name="address" />
					</div>
					<div>
						<label for="password">密码:&nbsp</label> 
						<input type="text" name="password" />
					</div>
					<div>
						${sessionScope.error}  
					</div>
					<div>
						<input type="submit" value="登陆" style="width:60px;height:30px" />
						<input type="button" value="注册" onclick="window.open('${foritou}/index.jsp','_self')" style="width:60px;height:30px" />
					</div>
			   </form>
  </body>
</html>
