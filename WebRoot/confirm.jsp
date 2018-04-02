<%@page import="com.bjsxt.shopping.User"%>
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
Cart cart = (Cart)session.getAttribute("cart");
if (cart == null) {
	out.println("购物车为空！！");
	return;
}
User user = (User)session.getAttribute("user");
if (user == null) {
	out.println("您现在尚未登录，若继续购买将按市场价结算。您可以选择返回商城首页登录：&nbsp;&nbsp;");
	out.println("<a href='index.jsp'>去登录，以会员价购买</a>");
}
%>



<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>确认订单</title>
    
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
   	<center>确认购物车</center>   	   		
   		<table border="1" align="center">
   			<tr>
   				<td>产品ID</td>
   				<td>产品名称</td>
   				<td>产品价格(<%=user == null ? "市场价" : "会员价" %>)</td>
   				<td>购买数量</td>
   			</tr>
   			<%
   			List<CartItem> items = cart.getItems();
   			for (int i=0; i<items.size(); i++) {
   				CartItem ci = items.get(i);
   				Product p = ProductMgr.getInstance().loadById(ci.getProductId());
   			%>
   			<tr>
   				<td><%=ci.getProductId()%></td>
   				<td><%=ci.getProductName()%></td>
   				<td><%=user == null ? p.getNormalPrice() : p.getMemberPrice()%>元</td>
   				<td><input type="text" name="p<%=ci.getProductId() %>" value="<%=ci.getCount()%>"></td>
   			</tr>
   			<% 
   			}
   			%> 			
   		</table>
   		<center>
   			共<%=Math.round(cart.getTotalPrice() * 100.0) / 100.0%>元<br>
   			<%
   			if (user != null) {
   			%>
   				欢迎您， <%=user.getUsername()%>！ 请确认您的收货地址！<br>
   			<% 
   			} else {
   			%>
   				欢迎您！ 请填写您的收货地址！<br>	
   			<% 
   			}
   			%>
   			<form action="order.jsp" method="post">
	   			收货地址：<br>
	   			<textarea name="addr"><%=user == null ? "" : user.getAddr()%></textarea><br>
   				<input type="submit" value="下单">
   			</form>
   		</center>
  </body>
</html>