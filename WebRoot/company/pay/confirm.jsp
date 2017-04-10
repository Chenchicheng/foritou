<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
	  <%@include file="/public/head.jspf" %>	
<%-- 	  <% response.setHeader("cache-control", "no-store"); %> --%>
 <link href="${foritou}/company/pay/shophead.css" rel="stylesheet" type="text/css">  
 	  <link href="${foritou}/company/pay/public.css" rel="stylesheet" type="text/css">
 <link href="${foritou}/company/pay/style.css" rel="stylesheet" type="text/css"> 
  <link href="${foritou}/company/css/bottom.css" rel="stylesheet" type="text/css"> 
  <script type="text/javascript">
 $(function(){

        var longitude=0;
        var latitude=0;
        if (navigator.geolocation){
            navigator.geolocation.getCurrentPosition(showPosition);
        }else{
            x.innerHTML="Geolocation is not supported by this browser.";
        }
    
    function showPosition(position){
    
       latitude=position.coords.latitude;

       longitude=position.coords.longitude;

    }
    $("#nearby").click(function() {
    
    window.location.href="${foritou}/shop_getNearbyShop.action?latitude="+latitude+"&longitude="+longitude+"&start=0&pageSize=20";
    });
    

   
   });

 </script>
  </head>

  <body>
    <c:if test="${empty sessionScope.forder.sorderSet}">
    <!-- 如果购物车中购物项为空，则跳转到首页 -->
    <c:redirect url="/index.jsp"></c:redirect>
    </c:if>
  	 <div id="header">
	 <div class="top">
	 <a  href="${foritou }/company/index.jsp" style="text-decoration: none;">  <span class="glyphicon glyphicon glyphicon-home redColor"></span>
            福利淘首页
	 </a>
	 <span>欢迎来到福利淘</span>
            <c:choose>  
    <c:when test="${not empty sessionScope.company}">  
      <a href="${foritou }/company/pay/companysetting.jsp" style="text-decoration: none;">欢迎！${company.companyname }</a>  
      <!--如果 --> 
    </c:when>  
      
    <c:otherwise>  <!--否则 -->  
      <c:if test="${empty sessionScope.comapny}">
      	 <span>欢迎来到福利淘</span>
    <a href="${foritou }/company/login.jsp" style="text-decoration: none;">请登录</a>
       <a href="${foritou }/company/enroll1.jsp" style="text-decoration: none;">注册</a>  
     
       
       </c:if>
    </c:otherwise>  
 </c:choose>
     
        <ul class="pull-right">
           <li><a href="${foritou }/company/pay/myOrder.jsp">我的订单</a></li>
           <li><a href="" onclick="return false;">我的福利淘</a>
               <ul>
            <li><a href="${foritou }/company/pay/myOrder.jsp">我的订单</a></li>   
                   <li><a href="${foritou }/company/pay/mycollection.jsp">我的收藏</a></li> 
                    <li><a href="${foritou }/company/pay/mycollection.jsp">员工评价</a></li> 
                   <li><a href="${foritou }/company/pay/extramoney.jsp">我的余额</a></li>  
                   <li><a href="${foritou }/company/pay/companysetting.jsp">账户设置</a></li>           
               </ul>
           </li>
           <li> <a href="${foritou }/company/showCar.jsp">我的购物车</a>
          
           </li>
           <li><a href="#" onclick="return false;">联系客服</a>
               <ul>
                   <li><a href="${foritou }/company/kefu/index.jsp">申请退款</a></li>   
                   <li><a href="${foritou }/company/kefu/index.jsp">申请退换货</a></li> 
                   <li><a href="${foritou }/company/kefu/index.jsp">常见问题</a></li> 
                             
               </ul>
           </li>
           <li><a href="#"> 我是商家 </a> 
	           <ul>
	                <li><a href="${foritou }/shop/enroll.jsp">我想合作</a></li>
	               <li><a href="${foritou }/shop_login.action">登录营销平台</a></li>
	           </ul>
           </li>
		</ul>		
	</div>	
	</div>
	<div id="sum">
   
   	<div id="site-logo">
   		<a  href="${foritou }/company/index.jsp" style="text-decoration: none;"><img src="${foritou }/company/img/logo.png" style="width: 82px; height:110px;"></a>
   	</div>
  
  	<div>
   				<p class="site-commitment">
   					<a class="commitment-item" href="${foritou }/company/suishitui/index.jsp">
   						<span><img src="${foritou }/company/img/overdue.png" style="width:36px;height:30px;"></span>
   					</a>
   					<a class="commitment-item" href="${foritou }/company/suishitui/index.jsp">
   						<span><img src="${foritou }/company/img/discontent.png" style="width:36px;height:30px;"></span>
   					</a>
   					<a class="commitment-item" href="${foritou }/company/suishitui/index.jsp">
   						<span><img src="${foritou }/company/img/back.png" style="width:36px;height:30px;"></span>
   					</a>
   				</p>
   				<p class="site-commitment2"  >
   					<a class="commitment-item2" href="${foritou }/company/suishitui/index.jsp">
   						过期退
   					</a>
   					<a class="commitment-item2" href="${foritou }/company/suishitui/index.jsp">
   					   不满意免单
   					</a>
   					<a class="commitment-item2" href="${foritou }/company/suishitui/index.jsp">
   						随时退
   					</a>
   				</p>
   			</div>
   </div>
<!-- 头部结束 -->
        <div class="section_container">
            <!-- 购物车 -->
            <ul class="breadcrumb">
                <li>
                    <a href="" onclick="return false;">加入购物车</a>
                </li>
                <li class="active">
                    <a href="" onclick="return false;">确认订单信息</a>
                </li>
                <li >
                    <a href="" onclick="return false;">完成订单</a>
                </li>
            </ul>
            <!-- 确认订单信息 -->
            <div class="check-stup">
            	<!-- 商品确认 -->
                <div class="pro-check check ">
                    <h1>确认订单信息</h1>
	                <table class="data-table cart-table" cellpadding="0" cellspacing="0">
						<tr>
							<th class="align_center" width="10%">商品编号</th>
							<th class="align_left" width="35%" colspan="2">项目</th>
							<th class="align_center" width="10%">销售价格</th>
							<th class="align_center" width="20%">数量</th>
							<th class="align_center" width="15%">小计</th>
						</tr>
					<c:forEach items="${sessionScope.forder.sorderSet}" var="sorder">
						<tr lang="${sorder.shop.id}">
							<td class="align_center"><a href="#" class="edit">${sorder.shop.id}</a>
							</td>
							<td width="130"><img src="${foritou}/image/shop/${sorder.shopimage}" height="80" />
							</td>
							<td class="align_left"><a class="pr_name" href="#">${sorder.shopname}</a>
							</td>
							<td class="align_center vline">￥ ${sorder.personprice}</td>
							<td class="align_center vline">
								${sorder.personnumber}	
							</td>
							<td class="align_center vline">￥${sorder.personprice*sorder.personnumber}</td>
						</tr>
						</c:forEach>
					</table>
					
                    <div class="sum"> 
                        <div class="fr"><span>总计：</span><b>￥${forder.total}</b></div>
                    </div>
                   
                </div>
                <!-- 订购人确认 -->
                <form action="${foritou}/forder_save.action" method="post">
		                <div class="submit">
		                   	<input type="submit" class="sub-logo fr" style="margin: 0px;padding: 0px; border: 0px;" value="确认无误,购买" />
		                </div>
	              
                </form>
           </div>
       </div>
       <!-- 确认订单信息结束 -->
       <div id="bottom" style="margin-top:20px;">
   		<div class="site-outer">
        <div class="site-info">
            <div class="site-info__item">
                <h3 style="color: #666;">获取更新</h3>
                <ul style="margin-left:40px;">
                    <li><a rel="nofollow" href="#">邮件订阅</a></li>
                    <li><a href="#">iPhone/Android</a></li>
                    <li><a rel="nofollow" href="#" target="_blank">QQ空间</a></li>
                    <li><a rel="nofollow" href="#" target="_blank">福利淘新浪微博</a></li>
                    <li><a href="#" target="_blank">sitemap</a></li>
                    <li><a rel="#" target="_blank">RSS订阅</a></li>
                </ul>
            </div>
            <div class="site-info__item">
                <h3 style="color: #666;">商务合作</h3>
                <ul style="margin-left:40px;">
                    <li><a rel="nofollow" href="#">商家合作</a></li>
                    <li><a rel="nofollow" href="#" gaevent="footer/mmp">福利淘商家营销平台</a></li>
                    <li><a rel="nofollow" href="#">到店餐饮代理商招募</a></li>
                    <li><a rel="nofollow" href="#">市场合作</a></li>
                    <li><a rel="nofollow" href="#" target="_blank">福利淘联盟</a></li>
                    <li><a rel="nofollow" target="_blank" href="#">福利淘云</a></li>
                    <li><a rel="nofollow" target="_blank" href="#">廉正邮箱</a></li>
                    <li><a rel="nofollow" target="_blank" href="#">餐饮开放平台</a></li>
                </ul>
            </div>
            <div class="site-info__item">
                <h3 style="color: #666;">公司信息</h3>
                <ul style="margin-left:40px;">
                    <li><a rel="nofollow" href="#">关于福利淘</a></li>
                    <li><a rel="nofollow" href="#">福利淘承诺</a></li>
                    <li><a rel="nofollow" href="#">媒体报道</a></li>
                    <li><a rel="nofollow" href="#" gaevent="footer/job">加入我们</a></li>
                    <li><a rel="nofollow" href="#">法律声明</a></li>
                    <li><a rel="nofollow" href="#">用户协议</a></li>
                    <li><a rel="nofollow" href="#">福利淘点评餐饮安全管理办法</a></li>
                    <li><a href="#">营业执照</a></li>
                </ul>
            </div>
            <div class="site-info__item">
                <h3 style="color: #666;">用户帮助</h3>
                <ul style="margin-left:40px;">
                    <li><a rel="nofollow" class="J-selfservice-tab" data-tab="0" href="#">申请退款</a></li>
                    <li><a rel="nofollow" class="J-selfservice-tab" data-tab="2" href="#">查看福利淘券密码</a></li>
                    <li><a rel="nofollow" href="#">常见问题</a></li>
                    <li><a rel="nofollow" href="#">开放API</a></li>
                    <li><a rel="nofollow" href="#">反诈骗公告</a></li>
                </ul>
            </div>
            <div class="site-info__item site-info__item--service">
		<div class="site-info-service-content">
                    <i class="hotline"></i>
                    <p class="contact-name" style="color: #666;font-size:1.17em;    font-weight: bold;">客服电话</p>
                    <p class="contact-info" >
		        <span class="contact-numbers" style="color: #999;">10107888</span>
		        <span class="contact-time" style="color: #999;">(9:00-23:00)</span>
		    </p>
                    <p class="desc" style="color: #999;">退款、退换货、查看福利淘券</p>
                    <p><a href="#" class="selfservice-link" gaevent="footer/selfservice">参考教程，轻松搞定!</a></p>
	        </div>
            </div>
	    <div class="clear"></div> 
	</div>
    </div>
   </div>
    
  </body>
  
</html>
