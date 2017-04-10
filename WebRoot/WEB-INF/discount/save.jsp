<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
	<!-- 引入公共的JSP片段 -->
	<%@ include file="/public/head.jspf"%>
	<style type="text/css">
		form div{
			margin: 10px;
		}
		#dt{
		width:120px;
		}
		#pp{
		width: 120px;
		}
		
		
	</style>
	<script type="text/javascript">
	$(function(){
	//自定义验证方法向validatebox.defaults.rules注册新函数
    $.extend($.fn.validatebox.defaults.rules, { 
    //函数的 名称：函数的实现体(又是一个json对象，里面包括函数的实现，和错误消息设置)  
    format: {    
    //函数的实现，如果返回false则验证失败
        validator: function(value,param){  
    //  alert(value+","+param);
    //获取当前文件的后缀名
    var ext=value.substring(value.lastIndexOf('.')+1);
        //获取支持文件的后缀，然后比较即可
        var arr=param[0].split(',');
        for(var i=0;i<arr.length;i++){
        if(ext==arr[i]){
        return true;
        
        }
        
        }
           return false; 
        },   
       //错误消息 
        message: '文件必须为：{0}'   
    }    
});  

$('#cc').combobox({  //获取下拉菜单，选择商品的所属类别  
    url:'size_query.action',    
    valueField:'id',    //基础数据值名称绑定到该下拉列表框。
    textField:'size',  //基础数据字段名称绑定到该下拉列表框。 
    panelHight:'auto',
    panelWidth:120,
    width:120,
    editable:false,
    	required:true,
	misingMessage:'请选择所属类别'
}); 

	 $("textarea[name='discount']").validatebox({
	required:true,
	misingMessage:'请输入折扣'
	});
	
   $("textarea[name='personprice']").validatebox({
	required:true,
	misingMessage:'请输入折扣单价'
	});
	//默认禁止验证功能
$("#ff").form("disableValidation");
$("#submit").click(function (){
//开启验证
$("#ff").form("enableValidation");
//如果验证成功，则提交数据,调用submit犯法

if($("#ff").form("validate")){
$('#ff').form('submit', {    
    url:'discount_save.action',    
    success:function(data){ 

      //关闭当前窗体，刷新页面
     parent.$("#win").window("close");

     //获取aindex--->iframe---->dg
     //查找匹配元素内部所有的子节点（包括文本节点）。如果元素是一个iframe，则查找文档内容
     //parent.$("iframe[title='类别管理']").contents().find("#dg").datagrid("reload");
     //取得其中一个匹配的元素。 num表示取得第几个匹配的元素。从0开始，返回的是DOM对象，类似的有eq(index),不过eq(index)返回的是jQuery对象。
     // 这能够让你选择一个实际的DOM 元素并且对他直接操作，而不是通过 jQuery 函数。$(this).get(0)与$(this)[0]等价。
      parent.$("iframe[title='折扣管理']").get(0).contentWindow.$("#dg").datagrid("reload"); 
  
  
    }      
});  
}
});
$("#reset").click(function(){
//重置当前表单数据
$("#ff").form("reset");

});
	
	});
	

	
	
	</script>
</head>

<body>
 <form title="添加折扣" id="ff" method="post" enctype="multipart/form-data">
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
	<div>
		<a id="submit" href="#" class="easyui-linkbutton">添 加</a> 
		<a id="reset" href="#" class="easyui-linkbutton">重 置</a>
	</div>
</form> 
</body>
</html>
