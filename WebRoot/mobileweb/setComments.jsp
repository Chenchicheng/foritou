<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="/public/head.jspf" %>s
<head>
<title>无标题文档</title>
<style>
.b1{
	border:1px solid #e5e5e5;
	padding:30px;
}
.b1 img{
	border-radius:50%;
}
.b2{
	margin:20px 120px 0 120px;
	margin-bottom:0px;
	border-bottom:1px solid #e5e5e5;
}
.b2 p{
	font-size:50px;
	padding:20px;
}
.b3{
	margin-left:120px;
	
}
.b3 textarea{
	width:700px;
	height:300px;
	border:1px solid #666;
	font-size:60px;
}
.b2 span{
	font-size:45px;
}
.submit{
	width:200px;
	height:100px;
	background:#ff6537;
	border:1px solid #ff6537;
	border-radius:10px;
	color:#fff;
	font-size:50px;
	float:right;
	margin:50px 130px;
	cursor:pointer;
	
}
</style>

</head>

<body>
<div align="center">
<div class="b1">
<img src="${foritou }/mobileweb/img/tou.jpg"  width="300" height="300"/>
</div>
</div>
<div class="b2">
<p>折扣:<span style="color:#ff6537;font-size:80px;">${sessionScope.discount }折</span></p>
<p>商家：<span>${sessionScope.identyShop.name }</span></p>
<p>微信号：<span>${sessionScope.identyEmployee.weixin }</span></p>
<p>所属企业：<span>${sessionScope.identyEmployee.company.companyname }</span></p>
</div>


<div class="b4">

<form action="comments_setComments.action" method="post">
<input type="hidden" value=1 name="eid">
<input type="hidden" value=5 name="sid">
<div class="b3">
<p style="color:#ff6537;font-size:45px;font-weight:600;">评价</p>
<textarea name="comment"></textarea>
</div>
<input type="submit" class="submit" value="提交"/>
</form>
</div>
</body>
</html>



