<%@ page language="java" import="java.util.*" pageEncoding="GB18030" %>


<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'showproductsaleschart.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
    <center>
    	<!-- src是相对ShowProductSalesChart这个servlet的路径来算的 该servlet在root根目录下 注意！！！！ -->    	
    	<!--  
    	<img src="admin/images/reports/productSalesCount.jpg"></img>
    	-->
    	
    	
    	<img src="<%=request.getContextPath()%>/admin/images/reports/productSalesCount.jpg"></img>
    	<br>
    	<br>
    	<br>
    	<img src="<%=request.getContextPath()%>/admin/images/reports/productSalesCount_pie.jpg"></img>
    </center>
  </body>
</html>