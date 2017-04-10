<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
<%@ include file="/public/head.jspf" %>
<style type="text/css">
form div{
margin:5px;}
</style>
<script type="text/javascript">
$(function(){
//完成数据的回显
//dg为iframe的dg对象
var dg= parent.$("iframe[title='分店管理']").get(0).contentWindow.$("#dg");
var rows=dg.datagrid("getSelections"); 
$('#ff').form('load',{
	id:rows[0].id,
    phone:rows[0].phone,
	adress: rows[0].adress,
	addressmap:rows[0].addressmap,
	info:rows[0].info,
    'shop.id':rows[0].shop.id
	
});

//窗体弹出时禁用验证

$("input[name=phone]").validatebox({
required:true,
missingMessage:'请输入联系方式',

});
$("input[name=adress]").validatebox({
required:true,
missingMessage:'请输入分店具体地址',
});
$("input[name=info]").validatebox({
required:true,
missingMessage:'请输入备注',
});
$("#ff").form("disableValidation");
//注册button的事件 
$("#btn").click(function (){

$("#ff").form("enableValidation");
//如果验证成功，则提交数据,调用submit犯法
if($("#ff").form("validate")){
$('#ff').form('submit', {    
    url:'store_update.action',    
    success:function(data){    
      //关闭当前窗体，刷新页面
     parent.$("#win").window("close");

     //获取aindex--->iframe---->dg
     //查找匹配元素内部所有的子节点（包括文本节点）。如果元素是一个iframe，则查找文档内容
     //parent.$("iframe[title='类别管理']").contents().find("#dg").datagrid("reload");
     //取得其中一个匹配的元素。 num表示取得第几个匹配的元素。从0开始，返回的是DOM对象，类似的有eq(index),不过eq(index)返回的是jQuery对象。
     // 这能够让你选择一个实际的DOM 元素并且对他直接操作，而不是通过 jQuery 函数。$(this).get(0)与$(this)[0]等价。
     dg.datagrid("reload");

   
  
  
    }    
});  



}
});

});




</script>
  </head>
  
  <body>

<form id="ff" method="post">   
    <div>   
        <label for="phone">联系方式：</label>   
        <input class="easyui-validatebox" type="text" name="phone" />   
    </div> 
    
        <div>   
        <label for="adress">详细地址：</label>   
        <input class="easyui-validatebox" type="text" name="adress" />   
    </div> 
    <div>
    	<label for="addressmap">在地图上标注:</label>
			<div id="map"
			style="height:200px;width:300px;"></div>
			<script type="text/javascript">
			var addressmap=$("#nxp").val();
				ShowMap("map", {
					mapx : addressmap,
					ismove : '1',
					piobj : 'nxp'
				});
			</script>
		    <label>坐标：</label>  <input id="nxp" type="text" name="addressmap">
		
    </div>
    
      
     <div>
		<label>备注:</label>
		<textarea name="info" cols="25" rows="4"></textarea>
	</div>
      <a id="btn" href="#" class="easyui-linkbutton" data-options="iconCls:'icon-edit'">更新</a> 
      <input type="hidden" name="id"/>
      <input type="hidden" name="shop.id"/>
</form>  

	
  </body>
</html>
