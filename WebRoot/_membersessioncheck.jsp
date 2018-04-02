<%@page import="com.bjsxt.shopping.*" %>

<%
User u = (User)session.getAttribute("user");
if (u == null){
	out.println("ÄúÉÐÎ´µÇÂ¼£¡ÇëÖØÐÂµÇÂ¼£¡");
	return;
}
%>