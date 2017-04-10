<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>
  <head>
 
  
<%@ include file="/public/head.jspf" %>

<script type="text/javascript" src="../js/jquery-1.7.2.js"></script>
<script type="text/javascript" src="../js/jquery.validate.js"></script>
<script type="text/javascript" src="${foritou }/js/function.js"></script>
<script type="text/javascript" src="${foritou }/js/validate.js"></script>  
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
					});
				function check_null(){
	
						var theForm=document.Form1;
					    
						 
					    if(Trim(theForm.province.value)=="")
						{
							alert("省份不能为空");
							theForm.province.focus();
							return false;
						}
					if(Trim(theForm.city.value)=="")
						{
							alert("城市不能为空");
							theForm.city.focus();
							return false;
						}
					 	
					if(Trim(theForm.interpassword.value)=="")
						{
							alert("公司邀请码不能为空");
							theForm.interpassword.focus();
							return false;
						}				
					    if(checkNull(theForm.phone)){
					    	 if(!(/^1[34578]\d{9}$/.test(theForm.phone.value))){ 
					 	        alert("电话号码有误，请重填");  
					 	        return false; 
					 	    } 
						}
						
					   if(checkNull(theForm.email))	{
					     if(!checkEmail(theForm.email.value))
						 {
							alert("请输入正确的EMail");
							theForm.email.focus();
							return false;
						 }
					   }
										   /**
					   * 处理当前用户是否修改了密码。利用md5flag进行判断
					     * 如果当前用户修改了密码，则保存运行时，需要对密码进行加密，然后保存加密后的密码
					       * 设置md5flag ==null
					     * 如果当前用户没有修改密码，则保存运行时，不需要对密码进行加密，直接保存当前密码即可
					       * 设置md5flag == 1
					   */
					   var password = document.getElementById("password").value;
					   var defaultpassword = document.getElementById("password").defaultValue;
					   if(password == defaultpassword){
						   document.getElementById("md5flag").value="1";
					   }else{
					      document.getElementById("md5flag").value="0";
					   }
					   theForm.action = "<%=request.getContextPath()%>/company_update.action";
					   theForm.submit();
					   return true;
					 
					}
					
			
			</script>
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
  
			
			
			
			
			
			body{
	margin:0px;
	background:#e7e7e7;
	font-family: "Open Sans", Arial, "Hiragino Sans GB", "Microsoft YaHei", 微软雅黑, STHeiti, "WenQuanYi Micro Hei", SimSun, sans-serif;
	font-size:14px;
}
.navbar{
	height:60px;
	background:#f8f8f8;
	width:50%;
	border-color:#e7e7e7;
}
.navbar-default{
	margin-left:150px;
    width:580px;
}
.navbar-head {
    padding-left: 10px;
    margin-left: 10px;
    border-left: 1px solid #ccc; 
    color: #777;
    display: block;
    overflow: hidden;
	font-size:18px;
	line-height:30px;
	height：30px;
	margin-top:-50px;
	margin-left:90px;
}
.r_box{
	width:880px;
	height:auto;
	background-color:#fff;
	margin:auto;
	border: 1px solid #dedede;
	margin-left:150px;
	margin-top:20px;
}
.image{
	padding:30px;
	text-align:center;
}
form{
	margin-top:40px;
	margin-left:200px;
	width:750px;
	
}
.form-group{
margin-bottom: 50px;
}
.form-control1 {
    width: 250px;
    height: 30px;
    padding: 6px 12px;
    font-size: 14px;
    line-height: 1.42857143;
    color: #555;
    background-color: #fff;
    background-image: none;
    border: 1px solid #ccc;
    border-radius: 4px;
    margin-left: 30px;
  
}
.form-control2{
    width: 250px;
    height: 30px;
    padding: 6px 12px;
    font-size: 14px;
    line-height: 1.42857143;
    color: #555;
    background-color: #fff;
    background-image: none;
    border: 1px solid #ccc;
    border-radius: 4px;
    margin-left: 68px;
  }
  .form-control5{
    width: 250px;
    height: 30px;
    padding: 6px 12px;
    font-size: 14px;
    line-height: 1.42857143;
    color: #555;
    background-color: #fff;
    background-image: none;
    border: 1px solid #ccc;
    border-radius: 4px;
    margin-left: 68px;
  }
  .form-control3 {
    width: 250px;
    height: 30px;
    padding: 6px 12px;
    font-size: 14px;
    line-height: 1.42857143;
    color: #555;
    background-color: #fff;
    background-image: none;
    border: 1px solid #ccc;
    border-radius: 4px;
    margin-left: 55px;
  }
  .form-control4 {
    width: 250px;
    height: 30px;
    padding: 6px 12px;
    font-size: 14px;
    line-height: 1.42857143;
    color: #555;
    background-color: #fff;
    background-image: none;
    border: 1px solid #ccc;
    border-radius: 4px;
    margin-left: 96px;
  }
  #province{
  	width:250px;
	height:30px;
	border: 1px solid #ccc;
    border-radius: 4px;


	color: #777;
    
	padding-left:80px;
	margin-left: 82px;
  
  }
  #city{
  	width:250px;
	height:30px;
	border: 1px solid #ccc;
    border-radius: 4px;


	color: #777;
    
	padding-left:80px;
	margin-left: 137px;
  }
  #industry{
    	width:250px;
	height:30px;
	border: 1px solid #ccc;
    border-radius: 4px;


	color: #777;
    
	padding-left:80px;
	margin-left: 68px;
  }

.dd-input-remind{
	color: #555;
    margin-top:5px;
	margin-left:136px;
	font-size:12px;
}
.form-group .sub{
	margin-left:120px;
    width:100px;
	height:34px;
	border-radius: 4px;
	border: 1px solid #ff6537;
	background:#FF6537;
	color:#fff;
	font-weight:600;
	font-size:16px;
}	
			
			
			</style>
			
			
			
  </head>
  
  <body onUnload="javascrip:reshow();">
  
  <div class="r_box">
        
      	<form method="post" name="Form1" id="enroll2Form" <%--action="${foritou}/company_update.action" --%> onsubmit="return check_null()">
            
             
            <div class="form-group">
            <span style="color:red;">*</span>
            <span>企业(团队)名称</span>
            <span><input type="text" name="companyname" class="form-control1" value="${company.companyname }" readonly="true" /></span>
            </div>
             <div class="form-group">
             <span style="color:red;">*</span>
            <span>所在地</span>
            <span>
            <select id="province" onchange="findCity()" name="province">
            <option value="${ company.province}">${company.province }</option>
            
            </select>
             </span>
             <span>     
             <select id="city" name="city" >
              <option value="${company.city }">${company.city }</option>
             
             </select>
             </span>

            </div>
             <div class="form-group">
             <span style="color:red;">*</span>
             <span>行业类型</span>
            <span>
            <select id="industry"  name="type">
						   <option value="${company.companytype.id }">${company.companytype.name }</option> <optgroup label="热门行业"> <option value="204">互联网</option> <option value="205">电子商务</option> <option value="603">服装/纺织</option><option value="902">批发/零售</option>
                         	<option value="101">教育</option> 
                         	<option value="1109">农/林/牧/渔</option>
                         	<option value="1201">家庭</option></optgroup> <optgroup label="IT互联网行业"> <option value="201">计算机软件</option> <option value="202">计算机硬件</option> <option value="203">IT服务</option> <option value="204">互联网</option> <option value="205">电子商务</option> <option value="206">游戏</option> <option value="207">通信</option> <option value="208">电子/半导体</option></optgroup> <optgroup label="制造行业"> <option value="601">日用/化妆品</option> <option value="602">食品/饮料</option> <option value="603">服装/纺织</option> <option value="604">家电/数码</option> <option value="605">奢侈品/珠宝</option> <option value="606">酒品</option> <option value="607">烟草业</option> <option value="608">办公/工艺品</option> <option value="609">医药品</option> <option value="610">家具</option> <option value="611">化学原料</option> <option value="612">金属类</option> <option value="613">汽车/交通类</option> <option value="614">通信/计算机</option></optgroup> <optgroup label="贸易/物流"> <option value="901">进出口</option> <option value="902">批发/零售</option> <option value="903">商店/超市</option> <option value="904">物流/仓储</option> <option value="905">交通运输</option></optgroup> <optgroup label="建筑/房地产"> <option value="801">建筑设计</option> <option value="802">土木工程</option> <option value="803">房地产</option> <option value="804">物业管理</option> <option value="805">建材</option> <option value="806">装修装潢</option></optgroup> <optgroup label="金融行业"> <option value="301">银行</option> <option value="302">保险</option> <option value="303">证券/基金等</option> <option value="304">投资</option></optgroup> <optgroup label="服务业"> <option value="1001">酒店</option> <option value="1008">餐饮(单门店)</option> <option value="1009">餐饮(多门店)</option> <option value="1003">旅游</option> <option value="1004">休闲娱乐健身</option> <option value="1005">家政服务</option> <option value="1006">中介</option> <option value="1007">网吧</option></optgroup> <optgroup label="政府/事业单位"> <option value="101">教育</option> <option value="102">医院</option> <option value="103">民政</option> <option value="104">公安</option> <option value="105">交通</option> <option value="106">司法</option> <option value="107">市政</option> <option value="108">工商</option> <option value="109">公共事业</option> <option value="110">研究所/院</option> <option value="111">税务</option></optgroup> <optgroup label="教育培训行业"> <option value="501">高等教育</option> <option value="502">初中等教育</option> <option value="503">培训</option> <option value="504">驾校</option></optgroup> <optgroup label="文化传媒行业"> <option value="701">广告/公关</option> <option value="702">报纸/杂志</option> <option value="703">广播</option> <option value="704">影视</option> <option value="705">出版</option> <option value="706">艺术/工艺</option> <option value="707">体育</option> <option value="708">动漫</option></optgroup> <optgroup label="企业服务"> <option value="401">会计/审计</option> <option value="402">人力资源</option> <option value="403">管理咨询</option> <option value="404">法律</option> <option value="405">检测/认证</option> <option value="406">翻译</option></optgroup> <optgroup label="亲朋好友"> <option value="1201">家庭</option> <option value="1202">同学</option> <option value="1203">朋友</option></optgroup> <optgroup label="其他组织"> <option value="1102">公益</option> <option value="1103">协会</option> <option value="1104">宗教</option> <option value="1112">学生会</option> <option value="1106">医疗</option> <option value="1107">环境</option> <option value="1108">租赁服务</option> <option value="1109">农/林/牧/渔</option> <option value="1110">能源</option> <option value="1111">金属/非金属</option> <option value="9999">自定义</option></optgroup>
						
            </select></span> 
            </div>
             
             <div class="form-group">
            <span style="color:red;">*</span>
            <span>内部邀请码</span>
            <span><input type="text" name="interpassword" class="form-control4" value="${company.interpassword }"/></span>
            </div>
             <div class="form-group">
            <span style="color:red;">*</span>
            <span>联系电话</span>
            <span><input type="text" name="phone" class="form-control3" value="${company.phone }"/></span>
            
            </div>
            <div class="form-group">
            <span style="color:red;">*</span>
            <span>邮箱</span>
            <span><input type="text" name="email" class="form-control4" value="${company.email }"/></span>
            </div>
            <div class="form-group">
            <span style="color:red;">*</span>
            <span>密码</span>
            <span><input type="password" name="password" id="password" class="form-control4" value="${company.password }"/></span>
            </div>
            <div class="form-group">
            <span>
             <input  class="sub" type="submit" style="margin-left: 18px" value="保存"/>
             <input  class="sub" type="button" style="margin-left: 18px" value="取消" onclick="window.close()"/>
            </span>
            </div>
            <input name="id"  type="hidden" value="${company.id }" >
            <input name="contactname"  type="hidden" value="${company.contactname}" >
            <input name="enrolltime"  type="hidden" value="${company.enrolltime}" >
     
	  <input name="backup3"  type="hidden" value="${company.backup3}" >
	    <input name="inviteid"  type="hidden" value="${company.inviteid}" >
	       <input name="enumber"  type="hidden" value="${company.enumber}" >
	       <input name="md5flag" id="md5flag" type="hidden" >
	    <%--  <input name="money"  type="hidden" value="${company.money}" > --%>
	  
         </form>
         </div>
