<%@page import="com.bjsxt.shopping.UserManager"%>
<%@page import="com.bjsxt.shopping.PasswordNotCorrectException"%>
<%@page import="com.bjsxt.shopping.UserNotFoundException"%>
<%@page import="com.bjsxt.shopping.User"%>
<%@ page language="java" import="java.util.*" pageEncoding="GB18030"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<%
request.setCharacterEncoding("GB18030");
String action = request.getParameter("action");
if (action != null && action.trim().equals("login")){
	String username = request.getParameter("username");
	String password = request.getParameter("password");
	
	User u = null;
	try {
		u = UserManager.validate(username, password);
	} catch (UserNotFoundException e) {
		out.println("用户不存在！");
		return;
		
	} catch (PasswordNotCorrectException e) {
		out.println("密码不正确！");
		return;
	}
	session.setAttribute("user", u);
	response.sendRedirect("selfservice.jsp");
	return;
}
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title></title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<script type="text/javascript" src="script/regcheckdata.js"></script>

  </head>
  
  <body>
  </body>
</html>
