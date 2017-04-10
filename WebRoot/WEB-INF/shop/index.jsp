<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
<%@ include file="/public/head.jspf" %>
<style type="text/css">
#menu{
width: 200px;
}
#menu ul{
padding: 0px;
margin:0px;
list-style:none;
}
#menu ul li{
border-bottom: 1px solid  #fff;
}
#menu ul li a{
display: block;
background-color: #008792;
color:#fff;
padding: 5px;
text-decoration: none;
}
#menu li a:hover{
background-color:  #00a6ac;
}

/* 以下是表单样式
 */
/*input框*/
.f-input{
border-left:0px;
border-top:0px;
border-right:0px;
border-bottom:0px 
}


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
    width:580px;
    
    background:white;
    text-align: left;
    border:none;
    color: #666;
    padding-left:15px;
    padding-top:0px;
    margin-top: -7px;
    margin-bottom: -19px;
    
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
   margin-top: -2px;
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
</style>
<script type="text/javascript">
$(function(){
$("a[title]").click(function(){
 var text=$(this).text();
 var href=$(this).attr("title");
 if($("#tt").tabs("exists",text)){
$("#tt").tabs("select",text);
 }else{

$("#tt").tabs("add",{
	title:text,
	closable:true,
	content:'<iframe title='+text+' src='+href+' frameborder="0" width="100%" height="100%" />',
	//href:'send_category_query.action'//将query加载到tab里面，href是通过uRl地址加载远程页面，但仅仅是在加载body部分
	
});
 }
//1:判断当前后面是否已有相应的tab
//2：如果没有，则创建一个新的tab,否则就切换tab

});
//下面是jquery对表单进行操作
/* $("#edit").click(function(){
    $(".f-input").css({
  "border":"1px solid cornflowerblue",
  "margin-left":"20px",
  "line-height":"20px",
  "padding":"5px",
  "height":"20px",
  });
  
  $(".f-input").removeAttr("readonly");
  
  
    }); */
});

 $(function(){
   $("#edit").click(function(){
    $(".f-input").css({
  "font-size":"14px",
   "width":"580px",
  "outline":"none",
   "background":"white",
   "text-align": "left",
   "color": "#666",
    "border":"none",
  });
  
   $(".f-input2").css({
  
  "font-size":"14px",
   "width":"615px",
   "height":"80px",
   "background":"white",
   "text-align": "left",
   "color": "#666",
    "padding-left":"15px",
   "margin-top": "-2px",
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
  <body class="easyui-layout">   
  <div data-options="region:'north',title:'欢迎来到福利淘商家后台管理器',split:true" style="height:100px;">
  ${shop.name }
  <a href="shop_getDetail.action">查看演示</a>
  </div>   
  <div data-options="region:'west',title:'商家管理',split:true" style="width:200px;">
      <!-- 此处显示的是系统菜单 -->
      <div id="menu" class="easyui-accordion">   
        <div title="基本操作">   
       	<ul>
			<li><a href="#" title="send_shopimage_query.action">图片管理</a></li>
            <li><a href="#" title="send_store_query.action">分店管理</a></li>
            <li><a href="#" title="send_discount_query.action">折扣管理</a></li>
            <li><a href="#" title="send_shop_purchaseNotes.action">客户购买须知管理</a></li>
            <li><a href="#" title="">评论管理</a></li>
		</ul>
        </div>   
         <div title="信息查看">   
       	<ul>
			<li><a href="#" title="">销售</a></li>
			<li><a href="#" title=""></a></li>
		</ul>
        </div>   
      
      </div>  
  </div>   
    <div data-options="region:'center',title:'后台操作页面'" style="padding:1px;background:#fff;">
    <div id="tt" class="easyui-tabs" data-options="fit:true">   
    <div title="商家信息" style="padding:10px;"> 
    
    
     <div style="margin-bottom:20px;">	
					<h3 class="content-title">商家信息</h3>
					<input type="button" id="edit" class="sub" value="编辑"></input>
					</div>
            
  <form id="ff" method="post" action="${foritou}/shop_update.action"> 
  
    
      <div class="deal-term">
					<table>
					<tr>
					<td id="td1" >商家名称</td>
					<td id="td2"><input id="shopname" class="f-input" readonly="readonly" type="text" name="shopname" data-options="required:true" value="${shop.name }" />   </td>
					</tr>
					
					<tr>
					<td id="td1">商家类型</td>
					<td id="td2"><input class="f-input" readonly="readonly" type="text" name="validtime" data-options="required:true" value="${shop.shoptype }" />   </td>

					</tr>
					
					<tr>
					<td id="td1">联系方式</td>
					<td id="td2"><input class="f-input" readonly="readonly" type="text" name="phone" data-options="required:true" value="${shop.phone}" />   </td>
					</tr>
				
					
					<tr>
					<td id="td1">邮箱</td>
					<td id="td2"><input class="f-input" readonly="readonly" type="text" name="email" data-options="required:true" value="${shop.email }" />   </td>
                    </tr>
                    
					<tr>
					<td id="td1">门店电话</td>
					<td id="td2"><input class="f-input" readonly="readonly" type="text" name="telephone" data-options="required:true" value="${shop.telephone }" />   </td>
					</tr>
					
					<tr>
					<td id="td1">联系人姓名</td>
					<td id="td2"><input class="f-input" readonly="readonly" type="text" name="contactname" data-options="required:true" value="${shop.contactname }" />   </td>
					</tr>
					
					<tr>
					<td id="td1">其他联系方式（可选）</td>
					<td id="td2"><input class="f-input" readonly="readonly" type="text" name="other" data-options="required:true" value="${shop.other}" />   </td>
					</tr>
					<tr>
					<td id="td1">商圈</td>
					<td id="td2"><textarea class="f-input2" readonly="readonly"  name="shangquan" data-options="required:true"/>${shop.shangquan }</textarea>   </td>
                    </tr>
                    
					<tr>
					<td id="td1">地址</td>
					<td id="td2" ><textarea   class="f-input2" readonly="readonly"  name="address" data-options="required:true">${shop.address }</textarea>   </td>
					</tr>
					
					<tr>
					<td id="td1">一句话描述</td>
					<td id="td2" style="height:91px; border-bottom:1px solid #eee; "><textarea style="margin-bottom:8px;"  class="f-input2" readonly="readonly"  name="miaoshu" data-options="required:true">${shop.miaoshu }</textarea>   </td>
					</tr>
					
					</table>
					</div> 

					

                   <input type="hidden" name="id" value="${shop.id }"/>
                   <input type="hidden" name="password" value="${shop.password }"/>
                   <input type="hidden" name="shoptype" value="${shop.shoptype }"/>
                   <input type="hidden" name="discount" value="${shop.discount }"/>
                   <input type="hidden" name="price" value="${shop.price }"/>
                   <input type="hidden" name="date" value="${shop.date }"/>
                   <input type="hidden" name="hot" value="${shop.hot }"/>
                   <input type="hidden" name="zhizhao" value="${shop.zhizhao}"/>
                   <input type="hidden" name="city" value="${shop.city}"/>
                   <input type="hidden" name="area" value="${shop.area }"/>
                   <input type="hidden" name="addressmap" value="${shop.addressmap }"/>

</form>  

 
  
  
  
  
  
  
  
  
    </div>   
 
   
</div> 
    </div> 
    <div id="win" data-options="collapsible:false,minimizable:false,maximizable:false,modal:true"></div>  
</body> 
</html>