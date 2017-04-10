<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
  
<%@ include file="/public/head.jspf" %>
  <link href="${foritou}/company/css/shophead.css" rel="stylesheet" type="text/css">  
  <style type="text/css">
.imageBorder{
  border:1px solid #ff6537;
}
.image-btn{
   background-image: url(img/collector.png);
   background-repeat: no-repeat; 
   background-size:25px 25px;
   display:inline_block;
   height:40px;
   width:70px;
   padding-left:10px;
   padding-right:10px;
   padding-bottom:10px;
   padding-top:7px;
   text-decoration: none;
   font-size: 12px;
 margin:0px;
 cursor:pointer;
}
.image-btn2{
   cursor:pointer;
   background-image: url(img/collector2.png);
   background-repeat: no-repeat; 
   background-size:25px 25px;
   display:inline_block;
   height:40px;
   width:70px;
   padding-left:10px;
   padding-right:10px;
   padding-bottom:10px;
   padding-top:7px;
   text-decoration: none;
   font-size: 12px;
 margin:0px;
 
}
.small-btn2{
   background-image: url(img/share.png);
   background-repeat: no-repeat; 
   background-size:25px 25px;
   display:inline_block;
   height:40px;
   width:70px;
   padding-left:10px;
   padding-right:10px;
   padding-bottom:10px;
   padding-top:10px;
   text-decoration: none;
   font-size: 12px;
   margin:0px;
}
/* .types{
width:230px;
} */
.types ul{
width:240px;
margin-top:0px;
background:#f7f7f7;
border:1px solid #e5e5e5;
position: absolute;
display:none;
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
	.collectionImage{
	width:25px;
	height: 25px;
	
	}	
	.happy{
    background:#F54817;
    cursor:pointer;
    color:#fff;
    font-weight:700;
    }
   
  </style>
<script type="text/javascript">
 function show(e){
  $(e).addClass("imageBorder");
  $("#bigImage").html("<img  src="+e.src+" width='460' height='280' />");
} 
function clearCSS(e){
$(e).removeClass("imageBorder");
}
function selectdiscount(e){
    $.post("discount_getDiscount.action",
    { 
      'size.id':e.lang, 
    }, 
        function(data,status){
       var price=(data.discount.personprice).toFixed(2);
        $("#discount_number").html("<input class='discount_input' type='text' name='discount' value='"+data.discount.discount+"'>折");
        $("#discount_price").html("<label>单价：</label>¥<input class='perprice_input' type='text' name='personprice' value='"+price+"'>元");
    }); 
}











  function minus(e){
   
   var price=$(e).parent().parent().parent().prev().find("span").html();
   var t=$(e).next();

   if(t.val()>1){
       t.val(parseInt(t.val()) - 1);
        var total=$(e).parent().parent().parent().next().find("span");
        $(total).html((parseInt(t.val()) * parseInt(price)).toFixed(2));
	  
	  
        var personnumber=t.val();
         var shopid= parseInt($(e).parent().find("span").html());
       
   
         $.post("sorder_updateSorder.action",
                  {personnumber:personnumber,'shop.id':shopid},
                  function(data){
            $("#J-cart-total").html(data);//更新总计

    },"text");
       
       
	  
	  
	  
		}
   }
 
 function add(e){
 
   var t=$(e).prev();
   var price=$(e).parent().parent().parent().prev().find("span").html();
       t.val(parseInt(t.val()) + 1);
       var total=$(e).parent().parent().parent().next().find("span");
       $(total).html((parseInt(t.val()) * parseInt(price)).toFixed(2));	
      
       
        var personnumber=t.val();
         var shopid= parseInt($(e).parent().find("span").html());
       
   
         $.post("sorder_updateSorder.action",
                  {personnumber:personnumber,'shop.id':shopid},
                  function(data){
            $("#J-cart-total").html(data);//更新总计

    },"text");
       
       
       
       
       
       
 }
 
 
$(function(){
//获取地理位置


  
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
   //获取地理位置结束


   var navLi=$("li"); //此处填写你的导航html对象

    var windowUrl=window.location.href; //获取当前url链接
    navLi.each(function(){
        var t=$(this).find('a').attr('href');
        if(t==windowUrl){
            $(this).addClass('happy');  //添加当前位置样式 
        }
    });



//加载地图
    var shop_name=$("#shop_name").val();
    var shop_address=$("#shop_address").val();
    var shop_phone=$("#shop_phone").val();
    var shop_addressmap=$("#shop_addressmap").val();
    var shop_mapimage=$("#shop_mapimage").val();
    $(".store_map").click(function(){
    $.post("store_getStore.action",
    { 
      id:this.lang, 
    }, 
        function(data,status){
        shop_name=data.store.info;
        shop_address=data.store.adress;
        shop_phone=data.store.phone;
        shop_addressmap=data.store.addressmap;   
        $("#store_map").html("<div id='map3' style='height:270px;'></div>")
            ShowMap("map3",{
    title:shop_name,
    lawfirm:shop_address,
    tel:shop_phone,
    mapx:shop_addressmap,
    pic:shop_mapimage,
    ismove:'0',
    piobj:'nxp'
    });
        
    });  
    
    });
    ShowMap("map3",{
    title:shop_name,
    lawfirm:shop_address,
    tel:shop_phone,
    mapx:shop_addressmap,
    pic:shop_mapimage,
    ismove:'0',
    piobj:'nxp'
    });
       
   var b=0;
    
    $("#collect").click(function(){

    if(this.lang==0&&b==0){
     $.post("collection_save.action",//发送请求
   {
   },function(data){//请求成功
	  if(data=="true"){
	  
		$(".image-btn").css({
	           "background-image": "url(img/collector2.png)",
			   "background-repeat": "no-repeat",
			   "background-size":"25px 25px",
			   "display":"inline_block",
			   "height":"40px",
			  " width":"70px",
			   "padding-left":"10px",
			   "padding-right":"10px",
			   "padding-bottom":"10px",
			   "padding-top":"7px",
			   "text-decoration":"none",
			   "font-size":"12px",
			   " margin":"0px"
	        });
	  		$("#edit").text("取消收藏");
	  }else{
	 window.location.href="${foritou}/company/login.jsp";
	
	  }
	  
     },"text");	
     
    b=1;
    
    }else if(this.lang==0&&b==1){
      $.post("collection_delete.action",//发送请求
   {
   },function(data){//请求成功
	  if(data=="true"){
		$(".image-btn").css({
	           "background-image": "url(img/collector.png)",
			   "background-repeat": "no-repeat",
			   "background-size":"25px 25px",
			   "display":"inline_block",
			   "height":"40px",
			  " width":"70px",
			   "padding-left":"10px",
			   "padding-right":"10px",
			   "padding-bottom":"10px",
			   "padding-top":"7px",
			   "text-decoration":"none",
			   "font-size":"12px",
			   " margin":"0px"
	        });
	  		$("#edit").text("收藏");
	  }
	  
     },"text");	
     
    b=0;
    
    
    
    
    }else if(this.lang==1&&b==0){
      $.post("collection_delete.action",//发送请求
   {
   },function(data){//请求成功
	  if(data=="true"){
		$(".image-btn2").css({
	           "background-image": "url(img/collector.png)",
			   "background-repeat": "no-repeat",
			   "background-size":"25px 25px",
			   "display":"inline_block",
			   "height":"40px",
			  " width":"70px",
			   "padding-left":"10px",
			   "padding-right":"10px",
			   "padding-bottom":"10px",
			   "padding-top":"7px",
			   "text-decoration":"none",
			   "font-size":"12px",
			   " margin":"0px"
	        });
	  		$("#edit").text("收藏");
	  }
	  
     },"text");	
     
    b=1;
    
    }else if(this.lang==1&&b==1){
     $.post("collection_save.action",//发送请求
   {
   },function(data){//请求成功
	    if(data=="true"){
		$(".image-btn2").css({
	           "background-image": "url(img/collector2.png)",
			   "background-repeat": "no-repeat",
			   "background-size":"25px 25px",
			   "display":"inline_block",
			   "height":"40px",
			  " width":"70px",
			   "padding-left":"10px",
			   "padding-right":"10px",
			   "padding-bottom":"10px",
			   "padding-top":"7px",
			   "text-decoration":"none",
			   "font-size":"12px",
			   " margin":"0px"
	        });
	  		$("#edit").text("取消收藏");
	  }
	  
     },"text");	
     
    b=0;
    
    } 

    });
    
    
   });

/*     var b = 0;
   $(".small-btn").click(function(){
	if (b == 0)
	{
		$(".small-btn").css({
           "background-image": "url(img/collector2.png)",
		   "background-repeat": "no-repeat",
		   "background-size":"20px 20px",
		   "display":"inline_block",
		   "height":"40px",
		  " width":"50px",
		   "padding":"10px",
        });
		b = 1; 
		
		
		$("#edit").text("取消收藏");
	}
	else
	{
	     $(".small-btn").css({
           "background-image": "url(img/collector.png)",
		   "background-repeat": "no-repeat",
		   "background-size":"25px 25px",
		   "display":"inline_block",
		   "height":"40px",
		  " width":"50px",
		   "padding":"10px",
        });
		b = 0; 
		$("#edit").text("收藏");;

	}
	 */


  
    window.onload=function(){
	var nav=document.getElementById('site-navbar2');
	var navFixed=document.getElementById('site-navbar3');
	var a=document.getElementById('tab-item');
	var tuijian=document.getElementById('middle-right');
	var tuijian2=document.getElementById('middle-right2');
	window.onscroll=function(){
		var scrollTop=document.documentElement.scrollTop||document.body.scrollTop;
		document.title=scrollTop;
		 if(scrollTop>nav.offsetTop){
			navFixed.style.display='block';
		}
		
		else if(scrollTop<nav.offsetTop){
			navFixed.style.display='none';
			a.style.color='#fff';
			a.style.background='#F54817';
		    a.style.cursor='pointer'; 
		   
		} 
	};
   };
   
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
               <ul   style="z-index:40;">
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
		</ul>		
	</div>	
	</div> 
  <div id="sum1">
   <div id="header1">
   <div id="header-top">
   	<div id="site-logo">
   		<a  href="${foritou }/company/index.jsp" style="text-decoration: none;"><img src="img/fuli.png" style="width: 82px; height:110px;"></a>
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
       <ul>
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
   				<span class="navbar-item"><a  id="nearby">附近商家</a></span>
   			</li>
   		</ul>
   	</div>
   </div>
   </div>
   <div id="middle">
   	<div id="middle-top">
   		<a class="bread-nav" href="#">
   			南昌
   		</a>
   		<span style="font-size: 12px;">》</span>
   		<a class="bread-nav" href="#">
   			火锅
   		</a>
   		<span style="font-size: 12px;" >》</span>
   		<a class="bread-nav" href="#">
   			青山湖区
   		</a>
   		<span style="font-size: 12px;">》</span>
   		
   			<a class="bread-nav" href="${foritou }/shop/detail.jsp">${shopLook.name }</a>
   		
   	</div>
   	<div id="shop-container">
   		<div id="shop-headline">
   			<div class="sans-serif" style="color: #666;font-weight:0;">
   				${sessionScope.shopLook.name}
   			</div>
   			<div class="shop-discription">
   				${shopLook.miaoshu }
   			</div>
   		</div>
   	</div>
   	<div id="shopinfo-detail">
   		<div id="shopinfo-left">
   			<div id="bigImage">
   			<img  src="${foritou }/image/shop/${dimageList[0].href }" width="460" height="280" />
   			</div>
   			<c:forEach items="${dimageList }" var="dimage">
   			<div class="candidates" id="smallImage">
   				<img onmouseover="javascript:show(this);" onmouseout="javascript:clearCSS(this);" src="${foritou }/image/shop/${dimage.href}" width="78" height="45">
   			</div>
   			</c:forEach>
   		</div>
   	<form action="sorder_addSorder.action" method="post">
   	<input type="hidden" name="shopimage" value="${dimageList[0].href }">
   	<input type="hidden" name="shopname" value="${sessionScope.shopLook.name }">	
   		<div id="shopinfo-right">
   	
   			<div class="shop-discount">
   				<span class="shop-discount-left">门店折扣</span>
   				<h2 id="discount_info" class="shop-discount-right" style="margin: 0px;">
   					
   					<span id="discount_number" class="price-discount"><input class="discount_input" type="text" name="discount" value="${discount.discount }">折</span>
   					<span id="discount_price" class="price-symbol"><label>单价：</label>¥<input class="perprice_input" type="text" name="personprice" value="${discount.personprice }">元</span>
   					
   					
   				</h2>
   			</div>
   			<div class="shop-rating">
   				<span class="shop-rating-item">
   					<span >
   						收藏
   						<span style="color: #f76120;">${scoreData.collector }</span>
   					</span>
   				</span>
   				<span class="vertical-divider-thin"></span>
   				<span class="shop-rating-item">
   					<span>
   					<span style="color: #f76120;">${scoreData.count }</span>
   						人评分
   					</span>
   				</span>
   				<span class="vertical-divider-thin"></span>
   				<span class="shop-rating-item">
   					<span>
   					<span style="color: #f76120;">${scoreData.aveScore }</span>
   						分
   					</span>
   				</span>	
   			</div>
   		 <!--    <div class="shop-discount">
   				<span class="shop-discount-left">有效期</span>
   				<span class="shop-validtime-right">
   				
   					<span style="color:#f76120; ">周末、法定节假日通用 </span>
   				</span>
   					
   			</div> -->
   			<div class="shop-discount">
   			    <span class="shop-discount-left">规模选择</span>
   				<span class="shop-validtime-right">
   				 <c:forEach items="${discountList }" var="discount">
   					<a style="cursor: pointer;" class="shopinfo-selection-item" onclick="javascript:selectdiscount(this);" lang="${discount.size.id }">${discount.size.size }人</a>
   				</c:forEach>
   				</span>
   			</div>
   			<div class="shop-discount">
   				
   			    <span class="shop-discount-left">人数</span>
   			    <span class="shop-validtime-right">
   				<button class="item" data-action="-" type="button" onclick="javascript:minus(this);">−</button>
   				<input type="text" class="quantity" name="personnumber" value="1" maxlength="9" data-max="500" style="margin-left: -6px;">
   				<button  class="item" data-action="+"  type="button" onclick="javascript:add(this);">+</button>
   				</span>
   			</div>
   			<div class="shop-purchase">
   				
   				<span><button id="addSorder" class="card-buy">加入购物车</button></span>
   			    <a class="collect" href="#"><img  src="img/forder.png" width="30px" height="30px" style="margin-top: 10px;"></a>
   			   			    
   			    	<!-- <img src="img/collector.png" width="25" height="25">-->
              	 <c:choose>  
    <c:when test="${not empty sessionScope.collection}">  
      <!--如果 --> 
  <a class="image-btn2" id="collect" lang="1">
          <span style="margin-left: 15px; color: #666;" id="edit">取消收藏</span>  
                   </a>  			    
    </c:when>  
      
    <c:otherwise>  <!--否则 -->  
      <c:if test="${empty sessionScope.collection}">
    <a class="image-btn" id="collect" lang="0">
          <span style="margin-left: 15px;color: #666; " id="edit" >收藏</span>  
                   </a>   			    
       </c:if>
    </c:otherwise>  
 </c:choose> 
                     		    
   			
   			    <a class="small-btn2" href="#">
   			    	<!--  <img src="img/share.png" width="25" height="25"> -->
                   <span style="margin-left: 18px; color: #666;">分享到</span>    			    
   			    </a>
   			</div>
   			<div class="shop-commitment">
   				<span class="shop-commit-left">服务承诺</span>
   				<span class="shop-commit-right">
   					<a href="#" class="shop-commit-item"><img src="img/tui.png" width="16" height="16" />随时退</a>
   					<a href="#" class="shop-commit-item"><img src="img/overdue.png" width="20" height="20" />过期退</a>
   					<a href="#" class="shop-commit-item"><img src="img/rightname.png" width="16" height="16" />真实评价</a>
   				</span>
   			</div>
   		</div>
   		</form>
   	</div>
   	<div id="middle-left">
    <div id="middle-tips">
   		<div class="middle-tips-text">
   			<p>亲爱的用户，本次团购有效期延长至2016年12月07日，感谢您的支持，祝消费愉快~</p>
   		</div>
   	</div>
   	<div id="site-navbar2">
   		<ul >
   			<li ><a id="tab-item" href="#shop-location">商家位置</a></li>
            <li><a id="tab-item" href="#purchasenotes">购买须知</a></li>
            <li><a id="tab-item" href="#shoppings">本单详情</a></li>
            <li><a id="tab-item" href="#shop-intro">商家介绍</a></li>
            <li><a id="tab-item" href="#shop-commitment">消费评价</a></li>
   		</ul>
   	</div>
   	<div id="site-navbar3" style="display:none;z-index:40;">
   		<ul style="zoom: 1;">
   			<li><a id="tab-item" href="#shop-location">商家位置</a></li>
            <li><a id="tab-item" href="#purchasenotes">购买须知</a></li>
            <li><a id="tab-item" href="#shoppings">本单详情</a></li>
            <li><a id="tab-item" href="#shop-intro">商家介绍</a></li>
            <li><a id="tab-item" href="#shop-commitment">消费评价</a></li>
   		</ul>
   	</div>
   	<div id="shop-location" style="z-index:1;" >
   		<div class="shop-location-top">
   			<p>商家位置</p>
   		</div>
   		<div class="shop-location-bottom">
   		   <div class="shop-location-left">
   		   <div style="height: 270px;">
   	<div id="store_map" style="z-index:-9999;">
    <div id="map3" style="height:270px;"></div>
    </div> 
    <input id="shop_name" type="hidden" value="${shop.name }" >
    <input id="shop_address" type="hidden" value="${shop.address }" >
    <input id="shop_phone" type="hidden" value="${shop.phone }"> 
    <input id="shop_addressmap" type="hidden" value="${shop.addressmap}"> 
    <input id="shop_addressmap" type="hidden" value="${shop.addressmap}"> 
     <input id="shop_mapimage" type="hidden" value="${foritou}/image/shop/${dimageList[0].href}"> 
    
  
    <script type="text/javascript">
</script> 
   		   </div>
   	<!-- 	   <div class="map"> 
   		   	<a href="#"><img src="img/enlarge.png" width="14px" height="14px">查看完整地图</a>
   		   	
   		   </div> -->
   		   </div>	
   		   <div class="shop-location-right">
   		 <c:forEach items="${storeList}" var="store">
   		   	<div class="info-content">  	
   		   	   	<h5 class="info-title">${store.info }</h5>	
   		   		<div  class="info-content-item">
   		   			<span >地址：</span>
   		   			<span style="color: #999;">${store.adress }</span>
   		   		</div>
   		   		<div class="info-content-item">
   		   			<a class="store_map"  lang="${store.id }" >查看地图</a>
   		   		</div>
   		   		<div  class="info-content-item">
   		   			<span >联系方式：</span>
   		   			<span style="color: #999;">${store.phone }</span>
   		   		</div>
   		   	</div>
   		   	<hr>
   		   	</c:forEach>
   		   </div>
   		   
   		   
   		   
   		   
   		</div>
   	</div>
   	<diV id="purchasenotes">
   		<div class="shop-location-top">
   			<p>购买须知</p>
   		</div>
   		<dl>
   			<dt>有效期</dt>
   			<dd>${usernotes.validtime }</dd> 
   			
   			<dt>使用时间</dt>
   			<dd>${usernotes.usetime }</dd>
   			
   			<dt>不可用时间</dt>
   			<dd>${usernotes.unabledate }</dd>
   			
   			<dt>其他费用</dt>
   			<dd>${usernotes.othermoney }</dd>
   			
   			<dt>温馨提示</dt>
   			<dd>${usernotes.tips }</dd>
   			
   			<dt>商家服务</dt>
   			<dd>${usernotes.service }</dd>	
   		</dl>
   	</diV>
   	<div id="shop-intro">
   		<div class="shop-location-top" >
   			<p>商家介绍</p>
   		</div>
        <div>
        ${shop.describle}
        
        </div>
        <c:forEach items="${jimageList }" var="jimage">
   			<div>
   				<img src="${foritou }/image/shop/${jimage.href}">
   			</div>
   			</c:forEach>

   		
   		
   		
   	</div>
   	<div id="shop-commitment">
   		<div class="shop-location-top" style="margin-bottom: 10px;">
   			<p>消费评价</p>
   			<div style="margin-top:15px;">
   			<div class="total-detail">
   			<div class="total-score">
   			<span class="average-score">${scoreData.aveScore }</span><span>分</span>
   			</div>
   			<div class="total-group">
   			
   			</div>
   			
   			<div class="total-count">
   			<span>共</span><strong>${scoreData.count }</strong><span>人评价</span>
   			</div>
   			</div>
   			<div class="account-detail">
   			
   			<div class="count-group">
   			<span style="color:#999;float:left;">1分</span>
   			<span class="percent-box inline-block" style="float:left;">
   			<em style="width:1%" class="percent inline-block"></em>
   			</span>
   			<span style="float:left;">31人</span>
   			</div>
   			<div class="count-group">
   			<span style="color:#999;float:left;">2分</span>
   			<span class="percent-box inline-block" style="float:left;">
   			<em style="width:2.9559037312227%" class="percent inline-block"></em>
   			</span>
   			<span style="float:left;">31人</span>
   			</div>
   			<div class="count-group">
   			<span style="color:#999;float:left;">3分</span>
   			<span class="percent-box inline-block" style="float:left;">
   			<em style="width:13.374252947827%" class="percent inline-block"></em>
   			</span>
   			<span style="float:left;">31人</span>
   			</div>
   			<div class="count-group">
   			<span style="color:#999;float:left;">4分</span>
   			<span class="percent-box inline-block" style="float:left;">
   			<em style="width:24.519463737684%" class="percent inline-block"></em>
   			</span>
   			<span style="float:left;">31人</span>
   			</div>
   			<div class="count-group">
   			<span style="color:#999;float:left;">5分</span>
   			<span class="percent-box inline-block" style="float:left;">
   			<em style="width:58.649652721693%" class="percent inline-block"></em>
   			</span>
   			<span style="float:left;">31人</span>
   			</div>
   			
   			
   			
   			</div>
   			</div>
   			 <div class="rete-detail">
   			<ul>
   			<li ><a href="#" style="background:#eee;">全部</a></li>
   			<li ><a href="#">晒图评价</a></li>
   			<li ><a href="#">只看低分</a></li>
   			<li style="float:right;margin-right:20px;margin-top:5px;"><select style="height:20px;">
   			<option>默认排序</option>
   			<option>按时间排序</option>
   			</select></li>
   			</ul>
   			</div> 
   			<div class="ratelist-content">
   			<ul>
   			<c:forEach items="${sessionScope.commentsList }" var="comments">
   			   <li>
   			   <div class="left">
   			   <p><img src="${comments.employee.headappear }" width="50px" height="50px"></p>
   			   <p>${comments.employee.nickname }</p>
   			   </div>
   			   <div class="right">
   			   <p><span><img src="img/comment.png" width="59" height="12"></span><span style="padding-left:20px;">${comments.date }</span></p>
   			   <p>${comments.comment }</p>
   		<!-- 	   <p><img src="" width="100" height="100"></p> -->
   			   </div>
   			   </li>
   			   </c:forEach>
   			</ul>
   			
   			</div>
   		</div>	
   	</div>
   	
   </div>
   </div>
   <div id="middle-right">
   	   <div class="middle-right-title">
   	    <a>猜你喜欢</a>
   	   </div>
   	  <c:forEach items="${groomProductList }" var="product">
   	    <div class="middle-right-item">
   	      <div class="left">
   	     <a href="${foritou }/shop_get.action?id=${product.shopid }"> <img src="${foritou }/image/shop/${product.pic}" width="82px" height="50px"></a>
   	      </div>
   	      <div class="right">
   	      <a href="${foritou }/shop_get.action?id=${product.shopid }" style="text-decoration: none;color: black;">${product.shopname }</a>
   	      <p><span style="color:#ff6537">${product.discount }</span>折
   	         <span style="color:#ff6537">￥${product.price }元</span>
   	      </div>
   	     </div>
   	 </c:forEach>
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
   </div>


  </body>
</html>
