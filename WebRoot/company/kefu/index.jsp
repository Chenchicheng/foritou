<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>

	<head>
		<meta charset="utf-8" />
		<title>福利淘</title>
		<%@ include file="/public/head.jspf" %>
		<link rel="stylesheet" type="text/css" href="css/cssReset.css" />
		<link rel="stylesheet" type="text/css" href="css/index.css" />
		<link rel="stylesheet" type="text/css" href="css/common.css" />
		<link href="css/shophead.css" rel="stylesheet" type="text/css"/>
        <link href="css/bottom.css" rel="stylesheet" type="text/css"/>
        <style type="text/css">
        .accordion{
        border-color:#ddd;
        }
        .pull-right li ul {
	    margin-left: -10px;
         }
        </style>
		<script type="text/javascript">
			window.onload=function(){
				var aaa=document.getElementById("aaa");
				var aa=document.getElementById("aa");
				var a=true;
				aa.onclick=function(){
					if(a){
						aaa.style.display="block";
						a=false;
					}
					else{
						aaa.style.display="none";
						a=true;
					}
				}
				
				var bbb=document.getElementById("bbb");
				var bb=document.getElementById("bb");
				var b=true;
				bb.onclick=function(){
					if(b){
						bbb.style.display="block";
						b=false;
					}
					else{
						bbb.style.display="none";
						b=true;
					}
				}
				
				var ccc=document.getElementById("ccc");
				var cc=document.getElementById("cc");
				var c=true;
				cc.onclick=function(){
					if(c){
						ccc.style.display="block";
						c=false;
					}
					else{
						ccc.style.display="none";
						c=true;
					}
				}
				
				var ddd=document.getElementById("ddd");
				var dd=document.getElementById("dd");
				var d=true;
				dd.onclick=function(){
					if(d){
						ddd.style.display="block";
						d=false;
					}
					else{
						ddd.style.display="none";
						d=true;
					}
				}
				
				var eee=document.getElementById("eee");
				var ee=document.getElementById("ee");
				var e=true;
				ee.onclick=function(){
					if(e){
						eee.style.display="block";
						e=false;
					}
					else{
						eee.style.display="none";
						e=true;
					}
				}
				
				var fff=document.getElementById("fff");
				var ff=document.getElementById("ff");
				var f=true;
				ff.onclick=function(){
					if(f){
						fff.style.display="block";
						f=false;
					}
					else{
						fff.style.display="none";
						f=true;
					}
				}
				
				var ggg=document.getElementById("ggg");
				var gg=document.getElementById("gg");
				var g=true;
				gg.onclick=function(){
					if(g){
						ggg.style.display="block";
						g=false;
					}
					else{
						ggg.style.display="none";
						g=true;
					}
				}
				
				var hhh=document.getElementById("hhh");
				var hh=document.getElementById("hh");
				var h=true;
				hh.onclick=function(){
					if(h){
						hhh.style.display="block";
						h=false;
					}
					else{
						hhh.style.display="none";
						h=true;
					}
				}
				
				var iii=document.getElementById("iii");
				var ii=document.getElementById("ii");
				var i=true;
				ii.onclick=function(){
					if(i){
						iii.style.display="block";
						i=false;
					}
					else{
						iii.style.display="none";
						i=true;
					}
				}
				
				var jjj=document.getElementById("jjj");
				var jj=document.getElementById("jj");
				var j=true;
				jj.onclick=function(){
					if(j){
						jjj.style.display="block";
						j=false;
					}
					else{
						jjj.style.display="none";
						j=true;
					}
				}
				
				var kkk=document.getElementById("kkk");
				var kk=document.getElementById("kk");
				var k=true;
				kk.onclick=function(){
					if(k){
						kkk.style.display="block";
						k=false;
					}
					else{
						kkk.style.display="none";
						k=true;
					}
				}
				
				var lll=document.getElementById("lll");
				var ll=document.getElementById("ll");
				var l=true;
				ll.onclick=function(){
					if(l){
						lll.style.display="block";
						l=false;
					}
					else{
						lll.style.display="none";
						l=true;
					}
				}
				
				var mmm=document.getElementById("mmm");
				var mm=document.getElementById("mm");
				var m=true;
				mm.onclick=function(){
					if(m){
						mmm.style.display="block";
						m=false;
					}
					else{
						mmm.style.display="none";
						m=true;
					}
				}
				
			}
		</script>
	</head>

	<body>
	
	<div id="header">
	 <div class="top">
	 <a  href="../../company/index.jsp" style="text-decoration: none;">  <span class="glyphicon glyphicon glyphicon-home redColor"></span>
            福利淘首页
	 </a>
	 <c:choose>  
    <c:when test="${not empty sessionScope.company}">  
      <a href="" style="text-decoration: none;">欢迎！${company.companyname }</a>  
      <!--如果 --> 
    </c:when>  
      
    <c:otherwise>  <!--否则 -->  
      <c:if test="${empty sessionScope.comapny}">
      	 <span>欢迎来到福利淘</span>
    <a href="../../company/login.jsp" style="text-decoration: none;">请登录</a>
       <a href="../../company/enroll1.jsp" style="text-decoration: none;">注册</a>  
     
       
       </c:if>
    </c:otherwise>  
 </c:choose>
  
     
     
        <ul class="pull-right">
           <li><a href="../../company/pay/myOrder.jsp">我的订单</a></li>
           <li><a href="#" id="myforitou" onclick="return false;" >我的福利淘</a>
               <ul>
                   <li><a href="../../company/pay/myOrder.jsp">我的订单</a></li>   
                   <li><a href="../../company/pay/mycollection.jsp">我的收藏</a></li> 
                    <li><a href="../../company/pay/employeecomment.jsp">员工评价</a></li> 
                   <li><a href="../../company/pay/extramoney.jsp">我的余额</a></li>  
                   <li><a href="../../company/pay/companysetting.jsp">账户设置</a></li>       
               </ul>
           </li>

           <li> <a href="../../company/showCar.jsp">我的购物车</a>
   
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
	<div id="sum" >
   
   	<div id="site-logo">
   	 <a href="../../company/index.jsp" style="text-decoration: none;"><img src="../../company/img/logo.png" style="width: 82px; height:110px;"></a>
   	</div>
   	<div>
   				<p class="site-commitment">
   					<a class="commitment-item" href="${foritou }/company/suishitui/index.jsp">
   						<span><img src="../../company/img/overdue.png" style="width:36px;height:30px;"></span>
   					</a>
   					<a class="commitment-item" href="${foritou }/company/suishitui/index.jsp">
   						<span><img src="../../company/img/discontent.png" style="width:36px;height:30px;"></span>
   					</a>
   					<a class="commitment-item" href="${foritou }/company/suishitui/index.jsp">
   						<span><img src="../../company/img/back.png" style="width:36px;height:30px;"></span>
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
   
		<div class="main">
		
			<!--S= 中间内容-->
			<div class="content" style="margin-bottom: 50px">
				<div class="content_middle">
					<ul class="content_middle_img">
						<li class="content_middle_img_l fl">
							<a href="#"></a>
						</li>
						<li class="content_middle_img_r fr">
							<a href="#content_top_id">
								<p></p>
							</a>
						</li>
					</ul>
					<ul class="content_middle_i">
						<li class="content_middle_i_l fl">
							<a href="#">申请退款</a>
						</li>
						<li class="content_middle_i_r fr">
							<a href="#content_top_id">常见问题</a>
						</li>
					</ul>
				</div>
				<hr />
				<div class="content_bottom">
					<p class="content_bottom_1">请参考下方教程操作：</p>
					<p class="content_bottom_2"><s>●</s>登录福利淘账户，进入“我的福利淘”--“<s>我的订单</s>”，即可操作退款</p>
					<p class="content_bottom_3"><img src="img/2.jpg" /></p>
					<p class="content_bottom_4"><s>知道了，去退款》</s></p>
					<p class="content_bottom_5"><s>●</s>如无“退款”字样，表示订单当前无法自助退款，有以下两种情况：</p>
					<p class="content_bottom_6">1、订单中的商家折扣已被员工消费。</p>
					<p class="content_bottom_7">2、订单不支持退款。</p>
				</div>
				<hr />
				<div class="content_top" id="content_top_id">
					<ul>
						<li>
							<a href="#hot">热门问题</a>
						</li>
						<li>
							<a href="#pay">支付问题</a>
						</li>
						<li>
							<a href="#refund">退款问题</a>
						</li>
						<li>
							<a href="#account">账户问题</a>
						</li>
					</ul>
				</div>
				<div class="conten_problem">
					<h1 id="hot" class="headline"><span class="headline__content"> 热门问题</span></h1>
					<ul class="accordion accordion--hover">
						<li class="accordion-fold" id="aa">
							<h3 class="accordion-fold__head"><i></i>银行/支付宝/财付通已扣款，福利淘订单仍显示未付款</h3>
							<div class="accordion-fold__body" id="aaa">
								<p>
									出现此问题，可能是银行/支付宝/财付通的数据没有即时传输至福利淘，请您不要担心，稍后刷新页面查看。
								</p>
								<p>
									如半小时后仍显示"未付款"，请先联系银行/支付宝/财付通客服，获取您扣款的交易号，然后致电福利淘客服1111-1111，我们会协助您解决。
								</p>
							</div>
						</li>
						<li class="accordion-fold"  id="bb">
							<h3 class="accordion-fold__head"><i></i>收不到/收不到/误删福利淘短信怎么办？</h3>
							<div class="accordion-fold__body" id="bbb">
								<p>
									请您登录福利淘账户，进入"<s>我的订单</s>"，找到您的订单，点击"查看密码"，拍照或手抄密码，发送至福利淘客服，我们会协助您解决。
								</p>
							</div>
						</li>
						<li class="accordion-fold" id="cc">
							<h3 class="accordion-fold__head"><i></i>所购买折扣是否已有员工使用？</h3>
							<div class="accordion-fold__body" id="ccc">
								<p>
									请您登录福利淘账户，进入"<s>我的福利淘</s>-<s>我的订单</s>"，找到您的订单，点击"订单详情"，进入"订单详情"页，即可查看所购折扣是否已被使用。
								</p>
								<p>
									温馨提示：
								</p>
								<p>
									部分订单为商家提供的优惠码，使用状态请您致电商家查询（商家联系信息可在商品详情页查看）。
								</p>
							</div>
						</li>

						<li class="accordion-fold" id="dd">
							<h3 class="accordion-fold__head"><i></i>未消费如何退款？</h3>
							<div class="accordion-fold__body" id="ddd">
								<p>
									请您登录福利淘账户，进入"<s>我的福利淘</s>-<s>我的订单</s>"，找到您想要退款的订单，点击"申请退款"，根据页面提示选择退回<s>福利淘余额</s>或原支付方账户，即可操作退款。
								</p>
								<p>
									如无"退款"字样，表示订单当前无法自助退款，有以下二种原因：
								</p>
								<ul>
									<li>
										<p>
											订单已被员工消费；
										</p>
									</li>
									<li>
										<p>
											订单不支持退款。
										</p>
									</li>
								</ul>
							</div>
						</li>
						<li class="accordion-fold" id="ee">
							<h3 class="accordion-fold__head"><i></i>退款退到什么账户、多久到账？</h3>
							<div class="accordion-fold__body" id="eee">
								<p>
									退款到账账户和时间，与您选择的退款方式有关：
								</p>
								<ol>
									<li>
										<p>
											选择退回福利淘余额，即退回您的<s>福利淘余额</s>，1个工作日内（少量商品需要3个工作日）到账。
										</p>
									</li>
									<li>
										<p>
											选择退回原支付方账户，即退回您当时支付使用的银行卡/支付宝/财付通，1-7个工作日内（少量商品需要额外增加3个工作日）到账。
										</p>
									</li>
								</ol>
								<p>
									如需查看退款详情，请您登录福利淘账户，进入"<s>我的福利淘</s>--<s>我的订单</s>"，找到您退款的订单，点击"退款详情"，可查看详细退款信息。
								</p>
							</div>
						</li>
						<li class="accordion-fold" id="ff">
							<h3 class="accordion-fold__head"><i></i>未收到退款怎么办？</h3>
							<div class="accordion-fold__body" id="fff">
								<p>
									不同退款方式，退款到账时间不同，请您确认您当时选择的退款方式。
								</p>
								<ol>
									<li>
										<p>
											退至福利淘余额，1个工作日（少量商品需要3个工作日）到账，您可在"<s>我的福利淘</s>--<s>福利淘余额</s>"查询。
										</p>
									</li>
									<li>
										<p>
											原路退（即退至您当时支付使用的银行卡/支付宝/财付通），1-7个工作日（少量商品需额外增加3个工作日）到账。
										</p>
									</li>
									<li>
										<p>
											银行卡查询退款，请您登录网上银行或致电银行客服查询。
										</p>
									</li>
									<li>
										<p>
											支付宝查询退款，请您登录支付宝，进入"最近交易记录-退款记录"查询。
										</p>
									</li>
									<li>
										<p>
											财付通查询退款，请您登录财付通，进入"交易查询-收支明细"查询。
										</p>
									</li>
								</ol>
								<p>
									温馨提示：
								</p>
								<ol>
									<li>
										<p>
											退至福利淘余额或原路退，目前暂无到账通知短信，请您谅解。
										</p>
									</li>
									<li>
										<p>
											如您同一订单支付时选择了多种支付方式（或先充值至福利淘余额），退款也会相应分为多笔，退至您当时支付使用的银行卡/支付宝/财付通。
										</p>
									</li>
								</ol>
								<p>
									如需查看退款详情，请您登录福利淘账户，进入"<s>我的福利淘</s>--<s>我的订单</s>"，找到您退款的订单，点击"退款详情"，可查看详细退款信息。
								</p>
							</div>
						</li>
						<li class="accordion-fold" id="gg">
							<h3 class="accordion-fold__head"><i></i>如何更换绑定手机号？</h3>
							<div class="accordion-fold__body" id="ggg">
								<p>
									请您登录福利淘账户，进入"<s>我的美团</s>--<s>账户设置</s>"，点击【更换】"，根据页面提示操作即可。
								</p>
								<p>
									部分情况可能需验证您已绑定手机号，如您已绑定手机号无法接收验证码短信，请您致电福利淘客服1111-1111，我们会协助您解决。
								</p>
							</div>
						</li>

					</ul>

					<h1 id="pay" class="headline"><span class="headline__content"> 支付问题</span></h1>
					<ul class="accordion accordion--hover">
						<li class="accordion-fold" id="hh">
							<h3 class="accordion-fold__head"><i></i>支持哪些支付方式？</h3>
							<div class="accordion-fold__body" id="hhh">
								<p>
									福利淘支持如下4种支付方式：<strong>各大银行的储蓄卡和信用卡、支付宝、财付通、微信、福利淘余额</strong>
								</p>
								<p>
									温馨提示：
								</p>
								<p>
									福利淘仅支持网上支付，不支持到店付款/货到付款/电话下单。
								</p>
							</div>
						</li>
						<li class="accordion-fold" id="ii">
							<h3 class="accordion-fold__head"><i></i>银行/支付宝/财付通已扣款，福利淘订单仍显示未付款</h3>
							<div class="accordion-fold__body" id="iii">
								<p>
									出现此问题，可能是银行/支付宝/财付通的数据没有即时传输至福利淘，请您不要担心，稍后刷新页面查看。
								</p>
								<p>
									如半小时后仍显示"未付款"，请先联系银行/支付宝/财付通客服，获取您扣款的交易号，然后致电福利淘客服1111-1111，我们会协助您解决。
								</p>
							</div>
						</li>
						<li class="accordion-fold" id="jj">
							<h3 class="accordion-fold__head"><i></i>银行/支付宝/财付通扣款两次，仅购买成功一次怎么办？</h3>
							<div class="accordion-fold__body" id="jjj">
								<p>
									出现此问题，主要因网络延迟导致，请您不要担心，登录福利淘账户，进入"<s>我的美团</s>--<s>福利淘余额</s>"查看多扣款项是否在福利淘余额中。
								</p>
								<ul>
									<li>
										<p>
											如在福利淘余额，您可点击"提现"，按照页面提示操作，1-7个工作日内将退回您当时支付使用的银行卡/支付宝/财付通。
										</p>
									</li>
									<li>
										<p>
											如不在<s>福利淘余额</s>，请先联系银行/支付宝/财付通客服，获取您扣款的交易号，然后致电福利淘客服1111-1111，我们会协助您解决。
										</p>
									</li>
								</ul>
							</div>
						</li>

						<h1 id="refund" class="headline"><span class="headline__content"> 退款问题</span></h1>
						<ul class="accordion accordion--hover">
							<li class="accordion-fold" id="kk">
                <h3  class="accordion-fold__head "><i></i>未消费如何退款？</h3>
                <div class="accordion-fold__body" id="kkk"><p>
	请您登录福利淘账户，进入"<s>我的美团</s>--<s>我的订单</s>"，找到您想要退款的订单，点击"申请退款"，根据页面提示选择退回<s>福利淘余额</s>或原支付方账户，即可操作退款。
								</p>

								<p>
									如无"退款"字样，表示订单当前无法自助退款，有以下二种原因：
								</p>
								<ul>
									<li>
										<p>
											订单已被员工消费；
										</p>
									</li>
									<li>
										<p>
											订单不支持退款。
										</p>
									</li>
								</ul>
				</div>
				</li>
				</ul>
				<h1 id="account" class="headline"><span class="headline__content"> 账户问题</span></h1>
				<ul class="accordion accordion--hover">

					<li class="accordion-fold" id="ll">
						<h3 class="accordion-fold__head"><i></i>忘记登录密码怎么办？</h3>
						<div class="accordion-fold__body" id="lll">
							<p>
								请您点击首页右上方"<s>登录</s>"，进入"登录"页，福利淘提供以下两种方式帮助您登录：
							</p>
							<ol>
								<li>
									<p>
										请您点击"<s>忘记密码</s>"，根据页面提示填写信息，可通过邮箱或手机号找回登录密码。
									</p>
								</li>
								<li>
									<p>
										如您已绑定手机号，请您点击"<s>手机动态码登录</s>"，根据页面提示收取动态码短信，回填即可登录账号。
									</p>
								</li>
							</ol>
						</div>
					</li>
					<li class="accordion-fold" id="mm">
						<h3 class="accordion-fold__head"><i></i>忘记登录账号怎么办？</h3>
						<div class="accordion-fold__body" id="mmm">
							<p>
								如您希望继续使用之前的福利淘账户，绑定手机号也可作为登录账号，如忘记绑定手机号或未绑定手机号，请您致电美团客服10107888，我们会协助您解决。
							</p>
							<p>
								如您无需使用之前的福利淘账户，建议您可<s>重新注册福利淘</s>，或通过合作网站账号登录。
							</p>
						</div>
					</li>
			</div>
		</div>
		<!--E= 中间内容-->

		<!--S= 左上部分-->
		<div class="left_top">
			<div class="left_top_img fl"></div>
			<div class="left_top_t">
				<p class="left_top_t_p">福利淘客服</p>
				<p>1111-1111</p>
				<p>每天8:00-23:00</p>
			</div>
			<hr />
			<div class="left_top_b">
				<p class="left_top_b_p">小提示</p>
				<p class="left_top_b_i"><img src="img/1.gif" /></p>
				<p class="left_top_b_t">A&nbsp;每天推出多家超低折扣！</p>
				<p class="left_top_b_im"><img src="img/2.gif" /></p>
				<p class="left_top_b_tm">B&nbsp;明天再来看，又有新惊喜！</p>
			</div>
		</div>
		<!--E= 左上部分-->
		
		<div id="bottom" style="margin-top:50px;margin-left:80px;" align="center">
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
		
		</div>
		
	</body>

</html>