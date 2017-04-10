<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
<%@ include file="/public/head.jspf" %>
   
   <style type="text/css">
  body{
  margin:0px;
   
  }
   .content-title{
   padding-top:20px;
   margin-left:100px;
   
   }
   .notes{
   margin:0px;
   }
   .total{
   width:702px;
   height:280px;
   }
   table{
    width:730px;
   height:280px;
   }
   #td1{
   font-size:16px;
   background:#f9f9f9;
   text-align:left;
   border-right:1px solid #eee;
   border-top:1px solid #eee;
   width:120px;
   color: #666;
   font-weight:700;
   }
   #td2{
   font-size:14px;
   width:600px;
   background:white;
   text-align: left;
   border-top:1px solid #eee;
   border-right:1px solid #eee;
   padding-left:15px;
   color: #666;
   margin:0px;
   
   }
   .f-input{
    font-size:14px;
    width:615px;
    height:35px;
    background:white;
    text-align: left;
    border:none;
    color: #666;
    padding-left:15px;
    padding-top:0px;
    margin-top: -7px;
    margin-bottom: -19px;
    border-top:1px solid #eee;
   
  }
   .f-input2{
   font-size:14px;
   width:615px;
   height:80px;
   background:white;
   text-align: left;
    border:none;
   color: #666;
    padding-left:15px;
    padding-top:0px;
   margin-top: -3px;
    margin-bottom: -19px;
   border-top:1px solid #eee;
 resize : none;
  outline:none;
   }
   .sub{
   width:80px;
   height:30px;
   background:#f9f9f9;
   margin-left:600px;
   border-radius:5px;
   transform: auto;
   border:1px solid gray;
   margin-top:-45px;
   color:black;
   }
   <
   </style>
   <script type="text/javascript">
 $(function(){
   $("#edit").click(function(){
    $(".f-input").css({
 
  "font-size":"14px",
   "width":"615px",
  "outline":"none",
   "background":"white",
   "text-align": "left",
   "color": "#666",
    "padding-left":"15px",
    "padding-top":"0px",  
  });
  
   $(".f-input2").css({
  
  "font-size":"14px",
   "width":"615px",
   "height":"80px",
   "background":"white",
   "text-align": "left",
   "color": "#666",
    "padding-left":"15px",
    
   "margin-top": "-3px",
    "outline":"none",
   
   
   });
  $(".f-input").removeAttr("readonly");
   
     $(".f-input2").removeAttr("readonly");
    });
   
  var b = 0;
	$("#edit").click(function(){
	if (b == 0)
	{
	 $("#shopname").attr("readonly","readonly");
	b = 1; 
	$("#edit").val("保存");
	}
	else
	{
	
$("#ff").submit();
 $(".f-input").attr("readonly","readonly");
  $(".f-input2").attr("readonly","readonly");
	b = 0; 
	$("#edit").val("编辑");

	}
	});
});

   </script>
  </head>
  <body>
  <div style="margin-bottom:20px;">	
					<h3 class="content-title">客户购买须知</h3>
					<input type="button" id="edit" class="sub" value="编辑"></input>
					</div>
<form id="ff" method="post" action="${foritou}/usernotes_update.action">
					 <div class="deal-term">
					<table>
					<tr>
					<td id="td1" >商家名称</td>
					<td id="td2"><input id="shopname" class="f-input" readonly="readonly" type="text" name="shopname" data-options="required:true" value="${usernotes.shopname }" />   </td>
					</tr>
					<tr>
					<td id="td1">有效期</td>
					<td id="td2"><input class="f-input" readonly="readonly" type="text" name="validtime" data-options="required:true" value="${usernotes.validtime }" />   </td>

					</tr>
					<tr>
					<td id="td1">不可用时间</td>
					<td id="td2"><input class="f-input" readonly="readonly" type="text" name="unabledate" data-options="required:true" value="${usernotes.unabledate}" />   </td>

					</tr>
					<tr>
					<td id="td1">使用时间</td>
					<td id="td2"><input class="f-input" readonly="readonly" type="text" name="usetime" data-options="required:true" value="${usernotes.usetime }" />   </td>

					<tr>
					<td id="td1">其余费用</td>
					<td id="td2"><input class="f-input" readonly="readonly" type="text" name="othermoney" data-options="required:true" value="${usernotes.othermoney }" />   </td>

					</tr>
					<tr>
					<td id="td1">温馨提示</td>
					<td id="td2"><textarea class="f-input2" readonly="readonly"  name="tips" data-options="required:true"/>${usernotes.tips }</textarea>   </td>

                    </tr>
					<tr>
					<td id="td1">商家服务</td>
					<td id="td2" style="height:91px; border-bottom:1px solid #eee; "><textarea style="margin-bottom:8px;"  class="f-input2" readonly="readonly"  name="service" data-options="required:true">${usernotes.service }</textarea>   </td>

					</tr>
					</table>
					</div> 

					

                     <input type="hidden" name="id" value="${usernotes.id }"/>
			           <input type="hidden" name="sid" value="${usernotes.sid }"  />

			   </form>
  </body>
</html>
