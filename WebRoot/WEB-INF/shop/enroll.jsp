<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>

  
<%@ include file="/public/head.jspf" %>
   
  </head>
  
 <div>提供商家信息</div> 
  
  
  
<form method="post" action="${foritou}/shop_enroll.action">
					<div>
						<label for="name">您的姓名:&nbsp;</label> 
						<input type="text" name="name" />
					</div>
					<div>
						<label for="phone">手&nbsp;&nbsp;机:</label> 
						<input type="text" name="phone" />
					</div>
					<div>
						<label for="email">邮&nbsp;&nbsp;箱:</label> 
						<input type="text" name="email" />
					</div>
						<div>
						<label for="other">其他联系方式:</label> 
						<input type="text" name="other" />
					</div>
				
						<div>
						<label for="other">商家类型:</label> 
						<input type="text" name="other" />
					</div>
				    <div>
						<label for="zhizhao">是否有营业执照:</label> 
	                    <input type="radio" name="zhizhao"  value=1 />是  &nbsp;&nbsp;
	                    <input type="radio" name="zhizhao" value=0/>否 
					</div>
					    <div>
						<label for="city">城市:</label> 
						<input type="text" name="city" />
						<label for="area">区域:</label> 
						<input type="text" name="area" />
						<label for="shangquan">商圈:</label> 
						<input type="text" name="shangquan" />
					</div>
						
						<div>
						<label for="other">商家类型:</label> 
						<input type="text" name="other" />
					</div>
						<div>
						<label for="name">商家名称:</label> 
						<input type="text" name="name" />
					</div>
				     <div>
						<label for="describle">商家描述:</label> 
						<input type="text" name="describle" />
					</div>
					<div>
						<label for="address">详细地址:</label> 
						<input type="text" name="address" />
					</div>
					<div>
						<label for="addressmap">在地图上标注:</label> 
				
					</div>
							<div>
						<label for="telephone">门店电话:</label> 
						<input type="text" name="telephone" />
					</div>
				
					<div>
						<input type="submit" value="提交" style="width:60px;height:30px" />
					
					</div>
			   </form>
  </body>
</html>
