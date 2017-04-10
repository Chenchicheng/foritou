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

 $("textarea[name='info']").validatebox({
	required:true,
	misingMessage:'请输入简单描述'
	});
	 $("textarea[name='phone']").validatebox({
	required:true,
	misingMessage:'请输入联系方式'
	});
	
   $("textarea[name='adress']").validatebox({
	required:true,
	misingMessage:'请输入具体地址'
	});
	//默认禁止验证功能
$("#ff").form("disableValidation");
$("#submit").click(function (){
//开启验证
$("#ff").form("enableValidation");
//如果验证成功，则提交数据,调用submit犯法

if($("#ff").form("validate")){
$('#ff').form('submit', {    
    url:'store_save.action',    
    success:function(data){ 

      //关闭当前窗体，刷新页面
     parent.$("#win").window("close");

     //获取aindex--->iframe---->dg
     //查找匹配元素内部所有的子节点（包括文本节点）。如果元素是一个iframe，则查找文档内容
     //parent.$("iframe[title='类别管理']").contents().find("#dg").datagrid("reload");
     //取得其中一个匹配的元素。 num表示取得第几个匹配的元素。从0开始，返回的是DOM对象，类似的有eq(index),不过eq(index)返回的是jQuery对象。
     // 这能够让你选择一个实际的DOM 元素并且对他直接操作，而不是通过 jQuery 函数。$(this).get(0)与$(this)[0]等价。
      parent.$("iframe[title='分店管理']").get(0).contentWindow.$("#dg").datagrid("reload"); 
  
  
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
 <form title="添加分店" id="ff" method="post" enctype="multipart/form-data">
	 <input type="hidden" id="shopmapaddress" value="${sessionScope.shop.addressmap }">
	   <div>   
        <label for="phone">联系方式：</label>   
        <input class="easyui-validatebox" type="text" name="phone" />   
    </div>   
   <div>   
        <label for="adress">具体地址：</label>   
        <input class="easyui-validatebox" type="text" name="adress" />   
    </div>
		<div>
			<label for="addressmap">在地图上标注:</label>
			<div id="map"
			style="height:200px;width:300px;"></div>
			<script type="text/javascript">
			var addressmap=$("#shopmapaddress").val();
				ShowMap("map", {
					mapx : addressmap,
					ismove : '1',
					piobj : 'nxp'
				});
			</script>
		  坐标：<input id="nxp" type="text" name="addressmap">
 
		</div>



		<div>
		<label>备注:</label>
		<textarea name="info" cols="40" rows="4"></textarea>
	</div>
	<div>
		<a id="submit" href="#" class="easyui-linkbutton">添 加</a> 
		<a id="reset" href="#" class="easyui-linkbutton">重 置</a>
	</div>
</form> 
</body>
</html>
