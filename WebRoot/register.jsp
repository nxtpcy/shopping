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
if (action != null && action.trim().equals("register")){
	String username = request.getParameter("username");
	String password = request.getParameter("password");
	String phone = request.getParameter("phone");
	String addr = request.getParameter("addr");
	User u = new User();
	u.setUsername(username);
	u.setPassword(password);
	u.setPhone(phone);
	u.setAddr(addr);
	u.setRdate(new Timestamp(System.currentTimeMillis()));
	u.save();
	%>
	<center>Register Successfully! Thank You!!</center>
	<%
	return;
}
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>用户注册</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<script type="text/javascript" src="script/regcheckdata.js"></script>
	<script type="text/javascript">
	var req;
	function validate() {
		var usernameField = document.getElementById("usernamevalue");
		var url = "validate.jsp?username=" + escape(usernameField.value);
		if (window.XMLHttpRequest) {
			req = new XMLHttpRequest();
		} else if (window.ActiveXObject) {
			req = new ActiveXObject("Microsoft.XMLHTTP");
		}
		req.open("GET", url, true);
		req.onreadystatechange = callback;
		req.send(null);
		
	}
	
	function callback() {
		if (req.readyState == 4) {
			if (req.status == 200) {
				var msg = req.responseXML.getElementsByTagName("msg")[0];
				setMsg(msg.childNodes[0].nodeValue);
			}
		}
	}
	
	function setMsg(msg) {
		if (msg == "valid") {
			document.getElementById("usermsg").innerHTML = "<font color='green'>用户名有效，可以注册</font>";
		} else if (msg == "invalid") {
			document.getElementById("usermsg").innerHTML = "<font color='red'>用户名已被使用，无效</font>";
		}
	}
	</script>
	
  </head>
  
  <body>
  	<form method="post" name="form" action="register.jsp" onsubmit="return checkdata()">
		<input type="hidden" name="action" value="register"/>

		<table align="center"  width="750" border="2">
			
				<tr>
					<td colspan="2" align="center">用户注册</td>
				</tr>
				<tr>
					<td>用户名:</td>
					<td>
						<input name="username" id="usernamevalue"
						size="30" maxlength="10" type="text" onblur="validate()">
						<div id="usermsg"></div>
					</td>
				</tr>

				<tr>
					<td>密码:</td>
					<td><input name="password" size="15" maxlength="12"
						type="password"></td>
				</tr>
				<tr>
					<td>确认密码:</td>
					<td><input name="password2" size="15" maxlength="12"
						type="password"></td>
				</tr>

				<tr>
					<td>电话:</td>
					<td><input name="phone" type="text" 
						size="15" maxlength="12"></td>
				</tr>

				<tr>
					<td>地址:</td>
					<td><textarea name="addr" cols="60" rows="5"></textarea></td>
				</tr>
			
		</table>
		<br>
		<center>
			<input name="regsubmit" value="提 &nbsp; 交" type="submit"/>
		</center>
	</form>
  </body>
</html>