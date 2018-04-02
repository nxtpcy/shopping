<%@page import="java.sql.Timestamp"%>
<%@page import="com.bjsxt.shopping.User"%>
<%@ page language="java" import="java.util.*" pageEncoding="GB18030"%>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<%
User u = (User)session.getAttribute("user");
if (u == null){
	out.println("您尚未登录！请重新登录！");
	return;
}
%>


<%
request.setCharacterEncoding("GB18030");
String action = request.getParameter("action");
if (action != null && action.trim().equals("modify")){
	String username = request.getParameter("username");
	String phone = request.getParameter("phone");
	String addr = request.getParameter("addr");
	u.setUsername(username);
	u.setPhone(phone);
	u.setAddr(addr);
	u.update();
	out.println("修改成功！！！");
	return;	
	
}
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>修改个人信息</title>
    
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
  	<form method="post" name="form" action="usermodify.jsp">
		<input type="hidden" name="action" value="modify"/>

		<table align="center"  width="750" border="2">
			
				<tr>
					<td colspan="2" align="center">用户自服务</td>
				</tr>
				<tr>
					<td>用户名:</td>
					<td><input name="username"
						size="30" maxlength="10" type="text" value=<%=u.getUsername() %>></td>
				</tr>

				<!-- 
				<tr>
					<td>密码:</td>
					<td><input name="password" size="15" maxlength="12"
						type="password"></td>
				</tr>
				 -->
				

				<tr>
					<td>电话:</td>
					<td><input name="phone" type="text" 
						size="15" maxlength="12" value=<%=u.getPhone() %>></td>
				</tr>

				<tr>
					<td>地址:</td>
					<td><textarea name="addr" cols="60" rows="5"><%=u.getAddr() %></textarea></td>
				</tr>
				<tr>
					<td>
						<input value="提交" type="submit"/>
						<input value="重置 " type="reset"/>
					</td>
				</tr>
			
		</table>
	</form>
  </body>
</html>