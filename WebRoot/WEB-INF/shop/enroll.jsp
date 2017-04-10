<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>

  
<%@ include file="/public/head.jspf" %>
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
   vertical-align: top;
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
</style>
   
  </head>
  
 
  
 <div id="head">
 <h1 class="content-title">福利淘商家营销平台</h1>
 </div>
 <div id="middle">
 <div id="middle-left">
 <h3 style="padding:15px;margin:0px;background:#E7E7E7;">提供商家信息</h3>
 <div id="middle-left-bottom">
 <form method="post" action="${foritou}/shop_enroll.action">
					<div class="field-group">
						<label for="name" class="field-item"><em style="color: #D00;font-weight: 500;">*</em>您的姓名&nbsp;</label> 
						<input type="text" name="name" class="f-text"/>
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
						<label for="other" class="field-item"><em style="color: #D00;font-weight: 500;">*</em>商家类型</label> 
						<!--  <input type="text" name="other" class="f-text"/>-->
						<select id="industry" class="" name="type" style="margin-left:20px;">
						    <option value=""><em style="color: #D00;font-weight: 500;">*</em>请选择行业类型</option> <optgroup label="热门行业"> <option value="204">互联网</option> <option value="205">电子商务</option> <option value="603">服装/纺织</option><option value="902">批发/零售</option>
                         	<option value="101">教育</option> 
                         	<option value="1109">农/林/牧/渔</option>
                         	<option value="1201">家庭</option></optgroup> <optgroup label="IT互联网行业"> <option value="201">计算机软件</option> <option value="202">计算机硬件</option> <option value="203">IT服务</option> <option value="204">互联网</option> <option value="205">电子商务</option> <option value="206">游戏</option> <option value="207">通信</option> <option value="208">电子/半导体</option></optgroup> <optgroup label="制造行业"> <option value="601">日用/化妆品</option> <option value="602">食品/饮料</option> <option value="603">服装/纺织</option> <option value="604">家电/数码</option> <option value="605">奢侈品/珠宝</option> <option value="606">酒品</option> <option value="607">烟草业</option> <option value="608">办公/工艺品</option> <option value="609">医药品</option> <option value="610">家具</option> <option value="611">化学原料</option> <option value="612">金属类</option> <option value="613">汽车/交通类</option> <option value="614">通信/计算机</option></optgroup> <optgroup label="贸易/物流"> <option value="901">进出口</option> <option value="902">批发/零售</option> <option value="903">商店/超市</option> <option value="904">物流/仓储</option> <option value="905">交通运输</option></optgroup> <optgroup label="建筑/房地产"> <option value="801">建筑设计</option> <option value="802">土木工程</option> <option value="803">房地产</option> <option value="804">物业管理</option> <option value="805">建材</option> <option value="806">装修装潢</option></optgroup> <optgroup label="金融行业"> <option value="301">银行</option> <option value="302">保险</option> <option value="303">证券/基金等</option> <option value="304">投资</option></optgroup> <optgroup label="服务业"> <option value="1001">酒店</option> <option value="1008">餐饮(单门店)</option> <option value="1009">餐饮(多门店)</option> <option value="1003">旅游</option> <option value="1004">休闲娱乐健身</option> <option value="1005">家政服务</option> <option value="1006">中介</option> <option value="1007">网吧</option></optgroup> <optgroup label="政府/事业单位"> <option value="101">教育</option> <option value="102">医院</option> <option value="103">民政</option> <option value="104">公安</option> <option value="105">交通</option> <option value="106">司法</option> <option value="107">市政</option> <option value="108">工商</option> <option value="109">公共事业</option> <option value="110">研究所/院</option> <option value="111">税务</option></optgroup> <optgroup label="教育培训行业"> <option value="501">高等教育</option> <option value="502">初中等教育</option> <option value="503">培训</option> <option value="504">驾校</option></optgroup> <optgroup label="文化传媒行业"> <option value="701">广告/公关</option> <option value="702">报纸/杂志</option> <option value="703">广播</option> <option value="704">影视</option> <option value="705">出版</option> <option value="706">艺术/工艺</option> <option value="707">体育</option> <option value="708">动漫</option></optgroup> <optgroup label="企业服务"> <option value="401">会计/审计</option> <option value="402">人力资源</option> <option value="403">管理咨询</option> <option value="404">法律</option> <option value="405">检测/认证</option> <option value="406">翻译</option></optgroup> <optgroup label="亲朋好友"> <option value="1201">家庭</option> <option value="1202">同学</option> <option value="1203">朋友</option></optgroup> <optgroup label="其他组织"> <option value="1102">公益</option> <option value="1103">协会</option> <option value="1104">宗教</option> <option value="1112">学生会</option> <option value="1106">医疗</option> <option value="1107">环境</option> <option value="1108">租赁服务</option> <option value="1109">农/林/牧/渔</option> <option value="1110">能源</option> <option value="1111">金属/非金属</option> <option value="9999">自定义</option></optgroup>
						</select>
					</div>
				    <div class="field-group">
						<label for="zhizhao" class="field-item"><em style="color: #D00;font-weight: 500;">*</em>是否有营业执照</label> 
	                    <input type="radio" name="zhizhao"  value=1 style="margin-left:20px;"/>是  &nbsp;&nbsp;
	                    <input type="radio" name="zhizhao" value=0/>否 
					</div>
					    <div class="field-group">
						<label for="city" class="field-item"><em style="color: #D00;font-weight: 500;">*</em>城市</label> 
						<input type="text" name="city" style=" border:1px solid cornflowerblue; height: 30px;width:100px; margin-left:20px;"/>
						<label for="area"><em style="color: #D00;font-weight: 500;">*</em>区域</label> 
						<input type="text" name="area" style=" border:1px solid cornflowerblue; height: 30px;width:100px; margin-left:5px;" />
						<label for="shangquan"><em style="color: #D00;font-weight: 500;">*</em>商圈</label> 
						<input type="text" name="shangquan" style=" border:1px solid cornflowerblue; height: 30px;width:100px; margin-left:5px;" />
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
						<textarea type="text" name="describle" ></textarea>
						<div id="warn">
						<span>*请简单介绍一下店铺信息和您想合作的大概内容，没有格式要求，简单清楚即可，便于工作人员能快速审核。 具体的合作事项还是需要等业务员跟您当面沟通。</span>
						</div>
					</div>
					<div class="field-group">
						<label for="address" class="field-item"><em style="color: #D00;font-weight: 500;">*</em>详细地址</label> 
						<textarea type="text" name="address" ></textarea>
					</div>
					<div class="field-group">
						<label for="addressmap" class="field-item"><em style="color: #D00;font-weight: 500;">*</em>在地图上标注</label> 
						<input type="text" name="addressmap" class="f-text"/>
					</div>

					<div class="field-group">
						<label for="telephone" class="field-item"><em style="color: #D00;font-weight: 500;">*</em>门店电话</label> 
						<input type="text" name="telephone" class="f-text"/>
						<div id="warn">
						<span>*请填写门店预约或者前台电话。如果没有，可以填写一个消费者能联系的电话</span>
						</div>
                    </div>
					<div>
						<label for="addressmap">在地图上标注:</label> 
				

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
