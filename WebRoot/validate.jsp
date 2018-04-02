<%@page import="com.bjsxt.shopping.UserManager"%>



<%
response.setContentType("text/xml");
response.setHeader("Cache-Control", "no-store"); // HTTP1.1
response.setHeader("Pragma", "no-cache"); // HTTP1.0
response.setDateHeader("Expires", 0); // prevents caching at the proxy server

String username = request.getParameter("username");
boolean result = UserManager.userExists(username);
String userMsg = "";

if (result == true) {
	userMsg = "valid";
} else {
	userMsg = "invalid";
}
response.getWriter().write("<msg>" + userMsg + "</msg>");
%>