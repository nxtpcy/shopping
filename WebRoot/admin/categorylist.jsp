<%@ page language="java" import="java.util.*" pageEncoding="GB18030"%>
<%@ page import="java.sql.*, java.util.*, com.bjsxt.shopping.*" %>
<%@ include file="_sessioncheck.jsp" %>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>


<%
//get all the categories
List<Category> categories = Category.getCategories();
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'userlist.jsp' starting page</title>
    
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
  	<table border="1" align="center">
  		<tr>
  			<td>ID</td>
  			<td>类别名</td>
  			<td>PID</td>
  			<td>级别</td>
  			<td>操作</td>
  		</tr>
  		<%
  		for (Iterator<Category> it = categories.iterator(); it.hasNext(); ){
  			Category c = it.next();
  			String preStr = "";
  			for (int i = 1; i < c.getGrade(); i++){
  				preStr += "----";
  			}
  		%>
  			<tr>
	  			<td><%=c.getId() %></td>
	  			<td><%=preStr + c.getName() %></td>
	  			<td><%=c.getPid() %></td>
	  			<td><%=c.getGrade() %></td>
	  			<td>
	  				<a href="admin/categoryadd.jsp?pid=<%=c.getId()%>">添加子类别</a>
	  				<a href="admin/categorydelete.jsp?id=<%=c.getId()%>&leaf=<%=c.isLeaf() ? 0 : 1%>&pid=<%=c.getPid()%>">删除</a>
	  				<a href="admin/categoryupdate.jsp?id=<%=c.getId()%>">修改</a>
	  				<%
	  				if (c.isLeaf()) {
	  				%>
	  					<a href="admin/productadd.jsp?categoryid=<%=c.getId()%>">该类别下添加商品</a>
	  				<%
	  				} 
	  				%>
	  			</td>
  			</tr>
  		<% 
  		}
  		%>
  	</table>
  </body>
</html>