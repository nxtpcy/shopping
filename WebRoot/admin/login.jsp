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
		out.println("�û�������ȷ��");
		return;
	} else if (password == null || !password.equals("admin")) {
		out.println("���벻��ȷ��");
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
    
    <title>����Ա��¼</title>
    
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
					<td colspan="2" align="center">����Ա��¼</td>
				</tr>
				<tr>
					<td>����Ա��</td>
					<td><input name="username"
						size="30" maxlength="10" type="text" >
				</tr>

				<tr>
					<td>���룺</td>
					<td><input name="password" size="15" maxlength="12"
						type="password"></td>
				</tr>
				
				<tr>
					
					<td>
						<input value="��¼" type="submit"/>
						<input value="����" type="reset"/>
					</td>
				</tr>
						
		</table>
	</form>
  </body>
</html>