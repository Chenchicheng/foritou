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
var dg= parent.$("iframe[title='评论管理']").get(0).contentWindow.$("#dg");
var rows=dg.datagrid("getSelections"); 
$('#ff').form('load',{
	id:rows[0].id,
    'employee.id':rows[0].employee.id,
	date: rows[0].date,
	comment:rows[0].comment,
    state:rows[0].state,
    'shop.id':rows[0].shop.id,
        'reply':rows[0].reply
	
});

//窗体弹出时禁用验证



$("input[name=reply]").validatebox({
required:true,
missingMessage:'请输入回复信息!',
});
$("#ff").form("disableValidation");
//注册button的事件 
$("#btn").click(function (){

$("#ff").form("enableValidation");
//如果验证成功，则提交数据,调用submit犯法
if($("#ff").form("validate")){
$('#ff').form('submit', {    
    url:'comments_reply.action',    
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
		<label>评论信息:&nbsp;&nbsp;&nbsp;&nbsp;</label>
		<textarea name="comment" readonly="readonly" cols="25" rows="4"></textarea>
	    </div>    
         <div>
		<label>回复:&nbsp;&nbsp;&nbsp;&nbsp;</label>
		<textarea name="reply" cols="25" rows="4"></textarea>
	    </div>
      <a id="btn" href="#" class="easyui-linkbutton" data-options="iconCls:'icon-edit'">提交</a> 
      <input type="hidden" name="id"/>
      <input type="hidden" name="shop.id"/>
         <input type="hidden" name="state"/>
            <input type="hidden" name="employee.id"/>
        <input type="hidden" name="date"/>
       
</form>  

	
  </body>
</html>
