<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
<%@ include file="/public/head.jspf" %>
<link href="${foritou}/company/css/showCar.css" rel="stylesheet" type="text/css">
 <link href="${foritou}/company/css/shophead.css" rel="stylesheet" type="text/css"> 
 <link href="${foritou}/company/css/bottom.css" rel="stylesheet" type="text/css"> 
<style type="text/css">
.fr{float:right;}
.continue{
    height: 40px;
    margin-right: 20px;
}
.sorderClear{
    margin-right: 20px;
    height: 40px;
}
</style>

 <script type="text/javascript">
 

$(function(){



<%
if(request.getSession().getAttribute("companyname")!=null){
%>
  
   $("#login2").css({
   "display":"block",
   });
    $("#login").css({
   "display":"none",
   });
   <%}%>

});






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
 
 
 
 
 
 
 
 
 
/*  
         $(document).ready(function () {
        	var i=0;
   

			
			
        $(function () {
        var price=$("#personprice").html();
   
		
			$(".itemplus").click(function () {
				t.val(parseInt(t.val()) + 1)
				setTotal(); GetCount();
			})
			$(".minus").click(function () {
			
			
				if(t.val()>1){
					t.val(parseInt(t.val()) - 1)
					setTotal(); GetCount();
				}
			})
			function setTotal() {

				$(".J-total").html((parseInt(t.val()) * parseInt(price)).toFixed(2));
	//发送ajax请求，传输当前的数量与商品id，返回的是总价格
                $.post("sorder_updateSorder.action",
                  {number:number,'product.id': pid},
                  function(total){
$("#total").html(total);//更新总计

},"text");
		
			}
			setTotal();
			});
			
			
			
	    
        });
  */
 
 
 </script>
 
 
  </head>
  
  <body>	
    <div id="header">
	 <div class="top">
	 <a  href="${foritou }/company/index.jsp" style="text-decoration: none;">  <span class="glyphicon glyphicon glyphicon-home redColor"></span>
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
		</ul>			
	</div>	
	</div>
	<div id="sum" >
   
   	<div id="site-logo">
   	 <a href="${foritou }/company/index.jsp" style="text-decoration: none;"><img src="img/logo.png" style="width: 82px; height:110px;"></a>
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
  	   
  	<div id="bd">	
	<div id="content">
     <form  id="J-cart-form" class="common-form form ">
    	

        <div class="mainbox">
            <div class="cart-head cf">
                <div class="cart-status">
                    <i class="cart-status-icon status-1"></i>
                     <span class="cart-title">我的购物车</span>
                    <span title="您的购物车内有1种商品，共可放20种商品" class="number">
                        <em class="count-in-carts">1</em>/20
                    </span>
                </div>
                <div class="login-bar">
                   
                </div>
            </div>

            <div class="table-section summary-table" >
                <table cellspacing="0" >
                    <tbody ><tr >
                        <th width="60" >
         
                            <label for="cart-selectall" class="cart-select-all"  >编号</label>
                        </th>
                        <th width="auto" class="desc">项目</th>
                        <th width="70">单价</th>
                        <th width="150">数量</th>
                        <th width="70" class="total">小计</th>
                        <th width="80">操作</th>
                    </tr>
      <c:forEach items="${sessionScope.forder.sorderSet}" var="sorder" varStatus="status">
                    <tr class="forder_tr">
                        <td colspan="6" class="cartItem">
                            <table cellspacing="0" >
                            <tbody>
                            	<tr>
                                <td width="60" rowspan="1" class="select-cartItem">
                                       ${status.index+1 }
                                        <label>&nbsp;</label>
                                </td>
                                <td width="auto" class="desc">
                                    <a href="http://nc.meituan.com/deal/41046934.html" target="_blank"  gaevent="cart/deal">
                                        <img src="${foritou }/image/shop/${sorder.shopimage}" width="63" height="39">
                                        <span class="sorder_discount">${sorder.discount }折</span>
                                        <span>${sorder.shop.name }</span>
                                    </a>
                                </td>
                                <td width="70" class="price">
                                
                                    ¥<span  class="J-price" id="personprice" lang="${sorder.personprice }">${sorder.personprice }</span>
                                </td>
                                <td width="150" class="saleNum deal-component-quantity">
                                    <div class="component-cart-quantity mt-component--booted">
                                    	<div class="cart-quantity">
                                           <button class="minus"  type="button" onclick="javascript:minus(this);">-</button>
                                           <input type="text"  class="f-text J-quantity J-cart-quantity" id="quantities" maxlength="4" value="${sorder.personnumber }">
                                           <button for="J-cart-add" class="itemplus" onclick="javascript:add(this);" data-action="+"  type="button" >+</button>
										   <span style="display:none;">${sorder.shop.id }</span>
										</div>
									</div>
                                </td>
                                <td width="70" rowspan="1" class="money total">
                                    ¥<span class="J-total">${sorder.personnumber*sorder.personprice }</span>
                                        <br>
                                </td>
                                <td width="80" class="op list-delete">
                                    <a class="delete" href="${foritou }/sorder_delete.action?id=${sorder.shop.id}">删除</a>
                                </td>
                            </tr>
                     
                            </tbody>
                            </table>
                        </td>
                    </tr>
                   </c:forEach>
                    <tr>
                        <td></td>
                        <td></td>
                        <td colspan="4" class="extra-fee total-fee">
                            <span class="amount">
                                已选<strong class="amount__num" id="J-cart-amount" >0</strong>件商品
                            </span>
                            <strong>应付总额</strong>：
                            <span class="inline-block money">
                                ¥<strong id="J-cart-total">${forder.total }</strong>
                            </span>
                        </td>
                    </tr>
                </tbody>
                </table>
            </div>
            <div class="form-submit">
                            	<button type="button" title="" class="checkout fr btn btn-large btn-buy"
							style="background-color: #f38256;">
							<font><a href="${foritou}/company/pay/confirm.jsp" style="color: white;">订单确认</a></font>
							
						</button>
							<button type="button" title="" class="continue fr">
							<font><a href="${foritou}/company/index.jsp" style="color: #666">继续选购</a>
							</font>
						</button>
						
						
						
						<button type="button" title="" class="sorderClear fr">
							<font><font><a href="" style="color: #6A6464;">清空购物车</a></font>
							</font>
						</button>
					
            </div>
            
        </div>
    </form>
    
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
