<%@page contentType="text/html; charset=GB18030" import="java.util.ArrayList"%>
<%@page import="com.bjsxt.shopping.Category"%>
<%@page import="java.util.List"%>
<%@page import="com.bjsxt.shopping.UserManager"%>
<%@ page language="java" pageEncoding="GB18030"%>

<%
request.setCharacterEncoding("GB18030");

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
	
	for (int i=0; i<childrenCategories.size(); i++) {
		Category c = childrenCategories.get(i);
		buf.append("document.categoryform.category2.options[" + (i+1) + "].text = '" + c.getName() + "';\n");
		buf.append("document.categoryform.category2.options[" + (i+1) + "].value = '" + c.getId() + "';\n");
	}
	
	buf.insert(0, "document.categoryform.category2.options[0].value = '-1';\n");
	buf.insert(0, "document.categoryform.category2.options[0].text = '查询二级类别';\n");
	buf.insert(0, "document.categoryform.category2.selectedIndex = 0;\n");
	
	buf.insert(0, "document.categoryform.category2.length = " + (childrenCategories.size()+1) + ";\n");
	
	response.getWriter().write(buf.toString().trim());
}
%>