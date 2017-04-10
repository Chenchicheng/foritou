<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
  
<%@ include file="/public/head.jspf" %>
  <style type="text/css">
.imageBorder{
  border:1px solid #ff6537;
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
        $("#discount_price").html("<label>单价：</label>¥<input class='perprice_input' type='text' name='price' value='"+price+"'>元");
    }); 
}
$(function(){






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
    
    $("#addSorder").click(function(){
   
     $.post("",
    { 
       
    }, 
        function(data,status){
       
    }); 
    
    });
    
    
    
    
    });
</script>
   
  </head>
  
 <body>
   	<div id="tips">
  		
  	</div>
  <div id="sum">
   <div id="header">
   <div id="header-top">
   	<div id="site-logo">
   		<img src="img/fuli.png" style="width: 82px; height:110px;">
   	</div>
   	<div id="city-info">
   		<h2 style="margin: 0px;"><a class="city-info-name">南昌</a></h2>
   		<a class="city-info-toggle" onMouseOver="this.style.color='#2bb8aa'" onmouseout="this.style.color='#999'">切换城市</a>
   	</div>
   	<div id="search-box">
   		<form action="">
   			<div >
   				<input class="search-box-left" placeholder="请输入商品名称"/>
   			</div>
   			<div >
   				<input class="search-box-right" value="搜索"type="submit">
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
   <div>
   	 <span class="alltypes">全部分类</span>
   	 <!--<div>
   	 	<ul>
   	 		<li>美食</li>
   	 		<li>酒店/客栈</li>
   	 		<li>电影</li>
   	 		<li></li>
   	 		<li></li>
   	 		<li></li>
   	 		<li></li>
   	 		<li></li>
   	 		<li></li>
   	 	</ul>
   	 </div>-->
   	 <span class="down"><img src="img/down.png" style="width: 30px;height: 15px;"></span>
   	</div>
   	<nav>
   		<ul class="site-navbar">
   			<li class="navbar-item-w">
   				<a class="navbar-item"><span>首页</span></a>
   			</li>
   			<li class="navbar-item-w">
   				<a class="navbar-item"><span>本月推荐</span></a>	
   				</li>
   			<li class="navbar-item-w">
   				<a class="navbar-item"><span>附近商家</span></a>
   			</li>
   		</ul>
   	</nav>
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
   			<div class="sans-serif">
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
   					<span id="discount_price" class="price-symbol"><label>单价：</label>¥<input class="perprice_input" type="text" name="price" value="${discount.personprice }">元</span>
   					
   					
   				</h2>
   			</div>
   			<div class="shop-rating">
   				<span class="shop-rating-item">
   					<span>
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
   				<button class="item" data-action="-" gaevent="top/plus" type="button">−</button>
   				<input type="text" class="quantity" name="peoplenumber" value="1" maxlength="9" data-max="500">
   				<button  class="item" data-action="+" gaevent="top/plus" type="button">+</button>
   				</span>
   			</div>
   			<div class="shop-purchase">
   				
   				<span><button id="addSorder" class="card-buy">加入购物车</button></span>
   			    <a class="collect" href="#"><img  src="img/forder.png" width="30px" height="30px" style="margin-top: 10px;"></a>
   			    <a class="small-btn" href="#">
   			    	<img src="img/collector.png" width="25" height="25">
                    <!--<span style="margin-left: -10px; ">-->收藏<!--</span>-->   			    
   			    </a>
   			    <a class="small-btn" href="#">
   			    	<img src="img/share.png" width="25" height="25">
                    <!--<span style="margin-left: -10px; ">-->分享到<!--</span>-->   			    
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
   		<ul style="zoom: 1;">
   			<li><a class="tab-item">商家位置</a></li>
            <li><a class="tab-item">购买须知</a></li>
            <li><a class="tab-item">本单详情</a></li>
            <li><a class="tab-item">商家介绍</a></li>
            <li><a class="tab-item">消费评价</a></li>
   		</ul>
   	</div>
   	<div id="shop-location">
   		<div class="shop-location-top">
   			<p>商家位置</p>
   		</div>
   		<div class="shop-location-bottom">
   		   <div class="shop-location-left">
   		   <div style="height: 270px;">
   	<div id="store_map">
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
   		</div>	
   	</div>
   	
   </div>
   <div id="middle-right">
   	
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
                    <p class="contact-name">客服电话</p>
                    <p class="contact-info">
		        <span class="contact-numbers">10107888</span>
		        <span class="contact-time">(9:00-23:00)</span>
		    </p>
                    <p class="desc">退款、退换货、查看福利淘券</p>
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
