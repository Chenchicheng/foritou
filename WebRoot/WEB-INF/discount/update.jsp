<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
<%@ include file="/public/head.jspf" %>
<style type="text/css">
form div{
margin:5px;}

	#dt{
		width:120px;
		}
		#pp{
		width: 120px;
		}
</style>



<script type="text/javascript">
$(function(){
//完成数据的回显
//dg为iframe的dg对象
var dg= parent.$("iframe[title='折扣管理']").get(0).contentWindow.$("#dg");
var rows=dg.datagrid("getSelections"); 
$('#ff').form('load',{
	  id:rows[0].id,
     'size.id':rows[0].size.id,
      discount:rows[0].discount,
	  personprice: rows[0].personprice,
	  'shop.id':rows[0].shop.id
});

$('#cc').combobox({    
    url:'size_query.action',    
    valueField:'id',    //基础数据值名称绑定到该下拉列表框。
    textField:'size',  //基础数据字段名称绑定到该下拉列表框。 
    panelHight:'auto',
    panelWidth:120,
    width:120,
    editable:false,
    required:true,
	misingMessage:'请选择企业规模'
}); 


//窗体弹出时禁用验证

	 $("textarea[name='discount']").validatebox({
	required:true,
	misingMessage:'请输入折扣'
	});
	
   $("textarea[name='personprice']").validatebox({
	required:true,
	misingMessage:'请输入折扣单价'
	});
$("#ff").form("disableValidation");
//注册button的事件 
$("#btn").click(function (){

$("#ff").form("enableValidation");
//如果验证成功，则提交数据,调用submit犯法
if($("#ff").form("validate")){
$('#ff').form('submit', {    
    url:'discount_update.action',    
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
		<label>企业规模：</label> 
		<input id="cc" name="size.id" />（单位：人）
	    </div>  
   <div>   
        <label for="discount">折&nbsp;&nbsp;扣：</label>   
        <input id="dt" class="easyui-validatebox" type="text" name="discount" />（单位：折）
    </div>   
 	<div>
	   <label for="personprice">折扣单价：</label> 
       <input id="pp" class="easyui-validatebox" type="text" name="personprice" />（单位：元）
	</div>

   <a id="btn" href="#" class="easyui-linkbutton" data-options="iconCls:'icon-edit'">更新</a> 
    <input type="hidden" name="id"/>
     <input type="hidden" name="shop.id"/>
</form>  

	
  </body>
</html>
