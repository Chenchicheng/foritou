<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
 
  
<%@ include file="/public/head.jspf" %>

<script type="text/javascript" src="js/jquery-1.7.2.js"></script>
<script type="text/javascript" src="js/jquery.validate.js"></script>
   <script type="text/javascript"> 
   

				function findCity() {
					var pid = $("#province").val();
					$("#city").empty(); //清空城市列表
					for ( var i = 0; i < prolist.ps.length; i++) {
						if (prolist.ps[i].pid == pid) {
							for ( var j = 0; j < prolist.ps[i].citys.length; j++) {
								$("#city").append(
										"<option value='"+prolist.ps[i].citys[j].cid+"'>"
												+ prolist.ps[i].citys[j].cname
												+ "</option>");
							}
						}
					}
				}
				$(function() {

					//$("#province").empty();
					for ( var i = 0; i < prolist.ps.length; i++) {
						$("#province").append(
								"<option value='"+prolist.ps[i].pid+"'>"
										+ prolist.ps[i].pname + "</option>");
					}
					//让当前表单调用validate方法，实现表单验证功能

					$("#enroll2Form").validate({
						//	debug : true,//调试模式，即使验证成功，也不会跳转到目标页面
						rules : { //配置验证规则；key就是验证的dom对象，value:调用的验证方法是json格式
							companyname : {
								required : true
							//验证方法不需要参数，则配置为true
							},
							province : {
								required : true,
							//	rangelength : [ 6, 12 ]//设定长度
							},
						    city : {
								required : true,
							//	rangelength : [ 6, 12 ]//设定长度
							},
							type : {
								required : true,
							//equalTo:'#spass'
							},
							password : {

								required : true
							},
							contactname : {
								required : true
							},
							email : {
								email : true
							}
						},
						messages : {
							companyname : {
								required : "公司名称不能为空！"
							//验证方法不需要参数，则配置为true
							},
							province : {
								required : "请选择省份！",

							},
							city : {
								required : "请选择城市！",

							},
							type : {
								required : "公司类型不能为空！",
							},
							password : {
								required : "密码不能为空！"
							},
							contactname : {
								required : "联系人姓名不能为空！"
							},

							email : {

								email : "邮箱格式不正确！"

							},
						}

					});

				})
			</script>
  </head>
  
  <body>
  第二部
		<form method="post" id="enroll2Form" action="${foritou}/company_enroll.action">
					<div>
						<label for="companyname">公司名称:&nbsp;</label> 
						<input type="text" name="companyname" id=""/>
					</div>
					<div>
						<label for="address">公司所在地:&nbsp;</label> 
							<select id="province" onchange="findCity()" name="province">
                             <option value="">----选择省份----</option>
                            </select>
                         <select id="city" name="city" >
                          <option value="">----选择城市----</option>
                        </select>
					</div>
				    <div>
						<label for="type">公司类型:&nbsp;</label> 
						<select id="industry" class="" name="type">
						    <option value="">请选择行业类型</option> <optgroup label="热门行业"> <option value="204">互联网</option> <option value="205">电子商务</option> <option value="603">服装/纺织</option><option value="902">批发/零售</option>
                         	<option value="101">教育</option> 
                         	<option value="1109">农/林/牧/渔</option>
                         	<option value="1201">家庭</option></optgroup> <optgroup label="IT互联网行业"> <option value="201">计算机软件</option> <option value="202">计算机硬件</option> <option value="203">IT服务</option> <option value="204">互联网</option> <option value="205">电子商务</option> <option value="206">游戏</option> <option value="207">通信</option> <option value="208">电子/半导体</option></optgroup> <optgroup label="制造行业"> <option value="601">日用/化妆品</option> <option value="602">食品/饮料</option> <option value="603">服装/纺织</option> <option value="604">家电/数码</option> <option value="605">奢侈品/珠宝</option> <option value="606">酒品</option> <option value="607">烟草业</option> <option value="608">办公/工艺品</option> <option value="609">医药品</option> <option value="610">家具</option> <option value="611">化学原料</option> <option value="612">金属类</option> <option value="613">汽车/交通类</option> <option value="614">通信/计算机</option></optgroup> <optgroup label="贸易/物流"> <option value="901">进出口</option> <option value="902">批发/零售</option> <option value="903">商店/超市</option> <option value="904">物流/仓储</option> <option value="905">交通运输</option></optgroup> <optgroup label="建筑/房地产"> <option value="801">建筑设计</option> <option value="802">土木工程</option> <option value="803">房地产</option> <option value="804">物业管理</option> <option value="805">建材</option> <option value="806">装修装潢</option></optgroup> <optgroup label="金融行业"> <option value="301">银行</option> <option value="302">保险</option> <option value="303">证券/基金等</option> <option value="304">投资</option></optgroup> <optgroup label="服务业"> <option value="1001">酒店</option> <option value="1008">餐饮(单门店)</option> <option value="1009">餐饮(多门店)</option> <option value="1003">旅游</option> <option value="1004">休闲娱乐健身</option> <option value="1005">家政服务</option> <option value="1006">中介</option> <option value="1007">网吧</option></optgroup> <optgroup label="政府/事业单位"> <option value="101">教育</option> <option value="102">医院</option> <option value="103">民政</option> <option value="104">公安</option> <option value="105">交通</option> <option value="106">司法</option> <option value="107">市政</option> <option value="108">工商</option> <option value="109">公共事业</option> <option value="110">研究所/院</option> <option value="111">税务</option></optgroup> <optgroup label="教育培训行业"> <option value="501">高等教育</option> <option value="502">初中等教育</option> <option value="503">培训</option> <option value="504">驾校</option></optgroup> <optgroup label="文化传媒行业"> <option value="701">广告/公关</option> <option value="702">报纸/杂志</option> <option value="703">广播</option> <option value="704">影视</option> <option value="705">出版</option> <option value="706">艺术/工艺</option> <option value="707">体育</option> <option value="708">动漫</option></optgroup> <optgroup label="企业服务"> <option value="401">会计/审计</option> <option value="402">人力资源</option> <option value="403">管理咨询</option> <option value="404">法律</option> <option value="405">检测/认证</option> <option value="406">翻译</option></optgroup> <optgroup label="亲朋好友"> <option value="1201">家庭</option> <option value="1202">同学</option> <option value="1203">朋友</option></optgroup> <optgroup label="其他组织"> <option value="1102">公益</option> <option value="1103">协会</option> <option value="1104">宗教</option> <option value="1112">学生会</option> <option value="1106">医疗</option> <option value="1107">环境</option> <option value="1108">租赁服务</option> <option value="1109">农/林/牧/渔</option> <option value="1110">能源</option> <option value="1111">金属/非金属</option> <option value="9999">自定义</option></optgroup>
						</select>
					</div>
					<div>
						<label for="password">密码:&nbsp;</label> 
						<input type="text" name="password" id=""/>
					</div>
					
					<div>
						<label for="contactname">联系人姓名:&nbsp;</label> 
						<input type="text" name="contactname" id=""/>
					</div>
					
						<div>
						<label for="email">邮箱:&nbsp;</label> 
						<input type="text" name="email" id=""/>
					</div>
					
						<div>
						<label for="invitecode">邀请码:&nbsp;</label> 
						<input type="text" name="invitecode" id=""/>
					</div>
					<div>
						${sessionScope.error}  
					</div>
					<div>
						<input type="submit" value="下一步" style="width:60px;height:30px" />	
					</div>
			   </form>
  </body>
</html>
