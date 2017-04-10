<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
<%@ include file="/public/head.jspf" %>
 
  </head>
  
  <body>
  第三部
		<form method="post" id="enroll2Form" action="${foritou}/company_enroll2.action">
					<div>
						<label for="companyname">公司名称:&nbsp;</label> 
						<input type="text" name="companyname" id=""/>
					</div>
					<div>
						<label for="address">公司所在地:&nbsp;</label> 
						<input type="text" name="address" id=""/>
					</div>
				    <div>
						<label for="type">公司类型:&nbsp;</label> 
						<input type="text" name="type" id=""/>
					</div>
					<div>
						<label for="password">密码:&nbsp;</label> 
						<input type="text" name="password" id=""/>
					</div>
					
					<div>
						<label for="contactname">联系人姓名:&nbsp;</label> 
						<input type="text" name="contactname" id=""/>
					</div>
					
						<div>
						<label for="email">邮箱:&nbsp;</label> 
						<input type="text" name="email" id=""/>
					</div>
					
						<div>
						<label for="invitecode">邀请码:&nbsp;</label> 
						<input type="text" name="invitecode" id=""/>
					</div>
					<div>
						${sessionScope.error}  
					</div>
					<div>
						<input type="submit" value="下一步" style="width:60px;height:30px" />	
					</div>
			   </form>
  </body>
</html>
