<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
<%@ include file="/public/head.jspf" %>
<link href="${foritou }/company/css/detail.css" rel="stylesheet" type="text/css"/>
<link href="${foritou }/company/css/shophead.css" rel="stylesheet" type="text/css"/>
<link href="${foritou }/company/css/bottom.css" rel="stylesheet" type="text/css"/>
<link href="${foritou }/company/css/personinfo.css" rel="stylesheet" type="text/css"/>
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
.order-item .delete{
	float:right;
	margin-top:-30px;
}
.order-cell .delete a{
	text-decoration:none;
	color:#666;
}

	</style><style type="text/css">
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
.order-item .delete{
	float:right;
	margin-top:-30px;
}
.order-cell .delete a{
	text-decoration:none;
	color:#666;
}
.content-right-top span a{
    text-decoration: none;
    display:inline-block;
    float:right;
    width:40px;
    margin-top:-10px;
    height:30px;
    color:#666;
    line-height: 2;
    padding-left:15px;
} 
.content-right-top span a:hover{
    color:#fff;
    background: #ff6537;
    border-radius:4px;
}

	</style>

 </head>
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
           <li ><a href="#" onclick="return false;" >我的福利淘</a>
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
   		<a  href="${foritou }/company/index.jsp" style="text-decoration: none;"><img src="${foritou }/company/img/logo.png" style="width: 82px; height:110px;"></a>
   	</div>
   	<div id="city-info">
   		<h2 style="margin: 0px;"><a class="city-info-name">南昌</a></h2>
   		<a class="city-info-toggle" onMouseOver="this.style.color='#2bb8aa'" onmouseout="this.style.color='#999'">切换城市</a>
   	</div>
   	<div id="search-box" style="z-index:1;" >
   		<form action="${foritou }/shop_getShopBySearch.action" method="post">
   			<div >
   				<input class="search-box-left" placeholder="请输入商品名称"/>
   			</div>
   			<div >
   				<input class="search-box-right" value="搜索"type="submit"  >
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
   				<span class="navbar-item"><a id="nearby">附近商家</a></span>
   			</li>
   		</ul>
   	</div>
   </div>
   </div>
   
   <div class="content">
       <div class="content-left">
           <div class="item">
              <span>我的收藏</span>
              <ul>
                 
                 <li><a href="${foritou}/company/pay/mycollection.jsp " >我的收藏</a></li>    
              </ul>
           </div>
           <div class="item">
              <span>员工评价</span>
              <ul>
                 <li><a href="${foritou}/company/pay/employeegrade.jsp" >员工打分</a></li>
                 <li><a href="${foritou}/company/pay/employeecomment.jsp" style="background:#ff6537; color:#fff;font-size:14px;line-height:30px;">员工评价</a></li>    
              </ul>
           </div>
           <div class="item" style="border:none;">
              <span>我的账户</span>
              <ul>
                 <li><a href="${foritou}/company/pay/extramoney.jsp">我的余额</a></li>
                 <li><a href="${foritou}/company/pay/companysetting.jsp">账户设置</a></li>    
              </ul>
           </div>         
        </div>
       <div class="content-right">
           <div class="content-right-top">
           <span><a href="${foritou}/company/pay/employeecomment2.jsp">差评</a><a href="${foritou}/company/pay/employeecomment1.jsp">中评</a><a href="${foritou}/company/pay/employeecomment.jsp">好评</a>
           </span>
           </div>
           <div class="content-right-bottom" >
            <div id="graph">Loading graph...</div>
              <script type="text/javascript">
				var myData = new Array(['KFC', 100], ['季季红', 75], ['川友火锅', 80], ['金典蛋糕', 30], ['壹米寿司', 20], ['北京烤鸭', 10], ['健身房', 10]);
				var colors = ['#FF6537', '#FF6537', '#FF6537', '#FF6537', '#FF6537', '#FF6537', '#FF6537'];
				var myChart = new JSChart('graph', 'bar');
				myChart.setDataArray(myData);
				myChart.colorizeBars(colors);
				myChart.setTitle('好评');
				myChart.setTitleColor('#8E8E8E');
				myChart.setAxisNameX('商家名称');
				myChart.setAxisNameY('好评数');
				myChart.setAxisColor('#c6c6c6');
				myChart.setAxisWidth(1);
				myChart.setAxisNameColor('#9a9a9a');
				myChart.setAxisValuesColor('#939393');
				myChart.setAxisPaddingTop(60);
				myChart.setAxisPaddingLeft(100);
				myChart.setAxisPaddingBottom(60);
				myChart.setTextPaddingBottom(20);
				myChart.setTextPaddingLeft(55);
				myChart.setTitleFontSize(11);
				myChart.setBarBorderWidth(0);
				myChart.setBarSpacingRatio(50);
				myChart.setBarValuesColor('#737373');
				myChart.setGrid(false);
				myChart.setSize(616, 321);
				myChart.setBackgroundImage('chart_bg.jpg');
				myChart.draw();
			</script>
				 
           
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
