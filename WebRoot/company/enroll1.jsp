<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>
  <head>
<%@ include file="/public/head.jspf" %>
<script type="text/javascript" src="${foritou }/js/jquery-1.7.2.js"></script>
<script type="text/javascript" src="${foritou }/js/jquery.validate.js"></script>
<script src="${foritou}/js/drag.js" type="text/javascript"></script>
 <link href="${foritou}/css/drag.css" rel="stylesheet" type="text/css">
   <link href="css/resg.css" rel="stylesheet" type="text/css">
 
  <style type="text/css">
 #drag .drag_text {
    position: absolute;
    top: 0px;
    width: 250px;
    } 
     #drag{
     width:250px;
     }
  form a sub{
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
 
.navbar{
	height:60px;
	background:#f8f8f8;
	width:100%;
	border-color:#e7e7e7;
}
.navbar-default{
	margin-left:150px;
    width:1180px;
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

  </style>
  
  
   <script type="text/javascript">
  $(function(){
				$('#getCheckCode').click(function() {
						var cphone = $("#cphone").val();
					
						if (cphone != ""&&isMove==true&&$("#cphone-error").hasClass("ok")){
							$.post("company_getCheckCode.action",//发送请求
							{
								cphone : cphone,
							}, function(data) {//请求成功
								resetCode();//倒计时
							}, "json");
						}else{//在验证滑块后面加上“验证不通过”
						
						
						}
						return false;
					});

					
				$.validator.addMethod("phone", function(value, element,
							param) {
						//三个参数：value：被验证的值，element：当前验证的dom对象，param:参数，如果有多个，则是数组
						//alert(value+","+$(element).val()+","+param[0]+","+param[1]);
						return new RegExp(/^1[0-9]{10}$/).test(value);
					}, "您输入的手机号码不正确，请重新输入！");
					//让当前表单调用validate方法，实现表单验证功能
					
				$("#ff").validate({
						//debug : true,//调试模式，即使验证成功，也不会跳转到目标页面
						onkeyup : true,//当丢失焦点的时候才出发验证请求
						 errorElement:"sub",
					     success:"ok" ,
						
						rules : { //配置验证规则；key就是验证的dom对象，value:调用的验证方法是json格式
							cphone : {
								required : true,//验证方法不需要参数，则配置为true
								phone : [ 1, 2 ],
								remote : {
									url : 'company_checkPhone.action',//兼容IE
									type : "post"
								}

							},
							checkCode:{
							required : true,
							},
							

						},
						messages : {
							cphone : {
								required : "手机号码必填！",
								remote : "该手机号已注册！"

							//验证方法不需要参数，则配置为true
							},
							checkCode:{
							required : "请输入手机验证码！",
							}
						}

					});
				});
				
				function resetCode() {//倒计时
					$('#getCheckCode').hide();
					$('#countDown').html('60');
					$('#resetCountDown').show();
					var second = 60;
					var timer = null;
					timer = setInterval(function() {//设置定时器。每一秒钟数字减一
						second -= 1;
						if (second > 0) {
							$('#countDown').html(second);
						} else {
							clearInterval(timer);
							$('#getCheckCode').show();
							$('#resetCountDown').hide();
						}
					}, 1000);
				}
			</script>
  </head>
  
  <body>
  
  
  
  
  
 <div class="navbar">
    <div class="navbar-default">
        <a><img src="img/logo.png" width="80px" height="80px"style="margin-top:-15px;" />
       
        </a>
         <span class="navbar-head">福利淘企业注册</span>
    </div>
</div>
		<div id="resg-middle" >
			<div id="resg-middle-head">
				<img src="img/1.png" width="852" height="54" />
			</div>
			<div id="resg-middle-middle">
				<form action="company_enroll1.action" method="post" id="ff" > 
					<a>手机号码：</a><a style="padding-left: 45px;"><input type="text" class="name" name="cphone" id="cphone"/></a>
		<div id="drag" class="drag_style">
		
		</div>
	
                  <script type="text/javascript">
           $('#drag').drag();
               </script>
					
					
					<p><a>短信验证码：</a><a style="padding-left:31px;"><input  type="text" class="name" name="checkCode"/></a><a><input type="button" class="btn" name="getCheck" id="getCheckCode" value="发送验证码">
						<button class="btn" id="resetCountDown"style="display:none;" >
				<span id="countDown">60</span>秒后重发
			    </button>
		   			</a></p>
				    <p><a style="padding-left: 140px;"><input type="submit"  class="sub" value="下一步"/></a></p>
				</form>
			</div>
			<div id="resg-middle-bottom" class="request_error">
				${requestScope.error} 
			</div>
		</div> 



</body>
</html>
