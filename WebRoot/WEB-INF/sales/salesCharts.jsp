<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<html>
  <head>
  <!-- <script type="text/javascript" src="../sales/jscharts.js"></script> -->
  <%@ include file="/public/head.jspf" %>
  </head>
  <body>

<div id="graph" style="float:left;">Loading graph...</div>

<script type="text/javascript">
	
	var myData = new Array([1, 2], [2, 1.5], [3, 3], [4, 6], [5, 8.5], [6, 7], [7, 9], [8, 8], [9, 5], [10, 6],[11,2], [12, 2.5]);
	var myChart = new JSChart('graph', 'line');
	myChart.setDataArray(myData);
	myChart.setAxisNameFontSize(10);
	myChart.setAxisNameX('月份');
	myChart.setAxisNameY('销售额:万');
	myChart.setAxisNameColor('#787878');
	myChart.setAxisValuesNumberX(12);
	myChart.setAxisValuesNumberY(5);
	myChart.setAxisValuesColor('#38a4d9');
	myChart.setAxisColor('#38a4d9');
	myChart.setLineColor('#C71112');
	myChart.setTitle('销售报表');
	myChart.setTitleColor('#383838');
	myChart.setGraphExtend(true);
	myChart.setGridColor('#38a4d9');
	myChart.setSize(616, 321);
	myChart.setAxisPaddingLeft(140);
	myChart.setAxisPaddingRight(140);
	myChart.setAxisPaddingTop(60);
	myChart.setAxisPaddingBottom(45);
	myChart.setTextPaddingLeft(90);
	myChart.setTextPaddingBottom(12);
	/* myChart.setBackgroundImage('${foritou }/images/chart_bg.jpg'); */
	myChart.draw();
	
</script>
<div style="float:left;margin:50px;">
<p><span style="font-size:20px;font-weight:600;">本月销售总额：</span><span style="color:red;font-size:24px;">3.66</span><span style="color:red;font-size:24px;">万元</span></p>
<p><a href="#" title="" style="font-size:16px;text-decoration: none;">查看详情</a></p>
</div>
</body>
  </html>