<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%-- <%@ taglib uri="/struts-tags" prefix="s" %> --%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
  
<%@ include file="/public/head.jspf" %>
<link href="${foritou }/company/css/detail.css" rel="stylesheet" type="text/css"/>
<link href="${foritou }/company/css/shophead.css" rel="stylesheet" type="text/css"/>
<link href="${foritou }/company/css/bottom.css" rel="stylesheet" type="text/css"/>
<link href="${foritou }/company/css/personinfo.css" rel="stylesheet" type="text/css"/>
<script type="text/javascript" src="${foritou }/js/function.js"></script>
<style type="text/css">
.imageBorder{
  border:1px solid #ff6537;
}
.small-btn{
   background-image: url(img/collector.png);
   background-repeat: no-repeat; 
   background-size:25px 25px;
   display:inline_block;
   height:40px;
   width:50px;
   padding:10px;
}
.small-btn2{
   background-image: url(img/share.png);
   background-repeat: no-repeat; 
   background-size:25px 25px;
   display:inline_block;
   height:40px;
   width:70px;
   padding:10px;
   text-decoration: none;
   font-size: 12px;
   margin:0px;
}
.types ul{
width:240px;
margin-top:0px;
background:#f7f7f7;
border:1px solid #e5e5e5;
position: absolute;
display:none;
z-index:40;
}
.types ul li{
margin-left:-40px;
font-size:14px;
width:280px;
font-weight:700;

}
.types ul li a{
text-decoration: none;
color:#333;
display:block;
padding:20px 0px 20px 15px;
border-bottom:1px solid #e5e5e5;

}
.types ul li a:hover{
background:#fff;
}
.types:hover  ul{
	display:block;
	}
	
	

.content-right-top a{
	display:inline-block;
	width:60px;
	height:25px; 
	color:#ff6537; 
	text-align:center;
	line-height:2;
	text-decoration:none;
}
.content-right-top a:hover{
	text-decoration:underline;
}
.content-right-bottom p{
	font-size:16px;
	color:#000;
	padding:20px 0 0 50px;
}
.content-right-bottom p span{
	padding-right:50px;
	padding-left:30px;
}
.content-right-bottom p span a{
	font-size:14px;
	display:inline-block;
	color:#ff6537;
	text-decoration:none;
}
.content-right-bottom p span a:hover{
	text-decoration:underline;
}

	</style>
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
   
	function closeWindow(){
	  window.close();
	}
   </script> 
<%   
         String flag = "";
         flag =(String) request.getAttribute("Flag");
         if(flag!=null){  
          %>
              <script language=javascript>
              closeWindow();
             </script>
        <%
         }
   %> 
 </head>
 <body>
<div id="header">
	 <div class="top" >
	 <a href="${foritou }/company/index.jsp" style="text-decoration: none;">  <span class="glyphicon glyphicon glyphicon-home redColor"></span>
            福利淘首页
	 </a>
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
           <li ><a href="#" onclick="return false;">我的福利淘</a>
               <ul style="z-index:40;">
                   <li><a href="${foritou }/company/pay/myOrder.jsp">我的订单</a></li>   
                   <li><a href="${foritou }/company/pay/mycollection.jsp">我的收藏</a></li> 
                   <li><a href="${foritou }/company/pay/employeecomment.jsp">员工评价</a></li> 
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
           <li><a href="#" onclick="return false;">我是商家 </a> 
	           <ul>
	               <li><a href="${foritou }/shop/enroll.jsp">我想合作</a></li>
	               <li><a href="${foritou }/shop_login.action">商家营销平台</a></li>
	           </ul>
           </li>
		</ul>		
	</div>	
	</div> 
  <div id="sum1">
   <div id="header1">
   <div id="header-top">
   	<div id="site-logo">
   		<a  href="${foritou }/company/index.jsp" style="text-decoration: none;"><img src="${foritou }/company/img/logo.png" style="width: 82px; height:110px;"></a>
   	</div>
   	<div id="city-info">
   		<h2 style="margin: 0px;"><a class="city-info-name">南昌</a></h2>
   		<a class="city-info-toggle" onMouseOver="this.style.color='#2bb8aa'" onmouseout="this.style.color='#999'">切换城市</a>
   	</div>
   	<div id="search-box" style="z-index:1;" >
   	<form action="${foritou }/shop_getShopBySearch.action" method="post">
   			<div>
   				<input class="search-box-left" name="searchString" type="text" placeholder="请输入商家名称、商圈等"/>
   				<input  name="start" type="hidden" value="0"/>
                <input  name="pageSize" type="hidden" value="20"/>
   			</div>
   			<div >
   				<input class="search-box-right" value="搜索"type="submit">
   			</div>
   		</form>
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
   					<a class="commitment-item2" href="${foritou }/html/suishitui/index.html">
   						随时退
   					</a>
   				</p>
   			</div>
   </div>
  </div>
   <div id="header-bottom">
   <div class="types">
   
   <span class="alltypes" style="width: 220px;display:inline-block;">全部分类</span> 
   <span class="down" style="margin-left:0px;"><img src="${foritou }/company/img/down.png" style="width: 30px;height: 15px;"></span>
       <ul >
	     <li><a class="nav-level1-lable1" href="${foritou }/shoptype_getShop.action?id=1">美食</a></li>
	      <li>	<a class="nav-level1-lable1" href="${foritou }/shoptype_getShop.action?id=2">酒店/客栈</a></li>
	       <li>		<a class="nav-level1-lable1" href="${foritou }/shoptype_getShop.action?id=3">影院</a></li>
	        <li><a class="nav-level1-lable1" href="${foritou }/shoptype_getShop.action?id=4">休闲娱乐</a></li>
	         <li><a class="nav-level1-lable1" href="${foritou }/shoptype_getShop.action?id=5">运动健身</a></li>
	          <li>		<a class="nav-level1-lable1" href="${foritou }/shoptype_getShop.action?id=6">周边游/旅游</a></li>
	          
	          <li>	<a class="nav-level1-lable1" href="${foritou }/shoptype_getShop.action?id=7">生活服务</a></li>
	          <li>	<a class="nav-level1-lable1" href="${foritou }/shoptype_getShop.action?id=8">购物</a></li>
	          
	           <li style="border:none;">	<a class="nav-level1-lable1" href="${foritou }/shoptype_getShop.action?id=9">丽人</a></li>   
	   </ul>  
  
   	</div>
   	<div>
   		<ul class="site-navbar" >
   			<li class="navbar-item-w">
   				<span class="navbar-item"><a  href="${foritou }/company/index.jsp">首页</a></span>
   			</li>
   			<li class="navbar-item-w">
   				<span class="navbar-item"><a  href="related_getGroomShop.action">本月推荐</a></span>	
   				</li>
   			<li class="navbar-item-w">
   				<span class="navbar-item"><a  id="nearby">附近商家</a></span>
   			</li>
   		</ul>
   	</div>
   </div>
   </div>
   
   <div class="content" style="margin-left:185px;">
       <div class="content-left">
           <div class="item">
              <span>我的收藏</span>
              <ul>
                
                 <li><a href="${foritou}/company/pay/mycollection.jsp" >我的收藏</a></li>    
              </ul>
           </div>
           <div class="item">
              <span>员工评价</span>
              <ul>
                 <li><a href="${foritou}/company/pay/employeegrade.jsp">员工打分</a></li>
                 <li><a href="${foritou}/company/pay/employeecomment.jsp">员工评价</a></li>    
              </ul>
           </div>
           <div class="item" style="border:none;">
              <span>我的账户</span>
              <ul>
                 <li><a href="${foritou}/company/pay/extramoney.jsp" >我的余额</a></li>
                 <li><a href="${foritou}/company/pay/companysetting.jsp" style="background:#ff6537; color:#fff;font-size:14px;line-height:30px;">账户设置</a></li>    
              </ul>
           </div>         
        </div>
      
       <div class="content-right">
           <div class="content-right-top">
           <span><a href="${foritou}/company/pay/companysetting.jsp" style="background:#ff6537;color:#fff;border-radius: 4px;" >企业信息</a> </span>
          
           <span><a href="${foritou}/company/pay/employeeinfo.jsp" >员工信息</a> </span>      
           </div>
           <div class="content-right-bottom">
           
             <p>公司名称：<span>${sessionScope.company.companyname }</span></p>
            <p>联系电话：<span>${company.phone }</span></p>
            <p>内部邀请码：<span>${company.interpassword }</span></p>
            <p>所在城市：<span>${company.city }</span></p>
            <p>公司类型：<span>${company.companytype.name }</span></p>
            <p>邮箱：<span>${company.email }</span>
            <span><a href="#" onclick="openWindow('${foritou }/company_modify.action?id=${company.id }','700','400')">修改</a></span>
            </p>
           </div>
           
       </div>
       
   </div>
   
   
   <div id="bottom">
   		<div class="site-outer">
        <div class="site-info">
            <div class="site-info__item">
                <h3 style="color: #666;">获取更新</h3>
                <ul>
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
                <ul>
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
                <ul>
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
                <ul>
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
                    <p class="contact-info">
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
