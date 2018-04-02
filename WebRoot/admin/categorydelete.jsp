<%@page import="com.bjsxt.shopping.Category"%>
<%@page import="com.bjsxt.shopping.UserManager"%>
<%@page language="java" import="java.util.*" pageEncoding="GB18030"%>
<%@ include file="_sessioncheck.jsp" %>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<%
int id = Integer.parseInt(request.getParameter("id"));
int pid = Integer.parseInt(request.getParameter("pid"));
int leaf = Integer.parseInt(request.getParameter("leaf"));
Category.deleteCategory(id, pid, leaf);
out.println("类别删除成功！！");
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'userdelete.jsp' starting page</title>
    
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
  </body>
</html>