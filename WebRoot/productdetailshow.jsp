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
int id = Integer.parseInt(request.getParameter("id"));
Product p = ProductMgr.getInstance().loadById(id);
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>��Ʒ��ϸ��Ϣ</title>
    
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
   	<center>��Ʒ��ϸ��Ϣ</center>
   	
   		<table>
   			<tr>
   				<td><img height=90 alt=<%=p.getName()%> src="images/br0013.gif" width=90 border=0></td>
   				
   			</tr>
   			<tr>
   				<td>��Ʒ���ƣ�</td>
   				<td><%=p.getName() %></td>
   			</tr>
   			<tr>
   				<td>��Ʒ������</td>
   				<td>
   					<%=p.getDescr() %>
   				</td>
   			</tr>
   			<tr>
   				<td>�г��ۣ�</td>
   				<td><%=p.getNormalPrice() %>Ԫ</td>
   			</tr>
   			<tr>
   				<td>��Ա�ۣ�</td>
   				<td><%=p.getMemberPrice() %>Ԫ</td>
   			</tr>
   			<tr>
   				<td>
   					���
   				</td>
   				<td>
   					<%=p.getCategory().getName() %>
   				</td>
   			</tr>
   			<tr>
   				<td>
   					<a href="buy.jsp?id=<%=id %>">������</a>
   				</td>
   			</tr>
   		</table>
  </body>
</html>