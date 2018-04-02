<%@page import="java.sql.Timestamp"%>
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
	if (username == null || !username.equals("admin")){
		out.println("用户名不正确！");
		return;
	} else if (password == null || !password.equals("admin")) {
		out.println("密码不正确！");
		return;
	} else {
		session.setAttribute("admin", "true");
		response.sendRedirect("index.jsp");
		
	}	
}
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>管理员登录</title>
    
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
  	<form method="post" name="form" action="admin/login.jsp">
		<input type="hidden" name="action" value="login"/>

		<table align="center"  width="750" border="2">
			
				<tr>
					<td colspan="2" align="center">管理员登录</td>
				</tr>
				<tr>
					<td>管理员：</td>
					<td><input name="username"
						size="30" maxlength="10" type="text" >
				</tr>

				<tr>
					<td>密码：</td>
					<td><input name="password" size="15" maxlength="12"
						type="password"></td>
				</tr>
				
				<tr>
					
					<td>
						<input value="登录" type="submit"/>
						<input value="重置" type="reset"/>
					</td>
				</tr>
						
		</table>
	</form>
  </body>
</html>