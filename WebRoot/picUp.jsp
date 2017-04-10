<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
<%@ include file="/public/head.jspf" %>
   
  </head>
  
  <body>
<form id="ff" action="shop_.action" method="post" enctype="multipart/form-data">
	
	
	<div>
		<label>图片上传:</label> <input type="file" name="fileImage.upload" />
	</div>
<div>
		<a id="submit" href="#" class="easyui-linkbutton">添 加</a> 
		<a id="reset" href="#" class="easyui-linkbutton">重 置</a>
	</div>
</form> 
  </body>
</html>
