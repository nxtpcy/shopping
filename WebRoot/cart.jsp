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
	out.println("���ﳵ��û����Ʒ����");
	response.sendRedirect("index.jsp");
	return;
	
}
%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>���ﳵ��ϸ��Ϣ</title>
    
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
   	<center>���ﳵ��ϸ��Ϣ</center>
   	
   		<form action="cartupdate.jsp" method="post">
   		<table border="1" align="center">
   			<tr>
   				<td>��ƷID</td>
   				<td>��Ʒ����</td>
   				<td>��Ʒ�۸�</td>
   				<td>��������</td>
   			</tr>
   			<%
   			List<CartItem> items = cart.getItems();
   			for (int i=0; i<items.size(); i++) {
   				CartItem ci = items.get(i);
   			%>
   			<tr>
   				<td><%=ci.getProductId()%></td>
   				<td><%=ci.getProductName()%></td>
   				<td><%=ci.getPrice()%>Ԫ</td>
   				<td><input type="text" name="p<%=ci.getProductId() %>" value="<%=ci.getCount()%>"></td>
   			</tr>
   			<% 
   			}
   			
   			%> 			
   		</table>
   		<center>
   			��<%=Math.round(cart.getTotalPrice() * 100.0) / 100.0%>Ԫ<br>
   			<input type="submit" value="�޸�����">
   			<input type="button" value="ȷ�϶���" onclick="document.location.href='confirm.jsp'" >
   		</center>
   		</form>
   		<center>
   			<a href="index.jsp">������ҳ</a>  			
   		</center>
  </body>
</html>