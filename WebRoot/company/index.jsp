<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page language="java" import="cn.foritou.model.*" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
<%@ include file="/public/head.jspf" %>
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

<link href="${foritou}/company/css/index.css" rel="stylesheet" type="text/css">
 <link href="${foritou}/company/css/shophead.css" rel="stylesheet" type="text/css"> 
 <link href="${foritou}/company/css/lunbo.css" rel="stylesheet" type="text/css"> 
   <style type="text/css">
   .deal-title_cover{
   overflow: hidden;
   width:260px;
   }
   .deal-title_cover:hover img {
    transform: scale(1.3);
    transition: all 1s ease 0s;
	-webkit-transform: scale(1.3);
	-webkit-transform: all 1s ease 0s;
}
   
   </style>

  </head>
  
  <body>
  
    
   <div id="header">
	 <div class="top" style="width:1170px;margin-left:85px;">
	 <a  href="${foritou }/company/index.jsp" style="text-decoration: none;">  <span class="glyphicon glyphicon glyphicon-home redColor"></span>
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
           <li> <a href="${foritou }/company/showCar.jsp">我的购物车</a>
    
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
           <li><a href="${foritou }/company_logout.action"> 退出登录 </a> 
           </li>
		</ul>		
	</div>	
	</div> 
  <div id="sum1">
   <div id="header1">
   <div id="header-top">
   	<div id="site-logo">
   		<a  href="${foritou }/company/index.jsp"><img src="img/logo.png" style="width: 82px; height:110px;"></a>
   	</div>
   	<div id="city-info">
   		<h2 style="margin: 0px;"><a class="city-info-name">南昌</a></h2>
   		<a class="city-info-toggle" onMouseOver="this.style.color='#2bb8aa'" onmouseout="this.style.color='#999'" href="#">切换城市</a>
   	</div>
   	<div id="search-box">
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
   					<a class="commitment-item2" href="${foritou }/company/suishitui/index.jsp">
   						随时退
   					</a>
   				</p>
   			</div>
   </div>
   <div id="header-bottom">
   <div>
   	 <span class="alltypes">全部分类</span>
   	 <span class="down"><img src="img/bottom.png" style="width: 30px;height: 15px;"></span>
   	 <span class="alltypes"><a href="${foritou }/company/index.jsp">首页</a></span>
   	 <span class="alltypes"><a href="related_getGroomShop.action">本月推荐</a></span>
   	 <span class="alltypes"><a  id="nearby">附近商家</a></span>
   	 <div id="typesort">
   	 	<div class="J-nav-item">
   	 		<div class="nav-level1">
   	 			<dl>
   	 				<a class="nav-level1-lable1" href="${foritou }/shoptype_getShop.action?id=1">美食</a>
   	 			</dl>
   	 			
   	 		</div>
   	 	</div>
   	 	<div class="J-nav-item">
   	 			<div class="nav-level1">
   	 			<dl>
   	 				<a class="nav-level1-lable1" href="${foritou }/shoptype_getShop.action?id=2">酒店/客栈</a>
   	 			</dl>
   	 		
   	 		</div>
   	 	</div>
   	 	<div class="J-nav-item">
   	 			<div class="nav-level1">
   	 			<dl>
   	 				<a class="nav-level1-lable1" href="${foritou }/shoptype_getShop.action?id=3">影院</a>
   	 			</dl>
   	 			
   	 		</div>
   	 	</div>
   	 	<div class="J-nav-item">
   	 			<div class="nav-level1">
   	 			<dl>
   	 				<a class="nav-level1-lable1" href="${foritou }/shoptype_getShop.action?id=4">休闲娱乐</a>
   	 			</dl>
   	 			
   	 		</div>
   	 	</div>
   	 	<div class="J-nav-item">
   	 			<div class="nav-level1">
   	 			<dl>
   	 				<a class="nav-level1-lable1" href="${foritou }/shoptype_getShop.action?id=5">运动健身</a>
   	 			</dl>
   	 			
   	 		</div>
   	 	</div>
   	 	<div class="J-nav-item">
   	 			<div class="nav-level1">
   	 			<dl>
   	 				<a class="nav-level1-lable1" href="${foritou }/shoptype_getShop.action?id=6">周边游/旅游</a>
   	 			</dl>
   	 			
   	 		</div>
   	 	</div>
   	 	<div class="J-nav-item">
   	 			<div class="nav-level1">
   	 			<dl>
   	 				<a class="nav-level1-lable1" href="${foritou }/shoptype_getShop.action?id=7">生活服务</a>
   	 			</dl>
   	 			
   	 		</div>
   	 	</div>
   	 	<div class="J-nav-item">
   	 			<div class="nav-level1">
   	 			<dl>
   	 				<a class="nav-level1-lable1" href="${foritou }/shoptype_getShop.action?id=8">购物</a>
   	 			</dl>
   	 			
   	 		</div>
   	 	</div>
   	 	<div class="J-nav-item">
   	 			<div class="nav-level1">
   	 			<dl>
   	 				<a class="nav-level1-lable1" href="${foritou }/shoptype_getShop.action?id=9">丽人</a>
   	 			</dl>
   	 			
   	 		</div>
   	 	</div>
   	 </div>
   	</div>
   	
   </div>
   <div id="site-bar">
	   <div class="site-fs">
	   	     <div class="site-fs-top">
	   	  	 <h3 class="lable"><img src="img/hot.png" width="16" height="16" style="margin-right: 5px;">热门福利</h3>
	   	  	 <div class="filter-strip">
	   	  	 	<ul class="filter-strip-list">
	   	  	 		<li><a href="${foritou }/shop_getShopByHot.action?start=0&pageSize=20&searchString=小吃快餐">小吃快餐</a></li>
	   	  	 		<li><a href="${foritou }/shop_getShopByHot.action?start=0&pageSize=20&searchString=火锅">火锅</a></li>
	   	  	 		<li><a href="${foritou }/shop_getShopByHot.action?start=0&pageSize=20&searchString=自助餐">自助餐</a></li>
	   	  	 		<li><a href="${foritou }/shop_getShopByHot.action?start=0&pageSize=20&searchString=甜点餐品">甜点餐品</a></li>
	   	  	 		<li><a href="${foritou }/shop_getShopByHot.action?start=0&pageSize=20&searchString=烧烤">烧烤</a></li>
	   	  	 		<li><a href="${foritou }/shop_getShopByHot.action?start=0&pageSize=20&searchString=西餐">西餐</a></li>
	   	  	 		<li><a href="${foritou }/shop_getShopByHot.action?start=0&pageSize=20&searchString=香锅烤鱼">香锅烤鱼</a></li>
	   	  	 	</ul>
	   	  	 </div>
	   	  	</div>
	   	  	 <div class="site-fs-top">
	   	  	 <h3 class="lable"><img src="img/area.png" width="16" height="16" style="margin-right: 5px;">全部区域</h3>
	   	  	 <div class="filter-strip">
	   	  	 	<ul class="filter-strip-list">
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
	   	  	 <div class="site-fs-top">
	   	  	 <h3 class="lable"><img src="img/buis.png" width="16" height="16" style="margin-right: 5px;">全部区域</h3>
	   	  	 <div class="filter-strip">
	   	  	 	<ul class="filter-strip-list">
	   	  	 		<li><a href="${foritou }/shop_getShopByShangquan.action?start=0&pageSize=20&shangquan=八一广场">八一广场</a></li>
	   	  	 		<li><a href="${foritou }/shop_getShopByShangquan.action?start=0&pageSize=20&shangquan=下罗">下罗</a></li>
	   	  	 		<li><a href="${foritou }/shop_getShopByShangquan.action?start=0&pageSize=20&shangquan=南昌大学">南昌大学</a></li>
	   	  	 		<li><a href="${foritou }/shop_getShopByShangquan.action?start=0&pageSize=20&shangquan=南京东路">南京东路</a></li>
	   	  	 		<li><a href="${foritou }/shop_getShopByShangquan.action?start=0&pageSize=20&shangquan=北京东路">北京东路</a></li>
	   	  	 		<li><a href="${foritou }/shop_getShopByShangquan.action?start=0&pageSize=20&shangquan=中山路">中山路</a></li>
	   	  	 		<li><a href="${foritou }/shop_getShopByShangquan.action?start=0&pageSize=20&shangquan=万达广场">万达广场</a></li>
	   	  	 		<li><a href="${foritou }/shop_getShopByShangquan.action?start=0&pageSize=20&shangquan=叠栅路">叠栅路</a></li>
	   	  	 	</ul>
	   	  	 </div>
	   	     </div>
	   	  <div class="site-fs-bottom">
	   	  	   
          <section id="rt-showcase-surround">
    <div id="rt-showcase" class="slider-container rt-overlay-dark">
        <div class="rt-container slider-container">
            <div class="rt-grid-12 rt-alpha rt-omega">
                
                <link rel="stylesheet" href="css/style.css">

                <div class="csslider1 autoplay">
                    <input name="cs_anchor1" autocomplete="off" id="cs_slide1_0" type="radio" class="cs_anchor slide" >
                    <input name="cs_anchor1" autocomplete="off" id="cs_slide1_1" type="radio" class="cs_anchor slide" >
                    <input name="cs_anchor1" autocomplete="off" id="cs_slide1_2" type="radio" class="cs_anchor slide" >
                    <input name="cs_anchor1" autocomplete="off" id="cs_play1" type="radio" class="cs_anchor" checked>
                    <input name="cs_anchor1" autocomplete="off" id="cs_pause1" type="radio" class="cs_anchor" >
                    <ul>
                        <div style="width: 100%; visibility: hidden; font-size: 0px; line-height: 0;">
                            <div class="left-choice-item">
	   	  		<a href="${foritou }/shop_get.action?id=8"><img src="img/cattle2.png" width="330" height="232" ></a>
	   	  	    <div class="title">
	   	  	    	<a href="${foritou }/shop_get.action?id=8" class="xtitle">吴记牛肉火锅</a>
	   	  	    	<p class="desc">全牛宴提供wifi</p>
	   	  	    </div>
	   	  	    <span class="price">¥8</span> 
	   	  </div>
	   	    <div class="right-choice-item">
	   	  		<a href="${foritou }/shop_get.action?id=10"><img src="img/cattle.png" width="330" height="232" ></a>
	   	  	    <div class="title">
	   	  	    	<a href="${foritou }/shop_get.action?id=10" class="xtitle">万家灯火</a>
	   	  	    	<p class="desc">自助晚餐</p>
	   	  	    </div>
	   	  	    <span class="price">¥7</span>
	   	     </div>
                        </div>
                        <li class="num0 img">
                            <div class="left-choice-item">
	   	  		<a href="${foritou }/shop_get.action?id=7"><img src="img/cattle2.png" width="330" height="232" ></a>
	   	  	    <div class="title">
	   	  	    	<a href="${foritou }/shop_get.action?id=7" class="xtitle">吴记牛肉火锅</a>
	   	  	    	<p class="desc">全牛宴提供wifi</p>
	   	  	    </div>
	   	  	    <span class="price">¥5</span> 
	   	  </div>
	   	    <div class="right-choice-item">
	   	  		<a href="${foritou }/shop_get.action?id=8"><img src="img/cattle.png" width="330" height="232" ></a>
	   	  	    <div class="title">
	   	  	    	<a href="${foritou }/shop_get.action?id=8" class="xtitle">万家灯火</a>
	   	  	    	<p class="desc">自助晚餐</p>
	   	  	    </div>
	   	  	    <span class="price">¥7</span>
	   	     </div>
                        </li>
                        <li class="num1 img">
                            <div class="left-choice-item">
	   	  		<a href="${foritou }/shop_get.action?id=8"><img src="img/cattle3.png" width="330" height="232" ></a>
	   	  	    <div class="title">
	   	  	    	<a href="${foritou }/shop_get.action?id=8" class="xtitle">潮汕牛肉火锅</a>
	   	  	    	<p class="desc">满100送酒水</p>
	   	  	    </div>
	   	  	    <span class="price">¥5</span> 
	   	  </div>
	   	    <div class="right-choice-item">
	   	  		<a href="${foritou }/shop_get.action?id=8"><img src="img/11.png" width="330" height="232" ></a>
	   	  	    <div class="title">
	   	  	    	<a href="${foritou }/shop_get.action?id=8" class="xtitle">丸子大作战</a>
	   	  	    	<p class="desc">鲜嫩多汁</p>
	   	  	    </div>
	   	  	    <span class="price">¥5</span>
	   	     </div>
                        </li>
                        <li class="num2 img">
                            <div class="left-choice-item">
	   	  		<a href="#"><img src="img/cattle2.png" width="330" height="232" ></a>
	   	  	    <div class="title">
	   	  	    	<a href="${foritou }/shop_get.action?id=8" class="xtitle">生鲜牛排</a>
	   	  	    	<p class="desc">全牛宴提供wifi</p>
	   	  	    </div>
	   	  	    <span class="price">¥6</span> 
	   	  </div>
	   	    <div class="right-choice-item">
	   	  		<a href="${foritou }/shop_get.action?id=8"><img src="img/22.png" width="330" height="232" ></a>
	   	  	    <div class="title">
	   	  	    	<a href="#" class="xtitle">季季红</a>
	   	  	    	<p class="desc">自助火锅</p>
	   	  	    </div>
	   	  	    <span class="price">¥5</span>
	   	     </div>
                        </li>
                    
                    </ul>
                    <div class="cs_description">
                        <label class="num0">
                            <span class="cs_title"><span class="cs_wrapper">1</span></span>
                            
                        </label>
                        <label class="num1">
                            <span class="cs_title"><span class="cs_wrapper">2</span></span>
                            
                        </label>
                        <label class="num2">
                            <span class="cs_title"><span class="cs_wrapper">3</span></span>
                            
                        </label>
                    </div>
                    
                    <div class="cs_arrowprev">
                        <label class="num0" for="cs_slide1_0"></label>
                        <label class="num1" for="cs_slide1_1"></label>
                        <label class="num2" for="cs_slide1_2"></label>
                    </div>
                    <div class="cs_arrownext">
                        <label class="num0" for="cs_slide1_0"></label>
                        <label class="num1" for="cs_slide1_1"></label>
                        <label class="num2" for="cs_slide1_2"></label>
                    </div>
                    
                    <div class="cs_bullets">
                        <label class="num0" for="cs_slide1_0">
                            <span class="cs_point"></span>
                           
                        </label>
                        <label class="num1" for="cs_slide1_1">
                            <span class="cs_point"></span>
                            
                        </label>
                        <label class="num2" for="cs_slide1_2">
                            <span class="cs_point"></span>
                            
                        </label>
                    </div>
                    
                </div>

            </div>
            <div class="clear"></div>
        </div>
    </div>
</section> 
	      </div>
        </div>
     </div>
    </div>
    <div id="middle">
    	<div class="famous-shop">
    		<div class="famous-head">
    			<a class="alarm">
    				<i class="logo"><img src="img/alarm.png" width="37" height="40"></i>
    				名店抢购
    			</a>
    		</div>
    		<div class="famous-bottom">
    		<c:forEach items="${applicationScope.HotProductList }" var="product">
    			<div class="deal-title">
    				<a class="deal-title_cover" href="${foritou }/shop_get.action?id=${product.shopid}">
    				<img src="${foritou }/image/shop/${product.pic }" width="260" height="154"> </a>
    				<h3 class="deal-title_title">
    					<a href="${foritou }/shop_get.action?id=${product.shopid}">
    						<span class="xtitle">${product.shopname}</span>
    						<span class="shortitle">${product.miaoshu }</span>
    					</a>
    				</h3>
    				<p class="deal-title-detail">
    					<span style="font-size: 20px;color: #f76120;">¥${product.price }</span>
    					<span class="value">门店价 <del class="num"><span>¥</span>89</del></span>
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
    		  
    		</div>
    	</div>
     <c:forEach items="${applicationScope.bigList }" var="list">
    	<div class="famous-shop">
    	
    		<div class="famous-head">
    			<a class="alarm">
    				<i class="logo"><img src="${foritou }/image/shoptype/${list[0].stpic}" width="37" height="40"></i>
    				${list[0].shoptype.typename }
    			</a>
    		</div>
    		<div class="famous-bottom">
    	<c:forEach items="${list }" var="product">
    		
    			<div class="deal-title">
    				<a class="deal-title_cover" href="${foritou }/shop_get.action?id=${product.shopid}"><img src="${foritou }/image/shop/${product.pic }" width="260" height="154"></a>
    				<h3 class="deal-title_title">
    					<a href="${foritou }/shop_get.action?id=${product.shopid}">
    						<span class="xtitle">${product.shopname}</span>
    						<span class="shortitle">${product.miaoshu }</span>
    					</a>
    				</h3>
    				<p class="deal-title-detail">
    					<span style="font-size: 20px;color: #f76120;">¥${product.price }</span>
    					<span class="value">门店价 <del class="num"><span>¥</span>89</del></span>
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
    	</div>
    	
    </div>
    </c:forEach>
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
   </div>
						
				
			   
  </body>
</html>
  <%--  <c:forEach items="${applicationScope.bigList }" var="list">
            <!-- 显示类别名称 -->
               <h2 class="sub_title"></h2>
                <ul id="first-carousel" class="first-and-second-carousel jcarousel-skin-tango">
                  
                  <c:forEach items="${list }" var="product">
                    <li> <a  href="${foritou }/shop_get.action?id=${product.shopid}" class="product_image"><img src="${foritou}/image/shop/${product.pic}" /></a>
                        <div class="product_info">
                            <h3><a href="#">商品名称：${product.shopName}</a></h3>
                            <small>${product.miaoshu}</small>
                       </div>
                        <div class="price_info"> 
                          <button>
                              <span class="pr_add">添加购物车</span>
                          </button>
                          <button class="price_add" title="" type="button">
                              <span class="pr_price">￥${product.price}</span>
                          </button>
                        </div>
                    </li>
                    </c:forEach>
                    <!-- 小循环结束 -->
                </ul>
              </c:forEach>
              <!-- 大循环结束 -->		 --%>