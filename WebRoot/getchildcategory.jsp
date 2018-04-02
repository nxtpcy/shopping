<%@page import="java.util.ArrayList"%>
<%@page import="com.bjsxt.shopping.Category"%>
<%@page import="java.util.List"%>
<%@page import="com.bjsxt.shopping.UserManager"%>
<%@ page language="java" pageEncoding="GB18030"%>

<%
request.setCharacterEncoding("GB18030");

response.setContentType("text/xml");
response.setHeader("Cache-Control", "no-store"); // HTTP1.1
response.setHeader("Pragma", "no-cache"); // HTTP1.0
response.setDateHeader("Expires", 0); // prevents caching at the proxy server
String idStr = request.getParameter("id");
int id = -1;

if (idStr != null && !idStr.trim().equals("")) {
	id = Integer.parseInt(idStr);
}
if (id != -1) {
	Category parent = Category.loadById(id);
	List<Category> childrenCategories = parent.getChildren();
	StringBuffer buf = new StringBuffer();
	
	/* for (int i=0; i<childrenCategories.size(); i++) {
		Category c = childrenCategories.get(i);
		buf.append(c.getId() + "," + c.getName() + "-");
	}
	// delete the last '-' of the string(StringBuffer)
	if (childrenCategories.size() > 0) {
		buf.deleteCharAt(buf.length() - 1);
	} */
	for (int i=0; i<childrenCategories.size(); i++) {
		Category c = childrenCategories.get(i);
		buf.append("<category><id>" + c.getId() + "</id><name>" + c.getName() + "</name></category>");
	}
	buf.insert(0, "<?xml version='1.0' encoding='GB18030'?><categories>");
	buf.append("</categories>");
	
	System.out.println(buf.toString().trim());
	response.getWriter().write(buf.toString().trim());
}
%>