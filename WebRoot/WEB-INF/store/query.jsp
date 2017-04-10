<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<html>
  <head>
<%@ include file="/public/head.jspf" %>
<style type="text/css">

body{
margin:1px;
}
.searchbox {
  margin: -3;
}
</style>
<script type="text/javascript">
$(function(){

$('#dg').datagrid({ 
//   指明id是标识字段。再删除更新的时候有用，如果配置此字段在翻页的时候在翻页时候被选中的记录是不会丢失的
   idField:'id',
      //如果为true，则在DataGrid控件底部显示分页工具栏。
   pagination:true,
    pageSize : 10,//默认选择的分页是每页5行数据  
   pageList : [ 5, 10, 15, 20 ],//可以选择的分页集合  
   //请求url地址
   url:'store_query.action', 
    //自适应列，如果设置此属性，则不会出现水平滚动
    //  width:250, 
      //显示斑马线
      queryParams:{type:''},
      striped:true,
      //如果为true，则在同一行中显示数据。设置为true可以提高加载性能。
      nowrap:true,
      //真正的自动展开/收缩列的大小，以适应网格的宽度，防止水平滚动。演示冻结列就不要设置这个参数
      fitColumns:true,
      //如果为true，则只允许选择一行。
      singleSelect:false,
      fixed:true,
      
 toolbar: [{
		iconCls: 'icon-add',
		text:'添加分店',
		handler: function(){
		//为了锁住全屏选取当前页面的parent弹出
		parent.$('#win').window({    
		title:"添加分店",
		width:400,
		height:300,
        content:'<iframe src="send_store_save.action" frameborder="0" width="100%" height="100%" />'
         });  


		}
	},'-',{
		iconCls: 'icon-edit',
		text:'更新分店',
		handler: function(){
	    var rows= $('#dg').datagrid("getSelections");
	
	    if(rows.length!=1){
	  $.messager.show({    
           title:'错误提示',
           msg:'只能更新一条记录',
           timeout:2000,
           showType:'slide'
      });
	   
	   }else{
	   //1.完成弹出更新的页面
	   	  parent.$('#win').window({    
		title:"更新分店",
		width:320,
		height:250,
        content:'<iframe src="send_store_update.action" frameborder="0" width="100%" height="100%" />'
         });  
	   	  
	   }
	  //更新处理

		}
	},'-',{
		iconCls: 'icon-remove',
		
		text:'删除分店',
		//1：判断是否有选中行记录
		
		handler: function(){
	   var rows= $('#dg').datagrid("getSelections");
	   //rows 返回被选中的行，没有任何行被选中则返回空数组
	   if(rows.length==0){
	   //在屏幕右下角显示一条消息窗口。该选项参数是一个可配置的对象：
	   
	   $.messager.show({    
    title:'错误提示',
    msg:'至少选择一条记录',
    timeout:2000,
    showType:'slide'
     });
	   }else{
	   //提示是否确认删除
	   $.messager.confirm('删除确认对话框', '是否要删除选中的记录', function(r){
	if (r){
	 //1.获取被选中的记录，然后从记录中获取相应的Id
	 var  ids="";
	 for(var i=0;i<rows.length;i++){
	 ids+=rows[i].id+",";
	 }

	 ids=ids.substring(0,ids.lastIndexOf(","));
	 $.post("store_deleteByIds.action",
	 {
	 ids:ids
	 },
	 function(result){
	 if(result=="true"){
	 //取消删除所选的所有行
	 $("#dg").datagrid("uncheckAll");
	 //重新刷新当前页reload param 重载行。等同于'load'方法，但是它将保持在当前页。 
	 $('#dg').datagrid("reload");
	
	 }else{
	 $.messager.show({    
     title:'删除异常',
     msg:'删除失败，请检查操作',
     timeout:2000,
     showType:'slide'
     });
	 }
	 
	 
	 },"text");
	 
	 
	

	 //2拼接id的值，发送给后台
	}
    });

	   
	   }
	   
	   
	   
		}
	
	},'-',{
		text:'<input id="search" name="search" />',
	
		}
	
	],
      
      
      //返回样式如'background:red'。带2个参数的函数：
  
      
     rowStyler: function(index,row){
     //返回的字符串默认交给style
	if(index%2==0){
	//return 'background-color:#6293BB;color:#fff';
	}else{
	//return 'background-color:#6293BB;color:#fff';
	}
	},

      //在从远程站点加载数据的时候显示提示消息。
      loadMsg:'正在加载数据......',
    //同列属性，但是这些列将会被冻结在左侧。
    frozenColumns:[[
    //如果为true，则显示复选框。该复选框列固定宽度。
          {field:'x',checkbox:true},
        {field:'id',title:'编号',width:100}
               
    ]],
    
    
    //配置dg的列 字段：filed,类字段名称，与json的key捆绑title:列标题
    columns:[[  
            {field:'phone',title:'联系方式',width:100,
        //用来格式化当前列的值，返回的是最终的数据
        formatter:function(value,row,index){
        return "<span title="+value+">"+value+"</span>"; 
        }
      
        },
         
        {field:'adress',title:'地址',width:100,
        //用来格式化当前列的值，返回的是最终的数据
        formatter:function(value,row,index){
        return "<span title="+value+">"+value+"</span>";
        }
        },    
            {field:'addressmap',title:'坐标',width:100,
        //用来格式化当前列的值，返回的是最终的数据
        formatter:function(value,row,index){
        return "<span title="+value+">"+value+"</span>";
        }
        },   
        {field:'info',title:'备注',width:100,
        formatter:function(value,row,index){
             return "<span title="+value+">"+value+"</span>";
        
        }
        }  
    ]]    
});  
//把普通的文本框转换为搜索文本框
$('#search').searchbox({ 
//出发查询时间
searcher:function(value,name){
//获取当前的关键字加载和显示第一页的所有行。如果指定了'param'，它将取代'queryParams'属性。
//通常可以通过传递一些参数执行一次查询，通过调用这个方法从服务器加载新数据。
$('#dg').datagrid('load',{
	type: value
});
}, 
prompt:'变形金刚' 
}); 






});


</script>
  </head>
  
  <body>
<table id="dg"></table>
</body>
</html>
