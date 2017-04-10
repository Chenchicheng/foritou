<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
<%@ include file="/public/head.jspf" %>
<link href="${foritou}/company/css/detail.css" rel="stylesheet" type="text/css"/>
<link href="${foritou}/company/css/shophead.css" rel="stylesheet" type="text/css"/>
<link href="${foritou}/company/css/bottom.css" rel="stylesheet" type="text/css"/>
   <script type="text/javascript">
 
   </script>
   
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
	
    .deal-title_title a{
    margin-top: 12px;
    padding: 0 15px 5px;
    height: 24px;
    line-height: 24px;
	 text-decoration:none;
    }
    .shortitle{
   font-size: 14px;
    line-height: 18px;
    color: #999;
   
    }
	.xtitle{
		
		color:#666;
	}
    .deal-title-detail{
    margin-bottom: 10px;
   margin-top: 10px;
    height: 24px;
    padding: 0 16px 2px;
    }
    .value{
    	font-size: 12px;
    	font-family: arial,sans-serif;
    }
    .sales{
    	font-family: arial,sans-serif;
    	float: right;
    margin-top: 8px;
    font-size: 12px;
    font-weight: 400;
    color: #999;
    }
    .num{
    	font-size: 12px;
    	font-family: arial,sans-serif;
    }
    .deal-title_cover{
    	padding: 12px 15px 0;
    	display: block;
    position: relative;
    }
    .deal-title-extra{
    	border-top: none;
    padding: 0 15px;
    }
    .extra-inner{
    border-top: 1px dotted #ddd;
    padding: 0;
    height: 45px;
    background: #fff;
    }
    .campaign{
    float: left;
    margin: 10px 5px 0 0;
    padding: 0 4px;
    height: 16px;
    line-height: 16px;
    font-size: 12px;
    color: #fff;
    background-color: #ff8e3f;
    }
    .rate-info{
    float: right;
    height: 33px;
    line-height: 33px;
    cursor: pointer;
    text-decoration: none;
    color: #666;
    font-size: 12px;
    margin-top: 10px;
    }
    .filter-strip-list li a:hover{
   
    
    color: #ff6537;
    
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
   </script> 
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
           <li><a href="#" id="myforitou" onclick="return false;" >我的福利淘</a>
               <ul>
                   <li><a href="${foritou }/company/pay/myOrder.jsp">我的订单</a></li>   
                   <li><a href="${foritou }/company/pay/mycollection.jsp">我的收藏</a></li> 
                    <li><a href="${foritou }/company/pay/employeecomment.jsp">员工评价</a></li> 
                   <li><a href="${foritou }/company/pay/extramoney.jsp">我的余额</a></li>  
                   <li><a href="${foritou }/company/pay/companysetting.jsp">账户设置</a></li>       
               </ul>
           </li>
           <li> <a href="${foritou }/company/pay/myOrder.jsp">我的购物车</a>
                
           </li>
            <li><a href="#" onclick="return false;">联系客服</a>
               <ul>
                   <li><a href="${foritou }/company/kefu/index.jsp">申请退款</a></li>   
                   <li><a href="${foritou }/company/kefu/index.jsp">申请退换货</a></li> 
                   <li><a href="${foritou }/company/kefu/index.jsp">常见问题</a></li> 
                             
               </ul>
           </li>
           <li><a href="#" onclick="return false;"> 我是商家 </a> 
	           <ul>
	               <li><a href="${foritou }/shop/enroll.jsp">我想合作</a></li>
	               <li><a href="${foritou }/shop_login.action">登录营销平台</a></li>
	           </ul>
           </li>
		</ul>			
	</div>	
	</div> 
  <div id="sum1">
   <div id="header1">
   <div id="header-top">
   	<div id="site-logo">
   		<a  href="${foritou }/company/index.jsp" style="text-decoration: none;"><img src="img/logo.png" style="width: 82px; height:110px;"></a>
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
   				<input class="search-box-right" value="搜索" type="submit">
   			</div>
   		</form>
   	</div>
   	<div>
   				<p class="site-commitment">
   					<a class="commitment-item">
   						<span><img src="img/overdue.png" style="width:36px;height:30px;"></span>
   					</a>
   					<a class="commitment-item">
   						<span><img src="img/discontent.png" style="width:36px;height:30px;"></span>
   					</a>
   					<a class="commitment-item">
   						<span><img src="img/tui.png" style="width:36px;height:30px;"></span>
   					</a>
   				</p>
   				<p class="site-commitment" style="margin-top: -20px; ">
   					<a class="commitment-item2">
   						过期退
   					</a>
   					<a class="commitment-item2">
   					   不满意免单
   					</a>
   					<a class="commitment-item2">
   						随时退
   					</a>
   				</p>
   			</div>
   </div>
   <div id="header-bottom">
   <div class="types">
   
   <span class="alltypes" style="width: 220px;display:inline-block;">全部分类</span> 
   <span class="down" style="margin-left:0px;"><img src="img/down.png" style="width: 30px;height: 15px;"></span>
       <ul >
	     <li><a href="${foritou }/shoptype_getShop.action?id=1">美食</a></li>
	      <li><a href="${foritou }/shoptype_getShop.action?id=2">酒店/客栈</a></li>
	       <li><a href="${foritou }/shoptype_getShop.action?id=3">电影</a></li>
	        <li><a href="${foritou }/shoptype_getShop.action?id=5">运动健身</a></li>
	         <li><a href="${foritou }/shoptype_getShop.action?id=4">休闲娱乐</a></li>
	          <li><a href="${foritou }/shoptype_getShop.action?id=6">周边游</a></li>
	           <li style="border:none;"><a href="${foritou }/shoptype_getShop.action?id=7">生活服务</a></li>   
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
   				<span class="navbar-item"><a id="nearby" >附近商家</a></span>
   			</li>
   		</ul>
   	</div>
   </div>
   </div>
   <div id="middle" >
  
   	<div id="middle-top" >
   		<a class="bread-nav" href="#">
   			全部
   		</a>
   		<span style="font-size: 12px; ">〉</span>
   		<a class="bread-nav" href="#">
   			美食
   		</a>		
   	</div>
    <div >
   <ul class="filter-strip-list">
   <a style="margin-left:-60px;margin-right:20px;">分类:</a>
                    <li><a href="#" style="background:#ff6537;color:#fff; display:inline-block; height:20px; width:40px; text-align:center;border-radius:4px;">全部</a></li>
	   	  	 		<li><a href="${foritou }/shoptype_getShop.action?id=1">美食</a></li>
	   	  	 		<li><a href="${foritou }/shoptype_getShop.action?id=2">酒店/客栈</a></li>
	   	  	 		<li><a href="${foritou }/shoptype_getShop.action?id=3">电影</a></li>
	   	  	 		<li><a href="${foritou }/shoptype_getShop.action?id=5">运动健身</a></li>
	   	  	 		<li><a href="${foritou }/shoptype_getShop.action?id=4">休闲娱乐</a></li>
	   	  	 		<li><a href="${foritou }/shoptype_getShop.action?id=6">周边游</a></li>
	   	  	 		<li><a href="${foritou }/shoptype_getShop.action?id=7">生活服务</a></li>
                   
	   	  	 	</ul>
   </div>
   <div >
   <ul class="filter-strip-list">
   <a style="margin-left:-60px;margin-right:20px;">区域:</a>
                    <li><a href="#" style="background:#ff6537;color:#fff; display:inline-block; height:20px; width:40px; text-align:center;border-radius:4px;">全部</a></li>
	   	  	 		<li><a href="${foritou}/shop_getShopByArea.action?start=0&pageSize=20&area=西湖区">西湖区</a></li>
	   	  	 		<li><a href="${foritou}/shop_getShopByArea.action?start=0&pageSize=20&area=东湖区">东湖区</a></li>
	   	  	 		<li><a href="${foritou}/shop_getShopByArea.action?start=0&pageSize=20&area=青山湖区">青山湖区</a></li>
	   	  	 		<li><a href="${foritou}/shop_getShopByArea.action?start=0&pageSize=20&area=湾里区">湾里区</a></li>
	   	  	 		<li><a href="${foritou}/shop_getShopByArea.action?start=0&pageSize=20&area=青云谱区">青云谱区</a></li>
	   	  	 		<li><a href="${foritou}/shop_getShopByArea.action?start=0&pageSize=20&area=南昌县">南昌县</a></li>
	   	  	 		<li><a href="${foritou}/shop_getShopByArea.action?start=0&pageSize=20&area=新建县">新建县</a></li>
	   	  	 	</ul>
   </div>
   </div>
    <div class="filter-sortbar">
       <div class="button-strip">
       <a href="#">默认</a>
        <a href="#">销量</a>
         <a href="#">价格</a>
          <a href="#">好评</a>
          <a href="#">发布时间</a>
       </div>
    </div>
  <div class="content">
      <div class="deal-list">
      
       <c:forEach items="${shopbytypeList}" var="product">
      
          <div class="deal-left deal-tile">
            <a class="deal-title_cover" href="${foritou }/shop_get.action?id=${product.shopid}" ><img src="${foritou }/image/shop/${product.pic}" width="345" height="214"></a>
    				<h3 class="deal-title_title">
    					<a href="${foritou }/shop_get.action?id=${product.shopid}">
    						<span class="xtitle">${product.shopname }</span>
    						<span class="shortitle">${product.miaoshu }</span>
    					</a>
    				</h3>
    				<p class="deal-title-detail">
    					<span style="font-size: 25px;color: #f76120;">${product.discount }折</span>
    					<span class="value" style="color:#666">售价 <span style="color: red;f">¥${product.price }</span></span>
    					<span class="sales">
                                            已售<strong class="num">${product.sold }</strong>
                        </span>
    				</p>
    				<div class="deal-title-extra">
    					<p class="extra-inner">
    						<span class="campaign">多优惠</span>
    						<a href="#" class="rate-info">
    							<span><img src="img/comment.png" width="59" height="12"></span>
    							<span>${product.comment }人评价</span>
    						</a>
    					</p>
    				</div>
          </div>
  

 </c:forEach>
          
          
          
          
          
        <!--   <div class="deal-right deal-tile">
          <a class="deal-title_cover" href="#"><img src="img/11.jpg" width="345" height="214"></a>
    				<h3 class="deal-title_title">
    					<a href="#">
    						<span class="xtitle">北京汉斯特自助烤肉</span>
    						<span class="shortitle">提供wifi</span>
    					</a>
    				</h3>
    				<p class="deal-title-detail">
    					<span style="font-size: 20px;color: #f76120;">¥79</span>
    					<span class="value">门店价 <del class="num"><span>¥</span>89</del></span>
    					<span class="sales">
                                            已售<strong class="num">14412</strong>
                        </span>
    				</p>
    				<div class="deal-title-extra">
    					<p class="extra-inner">
    						<span class="campaign">多优惠</span>
    						<a href="#" class="rate-info">
    							<span><img src="img/comment.png" width="59" height="12"></span>
    							<span>1499人评价</span>
    						</a>
    					</p>
    				</div>
          </div> -->
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
