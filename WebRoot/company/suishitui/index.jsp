<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<meta charset="utf-8" />
		<title>福利淘</title>
		<%@ include file="/public/head.jspf" %>
		<link rel="apple-touch-icon" href="img/foritou.png">
        <link rel="shortcut icon" href="img/foritou.png">
        <link rel="icon" href="img/foritou.png" sizes="16x16 32x32">
		<link rel="stylesheet" type="text/css" href="css/a_002.css">
        <link rel="stylesheet" type="text/css" href="css/a.css">
        <link href="${foritou }/company/css/bottom.css" rel="stylesheet" type="text/css"/>
        <link href="${foritou }/company/css/shophead.css" rel="stylesheet" type="text/css"/>
        <style type="text/css">
        #yui_3_16_0_1_1481464029545_7{
        background-color: white;
        }
        #bdw{
        margin-top:0px;
        }
        .pull-right li ul {
	    margin-left: -10px;
         }
        </style>
	</head>
	<body class="pg-commitment" id="yui_3_16_0_1_1481464029545_7">
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

<div id="bdw" class="bdw">
    <div id="bd" class="cf">
<div id="content">
    <div class="mainbox">
  
            <div>
                <ul class="nav-tabs--small cf">
                    <li><a href="#about" class="color-text">关于福利淘</a></li>
                    <li class="current"><a href="#commitment" class="color-text">福利淘承诺</a></li>
                    <li><a href="#delivery" class="color-text">购物保障</a></li>
                    <li><a href="#press" class="color-text">媒体报道</a></li>
                    
                </ul>
            </div>
            <div id="about-d">
            <h1 id="about" class="headline"><span class="headline__content">关于福利淘</span></h1>
            <div class="about">
                <p class="color-text f2"><h6>福利淘：</h6>专注于为员工带来福利，为消费者发现值得信赖的商家，让消费者享受随处打折的优质服务。我们为商家找到合适的消费者，给商家提供优质的互联网技术服务。</p>
       
                <h6>如果您是消费者：</h6>
            
                    <ul>
                        <li>福利淘每天帮您推荐多种优质的本地生活服务；</li>
                        <li>福利淘的推荐一定物超所值；</li>
                        <li>福利淘同时致力于帮您发现好玩，新鲜的生活方式；</li>
                    </ul>
            
                <h6>如果您是商家：</h6>
                    <ul>
                        <li>福利淘有大量想为员工带去福利的消费企业；</li>
                        <li>福利淘有保证效果的广告价值；</li>
                        <li>福利淘是您到达消费者的桥梁；</li>
                    </ul>
            
            </div>
            
            <h1 class="headline" id="contact"><span class="headline__content">联系我们</span></h1>
            
            <div class="connect">
            <h6>市场合作</h6>
                    <ul>
                        <li>如果您是媒体、渠道，想洽谈资源置换、市场合作，请联系：</li>
                        <li class="indent">邮箱：foritou#foritou.cn（请把#替换为@）</li>
                        <li>如果您想在福利淘投放广告，请联系：</li>
                        <li class="indent">邮箱：foritou#foritou.cn（请把#替换为@）</li>
                    </ul>
            </div>
            </div>
            <br />
            <div id="commitment" class="summary">
            <h2 class="summary__heading">消费者保障服务</h2>
            <p class="summary__banner"><img src="img/foritou02.png" alt="消费者保障服务" width="599" height="47"></p>
            <p class="summary__content">福利淘一直努力为注册企业提供“本地精品折扣消费指南”服务，同时福利淘推出“购买无忧”消费者保障计划，为您提供贴心的权益保障。<br>
                                          自我们创办之日，我们推出所有在线售卖的订单均享受"随时退"和"过期退"服务（物流单、电影选座、猫眼演出、酒店预订及旅游预约类产品除外）；已停售的企业订单享受其原有的售后服务，若原来不支持退款则依然不支持。<br>
                                          并在同时推出升级服务“过期自动退”。凡页面表明支持“过期自动退”的订单，在订单过期后，对用户未消费的订单进行自动退款。 
            </p>
        </div>
        <div id="anytime" class="step-block step-block--first cf">
            <h3 class="step-block__heading step-block__heading--anytime">未消费随时退款</h3>
            <ol class="step-block__list bg-guarantee">
                <li class="step step1"><span>在福利淘购买折扣成功<br>且未有员工进行消费使用</span></li>
                <li class="step step2"><span>我的订单页<br>申请退款</span></li>
                <li class="step step3"><span>原路退回：1~7个<br>工作日退至支付账户</span></li>
            </ol>
        </div>
        <div class="conditions">
            <h4 class="conditions__heading"> 以下团购商品或服务不适用"未消费随时退款"计划：</h4>
            <ol>
                <li><span class="label">实物类产品（物流单、电影选座、猫眼演出、酒店预订及旅游预约类产品等）</span></li>
                <li><span class="label">在申请退款之前已停售的商家折扣不予退款，标明"不支持随时退款"的产品或服务</span></li>
            </ol>
            <h4 class="conditions__heading">退款说明：</h4>
            <ol>
                <li>审核通过后，会在1-7个工作日内（少量商品需额外增加3个工作日）把款项退回到您的原支付方，
                	通过网银或支付宝等第三方支付平台进行支付的费用将直接退到原账户，或退回至福利淘账户余额，
                	由消费企业申请款项提现，再退回原账户，暂不收取手续费。</li>
            </ol>
        </div>
        <div class="step-block cf" id="expiredrefund">
            <h3 id="expire" class="step-block__heading step-block__heading--expire">过期未消费自动退款</h3>
            <ol class="step-block__list bg-guarantee">
                <li class="step step1"><span>企业购买折扣日过期<br>且未消费</span></li>
                <li class="step step2"><span>福利淘审核处理</span></li>
                <li class="step step3"><span>原路退回：1~7个工作日<br>退至支付账户</span></li>
            </ol>
        </div>
        <div class="conditions">
            <h4 class="conditions__heading">“过期自动退”计划的适用范围:</h4>
            <ol>
                <li>适用于大部分在线售卖的折扣订单(实物类产品折扣, 选座预约产品折扣等有特定日期消费时限的产品除外）, 以页面注明支持“过期自动退”为准。</li>
            </ol>
            <h4 class="conditions__heading">退款说明:</h4>
            <ol>
                <li>退款时间: 福利淘折扣有效期过后7个工作日内， 对未消费的订单进行自动退款。</li>
                <li>退款路径: 款项退回到您的福利淘账户余额，待您申请提现，我们将通过网银或支付宝等第三方支付平台进行自动退款至您与福利淘绑定的相关账户，暂不收取手续费。</li>
                <li>退款金额: 除去抵用券，积分， 促销抵扣部分， 您购买商家折扣时实际支付的金额。</li>
            </ol>
        </div>
        <div class="step-block" id="topspeed">
            <h3 class="step-block__heading step-block__heading--topspeed">极速退款</h3>
            <ol class="step-block__list bg-guarantee">
                <li class="step step1"><span>折扣购买成功<br>且未消费</span></li>
                <li class="step step2"><span>我的订单页<br>申请退款</span></li>
                <li class="step step3"><span>原路退回：退回至支付账户</span></li>
            </ol>
        </div>
        <div class="conditions">
            <h4 class="conditions__heading">极速退款支持范围：</h4>
            <ol>
                <li><span class="label">极速退款是优质商家提供的退款专享服务，仅限于页面明确标明“支持极速退款”的产品或服务。</span></li>
            </ol>
        </div>
        <div class="conditions">
            <h4 class="conditions__heading">极速退款说明：</h4>
            <ol>
                <li><span class="label">款项退回到您的原支付方，通过网银或支付宝等第三方支付平台进行支付的费用将直接退到原账户，充值卡或返利金额将退回到福利淘账户余额，暂不收取手续费。</span></li>
                <li><span class="label">退款金额: 除去抵用券，积分， 促销抵扣部分， 您购买商家折扣时实际支付的金额。</span></li>
            </ol>
        </div>
        <div class="conditions conditions--tips">
            用户在使用极速退款的过程中如出现违约，诈骗等违背诚信原则的行为， 将被取消极速到账特权。
        </div>
        <div class="step-block" id="displeasure">
            <h3 class="step-block__heading step-block__heading--displeasure">消费不满意，福利淘免单</h3>
            <ol class="step-block__list">
                <li class="step step1"><span>企业购买折扣成功<br>商家未兑现服务承诺</span></li>
                <li class="step step2"><span>致电福利淘客服</span></li>
                <li class="step step3"><span>客服联系商家<br>调查、核实</span></li>
                <li class="step step4"><span>福利淘为您免单</span></li>
            </ol>
        </div>
        <div class="conditions">
            <h4 class="conditions__heading">“消费不满意, 福利淘免单”计划的适用范围：</h4>
            <ol>
                <li><span class="label">商家提供给福利淘会员的产品或服务与其承诺的产品或服务内容严重不符</span></li>
                <li><span class="label">商家提供的产品或服务经合法有效的证据证明存在严重质量问题，或有违反《中华人民共和国食品安全法》、《中华人民共和国食品安全法实施条例》、《餐饮服务食品安全监督管理办法》、《中华人民共和国消费者权益保护法》的情况</span></li>
                <li><span class="label">福利淘所购折扣有效期内，商家无理拒绝提供给相应企业消费员工应享折扣</span></li>
            </ol>
        </div>
        <div id="logistics" class="step-block">
            <h3 class="step-block__heading step-block__heading--shortcut">交易快照保障</h3>
            <ol class="step-block__list">
                <li class="step step1"><span>购买成功未<br>消费订单</span></li>
                <li class="step step2"><span>商家修改折扣活动<br>系统生成快照</span></li>
                <li class="step step3"><span>消费时产生纠纷<br>或投诉</span></li>
                <li class="step step4"><span>基于【快照交易】<br>商家/客服解决问题</span></li>
            </ol>
        </div>
            
        <div class="conditions">
            <h4 class="conditions__heading">相关说明：</h4>
            <ol>
                <li><span class="label">消费者下单完成后，都会生成一张订单快照。</span></li>
                <li><span class="label">快照记录当时团购活动详情，如促销活动、重要通知、本单详情、购买须知等条款。</span></li>
                <li><span class="label">交易快照一经形成将永久有效，任何交易纠纷或者投诉都将以快照为准。</span></li>
            </ol>
        </div>
        <div class="conditions">
            <h4 class="conditions__heading">查看路径：</h4>
            <ol>
                <li><span class="label">【我的福利淘】-&gt;【我的订单】-&gt;【折扣订单】-&gt;【订单详情】-&gt;【交易快照】</span></li>
            </ol> 
        </div>
        <br /><br />
         <div id="quality" class="summary">
            <h2 id="delivery" class="summary__heading summary__heading--delivery">购买保障服务</h2>
            <ul class="summary__content">
                <li class="summary-item summary-item--seven">
                    <span class="summary-item__image"></span>
                    <p class="summary-item__text">消费者在折扣未消费时，可提出退款申请。</p>
                </li>
                <li class="summary-item summary-item--quality">
                    <span class="summary-item__image"></span>
                    <p class="summary-item__text">福利淘承诺在线的商家均为正规商家，消费者权益若受到威胁，可在指定期限内发起维权，福利淘必将妥善处理。</p>
                </li>
                <li class="summary-item summary-item--delivery">
                    <span class="summary-item__image"></span>
                    <p class="summary-item__text">消费者提交订单后，过期未消费的折扣，我们将在过期后退款。</p>
                </li>
            </ul>
        </div>
        <br />
         <h1 id="press" class="headline"><span class="headline__content">媒体报道</span></h1>
         <p class="summary-item__text">我们将尽快增强媒体的宣传力度。</p>
        </div>
    </div>
    </div>
    </div>
    
    
    <div id="bottom" align="center">
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
