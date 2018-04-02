<%@page import="com.bjsxt.shopping.Category"%>
<%@ page language="java" import="java.util.*" pageEncoding="GB18030"%>
<%@ include file="_sessioncheck.jsp" %>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<%
request.setCharacterEncoding("GB18030");
String strPid = request.getParameter("pid");
int pid = 0;
if (strPid != null)
{
	pid = Integer.parseInt(strPid);
}
String action = request.getParameter("action");
if (action != null && action.trim().equals("add")){
	String name = request.getParameter("name");
	String descr = request.getParameter("descr");
	if (pid == 0) {
		Category.addTopCategory(name, descr);
		out.println("添加根类别成功！！！");
		return;
	} else {
		//添加子类别
		//Category.addChildCategory(pid, name, descr);
		Category parent = Category.loadById(pid);
		Category child = new Category();
		child.setName(name);
		child.setDescr(descr);
		parent.addChild(child);
		
		out.println("添加子类别成功！！！");
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
   	<center>添加类别</center>
   	<form action="admin/categoryadd.jsp" method="post">
   	<input type="hidden" name="action" value="add"/>
   	<input type="hidden" name="pid" value="<%=pid%>"/>
   		<table>
   			<tr>
   				<td>类别名称：</td>
   				<td><input type="text" name="name"></td>
   			</tr>
   			<tr>
   				<td>类别描述：</td>
   				<td>
   					<textarea name="descr" rows="8" cols="40"></textarea>
   				</td>
   			</tr>
   			<tr>
   				<td colspan="2"><input type="submit" value="提交"></td>
   			</tr>
   		</table>
   	</form>
  </body>
</html>