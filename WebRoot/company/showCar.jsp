<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
<%@ include file="/public/head.jspf" %>

 
  </head>
  
  <body>			   
  		<c:forEach items="${sessionScope.forder.sorderSet}" var="sorder">
					<tr lang="${sorder.shop.id}">
						<td class="align_center"><a href="#" class="edit">${sorder.shop.id }</a>
						</td>
						<td width="80px"><img src="${shop}/image/${sorder.shopimage}" width="80" height="80" />
						</td>
						<td class="align_left"><a class="pr_name" href="#">${sorder.shopname}</a>
						</td>
						<td class="align_center vline">
						${sorder.personprice }
						</td>
						<td class="align_center vline">
						<!-- 文本框 -->
								<input class="text" style="height: 20px;" value="${sorder.personnumber }" lang="${sorder.personnumber }">		
						
						</td>
						<td class="align_center vline">
						${sorder.personprice*sorder.personnumber }
						</td>
						<td class="align_center vline"><a href="#" class="remove"></a>
						</td>
					</tr>
				</c:forEach>
  </body>
</html>
