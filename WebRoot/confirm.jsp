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
	out.println("���ﳵΪ�գ���");
	return;
}
User user = (User)session.getAttribute("user");
if (user == null) {
	out.println("��������δ��¼�����������򽫰��г��۽��㡣������ѡ�񷵻��̳���ҳ��¼��&nbsp;&nbsp;");
	out.println("<a href='index.jsp'>ȥ��¼���Ի�Ա�۹���</a>");
}
%>



<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>ȷ�϶���</title>
    
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
   	<center>ȷ�Ϲ��ﳵ</center>   	   		
   		<table border="1" align="center">
   			<tr>
   				<td>��ƷID</td>
   				<td>��Ʒ����</td>
   				<td>��Ʒ�۸�(<%=user == null ? "�г���" : "��Ա��" %>)</td>
   				<td>��������</td>
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
   				<td><%=user == null ? p.getNormalPrice() : p.getMemberPrice()%>Ԫ</td>
   				<td><input type="text" name="p<%=ci.getProductId() %>" value="<%=ci.getCount()%>"></td>
   			</tr>
   			<% 
   			}
   			%> 			
   		</table>
   		<center>
   			��<%=Math.round(cart.getTotalPrice() * 100.0) / 100.0%>Ԫ<br>
   			<%
   			if (user != null) {
   			%>
   				��ӭ���� <%=user.getUsername()%>�� ��ȷ�������ջ���ַ��<br>
   			<% 
   			} else {
   			%>
   				��ӭ���� ����д�����ջ���ַ��<br>	
   			<% 
   			}
   			%>
   			<form action="order.jsp" method="post">
	   			�ջ���ַ��<br>
	   			<textarea name="addr"><%=user == null ? "" : user.getAddr()%></textarea><br>
   				<input type="submit" value="�µ�">
   			</form>
   		</center>
  </body>
</html>