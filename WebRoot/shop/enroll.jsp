<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
  
<%@ include file="/public/head.jspf" %>
  <style type="text/css">
  
  
 
form div sub{
color:red;
 background-image: url("../image/error.png"); 
background-repeat: no-repeat;
padding-left: 20px;
font-size: 20px;
} 
  .ok{
background-image: url("../image/right.png");
background-repeat: no-repeat;
}
  
  
  
  </style>
<script type="text/javascript" src="../js/jquery-1.7.2.js"></script>
<script type="text/javascript" src="../js/jquery.validate.js"></script>
  
  
  
  <script type="text/javascript">
  $(function() {
   $.validator.addMethod("phone",function(value,element,param){
 //三个参数：value：被验证的值，element：当前验证的dom对象，param:参数，如果有多个，则是数组
 //alert(value+","+$(element).val()+","+param[0]+","+param[1]);
return  new RegExp(/^1[3586]\d{9}$/).test(value);
 },"手机号码不正确");
  
  
					//让当前表单调用validate方法，实现表单验证功能

					$("#shopFF").validate({
					
						//debug : true,//调试模式，即使验证成功，也不会跳转到目标页面
						onkeyup:true,//当丢失焦点的时候才出发验证请求
						
						errorElement:"sub",
					     success:"ok" ,
				  /*     errorPlacement:function(error,){//定义错误消息存储位置
					    $(".valid").parent().next().html(error);
					    },    */
						rules : { //配置验证规则；key就是验证的dom对象，value:调用的验证方法是json格式
							contactname: {
								required : true
							//验证方法不需要参数，则配置为true
							},
							phone : {
								required : true,
							//	rangelength : [ 6, 12 ]//设定长度
							},
						    email : {
						      required : true,
								email : true,
							//	rangelength : [ 6, 12 ]//设定长度
							},
							'shoptype.id': {
								required : true,
							//equalTo:'#spass'
							},
							zhizhao : {

								required : true
							},
							city: {
								required : true
							},
							area : {
								required : true
							},
							shangquan: {
								required : true
							},
								name: {
								required : true
							},
								describle: {
								required : true
							},
								address: {
								required : true
							},
								addressmap: {
								required : true
							},
								telephone: {
								required : true
							}
						},
						messages : {
							contactname: {
								required : "请填写联系人名称！"
							//验证方法不需要参数，则配置为true
							},
							phone: {
								required : "请填写联系人手机号码",

							},
							email : {
							required : "请填写邮箱！",
							  email:"邮箱格式不正确！"

							},
							'shoptype.id' : {
								required : "请选择商家类型！",
							},
							zhizhao : {
								required : "请选择是否有营业执照！"
							},
							city: {
								required : "请填写商家所在的城市！"
							},

							area : {

						        required : "请填写商家所在的地区！"

							},
							shangquan : {
								required : "请填写商家所在的商区！"
							},
							
								name: {
								required : "请填写商家名称！"
							},
							
								describle: {
								required : "请填写商家描述信息！"
							},
							
								address: {
								required : "请填写商家具体地址！"
							},
							addressmap:{
							required : "请在地图上标注商家位置！"
							},
								telephone: {
								required : "请填写商家的门店电话！"
							},
						}

					});

				});
			</script>

<style type="text/css">
body{
margin:0px;
background:#f9f9f9;
}
#head{
  background:#FF8C00;
  height:65px;
  
}
.content-title{
  color:white;
  padding-top:15px;
  margin-left:150px;
  
  font-weight:bold;
}
#middle{
 width:1200px;
}
#middle-left{
  width:715px;
 background:white;
  margin-left:150px;
  margin-top:10px;
  border: 1px solid #d4d4d4;
  float:left;
}
#middle-right{
  width:250px;
 background:white;
 float:left;
  margin-top:10px;
  margin-left:15px;
  padding-right:20px;
}
#middle-right ol{
font-size: 12px;
 color: #666;
 margin-bottom: 12px;
}
#middle-right li{
   list-style: none;
    margin-left: 1px;
    line-height: 21px;
    
}
#inner-blk{
 padding-bottom: 20px 0;
  border-bottom: 1px solid #f0f0f0;
}
.field-group{
    padding: 5px 0 20px 100px;
    margin: 0 auto 8px 0;
    zoom: 1;
    position: relative;
}
.field-item{
    position: absolute;
    width: 110px;
    left: 0;
    font-size: 14px;
    text-align: right;
    color: #333;
    padding-top: 4px;
   
}
lable{
   display: block;
   margin-bottom: 5px;
}
.f-text{
  height: 30px;
   padding: 5px;
   line-height: 20px;
   vertical-align: middle;
   margin-left:20px;
   border:1px solid cornflowerblue;
}
#middle-left-bottom{
  margin-top:30px;
  margin-left:20px;
}
p{
margin: 0 0 10px;
}
#warn{
  color:#D00;
  margin-top:10px;
  font-size:12px;
}
textarea{
height:60px;
width:250px;
margin-left:20px;
border:1px solid cornflowerblue;

}
.Select{
width:180px;
height: 30px;
 border:1px solid cornflowerblue;
    margin-left:20px;
}
#zuobiao{
margin-left: 20px;
}
</style>
   
  </head>
  
 
  
 <div id="head">
 <h1 class="content-title">福利淘商家营销平台</h1>
 </div>
 <div id="middle">
 <div id="middle-left">
 <h3 style="padding:15px;margin:0px;background:#E7E7E7;">提供商家信息</h3>
 <div id="middle-left-bottom">
 <form method="post" id="shopFF" action="${foritou}/shop_enroll.action">
					<div class="field-group">
						<label for="contactname" class="field-item"><em style="color: #D00;font-weight: 500;">*</em>您的姓名&nbsp;</label> 
						<input type="text" name="contactname" class="f-text"/>
					</div>
					<div class="field-group">
						<label for="phone" class="field-item" > <em style="color: #D00;font-weight: 500;">*</em>手&nbsp;&nbsp;机</label> 
						<input type="text" name="phone" class="f-text"/>
					</div>
					<div class="field-group">
						<label for="email" class="field-item"><em style="color: #D00;font-weight: 500;">*</em>邮&nbsp;&nbsp;箱</label> 
						<input type="text" name="email"class="f-text" placeholder="XXX@qq.com" />
					</div>
						<div class="field-group">
						<label for="other" class="field-item"><em style="color: #D00;font-weight: 500;">*</em>其他联系方式</label> 
						<input type="text" name="other" class="f-text" placeholder="例如QQ号"/>
					</div>
				<hr style="border: 1px dashed #ccc;">
						<div  class="field-group">
						<label for="shoptype.id" class="field-item"><em style="color: #D00;font-weight: 500;">*</em>商家类型</label> 
						<!--  <input type="text" name="other" class="f-text"/>-->
						<select id="industry" class="Select" name="shoptype.id">
						  <c:forEach items="${applicationScope.stlist}" var="st" >
						  <option value="" >-----请选择商家类型-----</option>
                          <option value="${st.id}" >${st.typename}</option>
                          </c:forEach>
						
						</select>
					</div>
				    <div class="field-group">
						<label for="zhizhao" class="field-item"><em style="color: #D00;font-weight: 500;">*</em>是否有营业执照</label> 
	                    <input type="radio" name="zhizhao"  value=1  style="margin-left: 20px;"/>是  &nbsp;&nbsp;
	                    <input type="radio" name="zhizhao" value=0/>否 
					</div>
					  				
					    <div class="field-group">
						<label for="city" class="field-item"><em style="color: #D00;font-weight: 500;">*</em>城市</label> 
						<input type="text" name="city" style=" border:1px solid cornflowerblue; height: 30px;width:180px; margin-left:20px;"/>
						</div>
						 <div class="field-group">
						<label for="area" class="field-item"><em style="color: #D00;font-weight: 500;">*</em>区域</label> 
						<input type="text" name="area" style=" border:1px solid cornflowerblue; height: 30px;width:180px; margin-left:20px;" />
						</div>
						 <div class="field-group">
						<label for="shangquan" class="field-item"><em style="color: #D00;font-weight: 500;">*</em>商圈</label> 
						<input type="text" name="shangquan" style=" border:1px solid cornflowerblue; height: 30px;width:180px; margin-left:20px;" />
					    </div>
						
						
						
						
						
						
						<div class="field-group">
						<label for="name" class="field-item"><em style="color: #D00;font-weight: 500;">*</em>商家名称</label> 
						<input type="text" name="name"  class="f-text"/>
						<div id="warn">
						<span>*请填写您店面的门头名称，如果有多分店的可以写上分店名称</span>
						</div>
					</div>
				     <div class="field-group">
						<label for="describle" class="field-item"><em style="color: #D00;font-weight: 500;">*</em>商家描述</label> 
						<textarea  name="describle"></textarea>
						<div id="warn">
						<span>*请简单介绍一下店铺信息和您想合作的大概内容，没有格式要求，简单清楚即可，便于工作人员能快速审核。 具体的合作事项还是需要等业务员跟您当面沟通。</span>
						</div>
					</div>
					<div class="field-group">
						<label for="address" class="field-item"><em style="color: #D00;font-weight: 500;">*</em>详细地址</label> 
						<textarea  name="address" ></textarea>
					</div>
					<div class="field-group">
					
					<label for="address" class="field-item"><em style="color: #D00;font-weight: 500;">*</em>在地图上标注</label> 
					
					<div id="map" style="height:300px;width:400px;margin-left: 20px;"></div>
			         	<script type="text/javascript">ShowMap("map",{city:'南昌',addr:'江西师范大学瑶湖校区',mapx:'',ismove:'1',piobj:'nxp'});</script>
                       <label id="zuobiao">坐标:</label><input id="nxp" type="text"  name="addressmap">	    
					</div>
							<div class="field-group">
						<label for="telephone" class="field-item"><em style="color: #D00;font-weight: 500;">*</em>门店电话</label> 
						<input type="text" name="telephone" class="f-text"/>
						<div id="warn">
						<span>*请填写门店预约或者前台电话。如果没有，可以填写一个消费者能联系的电话</span>
						</div>
					</div>
				
					<div style="margin-left:105px;margin-top:80px;">
						<input type="submit" value="提交" style="width:60px;height:30px;background:#FF8C00;" />
					
					</div>
			   </form>
			   </div>
 </div>
 <div id="middle-right">
 <h3 style="padding:15px;">合作流程</h3>
 <div id="inner-blk">
 <ol>
 <li>第1步：商家提交信息</li>
 <li>第2步：福利淘资质审核（3个工作日）</li>
 <li>第3步：福利淘和商家电话沟通</li>
 <li>第4步：福利淘上门洽谈</li>
<hr style="border: 1px dashed #ccc;margin-top:30px;">
 </ol>
 <h3 style="padding:15px;">常见问题</h3>
 <ol>
 <li>
 <h5>1.与福利淘合作需要收费吗？</h5>
 <p>不同合作项目及地区标准会有差异，具体合作费用及结算问题在资质审核后，当地业务员会与您洽谈。</p>
 </li>
 <li>
 <h5>2. 提交团购信息后多长时间会给予回复？</h5>
 <p>合作信息提交后会在3个工作日内进行审核。如果您的项目符合福利淘合作要求，当地业务员会在3个工作日内与您洽谈合作；如果您的项目不符合美团合作要求，则福利淘暂时对您的项目没有合作意向，请您谅解，同时也会短信和邮件通知您，建议您提交信息时相关联系方式尽量保证齐全。</p>
 </li>
 <li>
 <h5>4. 与福利淘的合作项目主要是哪些品类？</h5>
 <p >目前合作品类主要是休闲娱乐、丽人美容、餐饮美食、健康保健、运动健身、电商网站等。</p>
 <p >家具电器、数码、医药、烟酒、成人用品等项目暂时没有合作需求。</p>
 </li>
 </ol>
 </div>
 </div>
 </div>
 <div id="bottom">
 </div>
  

  </body>
</html>
