<%@ page language="java" import="java.util.*" pageEncoding="GB18030"%>
<%@ page import="java.sql.*, java.util.*, com.bjsxt.shopping.*" %>
<%@ include file="_sessioncheck.jsp" %>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<%
int id = Integer.parseInt(request.getParameter("id"));
SalesOrder so = OrderMgr.getInstance().loadById(id);
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>������ϸ</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<script type="text/javascript">
		function showProductInfo(descr) {
			document.getElementById("productInfo").innerHTML = "<font size=3 color=red>" + descr + "</font>";
		}
	</script>
  </head>
  
  <body>
  	<center>
  		�µ��ˣ�<%=so.getUser().getId() == -1 ? "δע���û�" : so.getUser().getUsername()%><br>
  		��ϸ��<br>
  	</center>
  	<table border="1" align="center">
   			<tr>
   				<td>��Ʒ����</td>
   				<td>��Ʒ�۸�</td>
   				<td>��������</td>
   			</tr>
   			<%
   			List<SalesItem> items = so.getItems();
   			for (int i=0; i<items.size(); i++) {
   				SalesItem si = items.get(i);
   			%>
   			<tr>
   				<td onmouseover="showProductInfo('<%=si.getProduct().getDescr()%>')" ><%=si.getProduct().getName()%></td>
   				<td><%=si.getUnitprice()%>Ԫ</td>
   				<td><%=si.getCount()%></td>
   			</tr>
   			<% 
   			}
   			%> 			
   	</table>
   	<center>
	   	<div style="border:5px double purple;width:400;" id="productInfo">
	   		&nbsp;
	   	</div>
   	</center>
  </body>
</html>