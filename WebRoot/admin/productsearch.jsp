<%@page import="com.bjsxt.shopping.ProductMgr"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="com.bjsxt.shopping.Product"%>
<%@page import="com.bjsxt.shopping.Category"%>
<%@ page language="java" import="java.util.*" pageEncoding="GB18030"%>
<%@ include file="_sessioncheck.jsp" %>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<% 
request.setCharacterEncoding("GB18030");
List<Category> categories = Category.getCategories();

String action = request.getParameter("action");
if (action != null && action.trim().equals("complexsearch")){
%>
	<jsp:forward page="complexsearchresult.jsp"></jsp:forward>
<%
}
if (action != null && action.trim().equals("simplesearch2")){
%>
	<jsp:forward page="simplesearch2result.jsp"></jsp:forward>
<%
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
	<script type="text/javascript">
	<!-- 
		function checkdata() {
			with (document.forms["complex"]) {
				if (lownormalprice.value == null || lownormalprice.value == "") {
					lownormalprice.value = -1;
				}
				if (highnormalprice.value == null || highnormalprice.value == "") {
					highnormalprice.value = -1;
				}
				if (lowmemberprice.value == null || lowmemberprice.value == "") {
					lowmemberprice.value = -1;
				}
				if (highmemberprice.value == null || highmemberprice.value == "") {
					highmemberprice.value = -1;
				}
			}
		}
	-->
	</script>
  </head>
  
  <body>
  	<center>������</center>
   	<form action="admin/productsearch.jsp" method="post">
   		<input type="hidden" name="action" value="simplesearch"/>
   		���<select></select>
   		�ؼ��֣�<input type="text" name="keyword">
   		<input type="submit" value="����">
   	</form>
   	
   	<center>�����������</center>
   	<form action="admin/productsearch.jsp" method="post">
   		<input type="hidden" name="action" value="simplesearch2"/>
   		���<br>
   		<%
		for (Iterator<Category> it = categories.iterator(); it.hasNext(); ) {
			Category c = it.next();
			if (c.isLeaf()) {									
		%>
				<input type="checkbox" name="categoryid" value="<%=c.getId()%>"> <%=c.getName() %> <br>
		<%
			} else {
		%>
				<%=c.getName() %> <br>
		<%	
			} 
		}
		%>
   		�ؼ��֣�<input type="text" name="keyword">
   		<input type="submit" value="����">
   	</form>
   	
   	<center>�߼�����</center>
   	<form action="admin/productsearch.jsp" method="post" name="complex" onsubmit="checkdata()" >
   	<input type="hidden" name="action" value="complexsearch"/>
   		<table>
   			<tr>
   				<td>���</td>
   				<td>
   					<select name="categoryid">
   						<option value="0">�������</option>
   					<%
   					for (Iterator<Category> it = categories.iterator(); it.hasNext(); ) {
   						Category c = it.next();
   						String preStr = "";
   						for (int i = 1; i < c.getGrade(); i++) {
   							preStr += "--";
   						}
   					%>
   						<option value="<%=c.getId()%>"><%=preStr + c.getName() %></option>
   					<%
   					}
   					%>
   					</select>
   				</td>
   			</tr>
   			<tr>
   				<td>�ؼ��֣�</td>
   				<td>
   					<input type="text" name="keyword">
   				</td>
   			</tr>
   			<tr>
   				<td>�г��ۣ�</td>
   				<td>
   					From: <input type="text" name="lownormalprice"><br><br>
   					To: <input type="text" name="highnormalprice">
   				</td>
   			</tr>
   			<tr>
   				<td>��Ա�ۣ�</td>
   				<td>
   					From: <input type="text" name="lowmemberprice"><br><br>
   					To: <input type="text" name="highmemberprice">
   				</td>
   			</tr>
   			<tr>
   				<td>�ϻ�ʱ�䣺</td>
   				<td>
   					From: <input type="text" name="startdate"><br><br>
   					To: <input type="text" name="enddate">
   				</td>
   			</tr>
   			<tr>
   				<td colspan="2"><input type="submit" value="����"></td>
   			</tr>
   		</table>
   	</form>
  </body>
</html>