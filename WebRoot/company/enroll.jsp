<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
<%@ include file="/public/head.jspf" %>
   <script type="text/javascript">
   

 function checkPhone(){//验证手机号码
	var phone = $('#phone').val();
	alert(phone);
	var pattern = /^1[0-9]{10}$/;
	if(phone == '') {
	//在输入框后面提示“手机号码不能为空！”
		alert('请输入手机号码');
		return;
	}else if(!pattern.test(phone)){
	//在输入框后面提示“请输入正确的手机号码”
		alert('请输入正确的手机号码');
		return;
	}else if(pattern.test(phone)){//既不为空，也是正确的手机号码。则验证是否已注册
	$.post("company_checkPhone.action",{
	phone:phone,
	},function(data){
	if(data=="false"){//在手机号码输入框后面加入"该号码已经注册！"
	alert("该手机号码已经注册！");
	$('#phone').focus();
	}else{//手机号码验证成功
	getCheckCode();//获取验证码
	}
	},"json");
	}
}

function resetCode(){//倒计时
	$('#getCheckCode').hide();
	$('#countDown').html('60');
	$('#resetCountDown').show();
	var second = 60;
	var timer = null;
	timer = setInterval(function(){//设置定时器。每一秒钟数字减一
		second -= 1;
		if(second >0 ){
			$('#countDown').html(second);
		}else{
			clearInterval(timer);
			$('#getCheckCode').show();
			$('#resetCountDown').hide();
		}
	},1000);
}
function  getCheckCode(){//发送请求
$.post("company_getCheckCode.action",//发送请求
   {phone:$("#phone").val(),
   },function(data){//请求成功
    resetCode();//倒计时
   },"json");	
}
function nextEnrollStep(){
var phone=$("#phone").val();
var checkCode=$("#checkCode").val();
window.location.href="company_enroll1.action?phone="+phone+"&checkCode="+checkCode;
}

   
   
   
   </script>
  </head>
  
  <body>
  
                    
		            <c:if test="${not empty requestScope.error }">
		            <div>${requestScope.error }</div>
		            </c:if>
					<div>
						<label for="phone">手机号码:&nbsp;</label> 
						<input type="text" name="phone" id="phone"/>
					</div>
					<div>
						<label for="checkCode">短信验证码:&nbsp</label> 
						<input type="text" name="checkCode"  /><button class="" id="getCheckCode" onclick="checkPhone();">发送手机验证码</button>
				       <button class="" id="resetCountDown" style="display:none;"><span id="countDown">60</span>秒后重发</button>
					</div>
					<button id="nextEnrollStep" onclick="return nextEnrollStep();" class="">下一步</button>
					
						
						
				
			   
  </body>
</html>
