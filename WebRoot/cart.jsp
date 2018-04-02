<%@page import="com.bjsxt.shopping.CartItem"%>
<%@page import="com.bjsxt.shopping.Cart"%>
<%@page import="com.bjsxt.shopping.ProductMgr"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="com.bjsxt.shopping.Product"%>
<%@page import="com.bjsxt.shopping.Category"%>
<%@page language="java" import="java.util.*" pageEncoding="GB18030"%>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<%
request.setCharacterEncoding("GB18030");

//check the session to see whether there is a cart in it
Cart cart = (Cart)session.getAttribute("cart");
if (cart == null) {
	out.println("购物车中没有商品！！");
	response.sendRedirect("index.jsp");
	return;
	
}
%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>购物车详细信息</title>
    
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
   	<center>购物车详细信息</center>
   	
   		<form action="cartupdate.jsp" method="post">
   		<table border="1" align="center">
   			<tr>
   				<td>产品ID</td>
   				<td>产品名称</td>
   				<td>产品价格</td>
   				<td>购买数量</td>
   			</tr>
   			<%
   			List<CartItem> items = cart.getItems();
   			for (int i=0; i<items.size(); i++) {
   				CartItem ci = items.get(i);
   			%>
   			<tr>
   				<td><%=ci.getProductId()%></td>
   				<td><%=ci.getProductName()%></td>
   				<td><%=ci.getPrice()%>元</td>
   				<td><input type="text" name="p<%=ci.getProductId() %>" value="<%=ci.getCount()%>"></td>
   			</tr>
   			<% 
   			}
   			
   			%> 			
   		</table>
   		<center>
   			共<%=Math.round(cart.getTotalPrice() * 100.0) / 100.0%>元<br>
   			<input type="submit" value="修改数量">
   			<input type="button" value="确认订单" onclick="document.location.href='confirm.jsp'" >
   		</center>
   		</form>
   		<center>
   			<a href="index.jsp">返回首页</a>  			
   		</center>
  </body>
</html>