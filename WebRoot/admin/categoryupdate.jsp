<%@page import="com.bjsxt.shopping.Category"%>
<%@page import="com.bjsxt.shopping.UserManager"%>
<%@ page language="java" import="java.util.*" contentType="text/html; charset=GB18030" pageEncoding="GB18030" %>
<%@ include file="_sessioncheck.jsp" %>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<%
response.setCharacterEncoding("GB18030");
Category c = null;
String action = request.getParameter("action");
String strId = request.getParameter("id");
int id = -1;
if (strId != null && !strId.trim().equals("")){
	id = Integer.parseInt(strId);
	c = Category.loadById(id);
}

if (action != null && action.trim().equals("update")){
	if (id != -1){
	String name = new String(request.getParameter("name").getBytes("8859_1"), "GB18030");
	String descr = new String(request.getParameter("descr").getBytes("8859_1"), "GB18030");
	Category.updateCategory(id, name, descr);
	out.println("类别更新成功！");
	return;
	} else {
		return;
	} 
}
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
   	<form action="admin/categoryupdate.jsp" method="post">
    	<input type="hidden" name="action" value="update"/>
		<input type="hidden" name="id" value="<%=id%>"/>
    	类别名称: 
    	<input type="text" name="name" value="<%=c.getName() %>"/><br>
    	类别描述: 
    	<textarea name="descr" rows="15" cols="80">
    		<%=c.getDescr()%>
    	</textarea>
    	<br>
    	<input type="submit" value="更新"/>
    </form>
  </body>
</html>