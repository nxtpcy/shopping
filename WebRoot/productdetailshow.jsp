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
    
    <title>商品详细信息</title>
    
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
   	<center>产品详细信息</center>
   	
   		<table>
   			<tr>
   				<td><img height=90 alt=<%=p.getName()%> src="images/br0013.gif" width=90 border=0></td>
   				
   			</tr>
   			<tr>
   				<td>产品名称：</td>
   				<td><%=p.getName() %></td>
   			</tr>
   			<tr>
   				<td>产品描述：</td>
   				<td>
   					<%=p.getDescr() %>
   				</td>
   			</tr>
   			<tr>
   				<td>市场价：</td>
   				<td><%=p.getNormalPrice() %>元</td>
   			</tr>
   			<tr>
   				<td>会员价：</td>
   				<td><%=p.getMemberPrice() %>元</td>
   			</tr>
   			<tr>
   				<td>
   					类别：
   				</td>
   				<td>
   					<%=p.getCategory().getName() %>
   				</td>
   			</tr>
   			<tr>
   				<td>
   					<a href="buy.jsp?id=<%=id %>">我买了</a>
   				</td>
   			</tr>
   		</table>
  </body>
</html>