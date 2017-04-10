<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="/public/head.jspf" %>
<head>
<title>无标题文档</title>
  

<script type="text/javascript" src="${foritou }/mobileweb/js/jquery.min.js"></script>
<script type="text/javascript" src="${foritou }/mobileweb/js/jquery.raty.min.js"></script>
<script type="text/javascript">
$(function(){
$("#star").raty({
		number:'5',
		half:'true',
		size:'150',
		score:'2',
		 click: function(score) {
$("#score").val(score);
  }
});
});
	
</script>

<style>
body{
margin:0px;
}
.total{
	text-align:center;
}
.b1{
	border:1px solid #e5e5e5;
	border-radius:20px;
	margin-top:20px;
}
.b1 img{
	border-radius:50%;
}
.b2{
	padding:100px;
	height:30px;
	border-bottom:1px dotted #e5e5e5;
}
.b2 a{
	font-size:60px;
	display:block;
}

.b2 img{

height: 130px;
width:130px;
}
.score1{
font-size: 60px;
}
.submit{

	width:500px;
	height:200px;
	font-size:60px;
    color:#fff;
	background:#ff6537;
	border:1px solid #ff6537;
	border-radius:20px;
	margin-top: 40px;
}
#score{

width:120px;
	height:60px;
	font-size:60px;
border: none;
text-align: center;
color: #ff6537;
}
.scoreForm{
margin-top: 180px;

}
	
</style>
</head>

<body>
<div class="total">
<div class="b1">
<img src="img/logo.png" width="500" height="500" />

</div>
<div class="b2">
 <a>亲，打个分呗</a>
</div>
<div class="b2" id="star">

</div>

<form class="scoreForm"  action="score_setScore.action" method="post">
<input type="hidden" value=1 name="eid">
<input type="hidden" value=5 name="sid">

<label class="score1">当前打分：</label>
<input type="text" id="score"  value=2 name="scorenumber">
<label class="score1">分</label>

<input type="submit" class="submit" value="提交"/>
</form>

</div>
</body>
</html>



