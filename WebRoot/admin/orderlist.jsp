<%@ page language="java" import="java.util.*" pageEncoding="GB18030"%>
<%@ page import="java.sql.*, java.util.*, com.bjsxt.shopping.*" %>
<%@ include file="_sessioncheck.jsp" %>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>


<%!
private static final int PAGE_SIZE = 3;
%>

<%
String strPageNo = request.getParameter("pageno");
int pageNo = 1;
if (strPageNo != null) {
	try {
		pageNo = Integer.parseInt(strPageNo);
	} catch (NumberFormatException e) {
		e.printStackTrace();
		return;
	}
	if (pageNo < 1) {
		pageNo = 1;
	}
		
}
%>

<%
List<SalesOrder> orders = new ArrayList<SalesOrder>();
int pageCount = OrderMgr.getInstance().getOrders(orders, pageNo, PAGE_SIZE);
if (pageNo > pageCount) {
	pageNo = pageCount;
}
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'userlist.jsp' starting page</title>
    
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
  	<table border="1" align="center">
  		<tr>
  			<td>����ID</td>
  			<td>�û���</td>
  			<td>�ͻ���ַ</td>
  			<td>�µ�ʱ��</td>
  			<td>����״̬</td>
  			<td>����</td>
  		</tr>
  		<%
  		for (Iterator<SalesOrder> it = orders.iterator(); it.hasNext(); ){
  			SalesOrder order = it.next();
  		%>
  			<tr>
	  			<td><%=order.getId() %></td>
	  			<td><%=order.getUser().getUsername() %></td>
	  			<td><%=order.getAddr() %></td>
	  			<td><%=order.getoDate() %></td>
	  			<td><%=order.getStatus() %></td>
	  			<td>
	  				<a href="admin/orderdetailshow.jsp?id=<%=order.getId()%>" target="detail">������ϸ</a>
	  				&nbsp;
	  				<a href="admin/ordermodify.jsp?id=<%=order.getId()%>" target="detail">����״̬�޸�</a>
	  			</td>
  			</tr>
  		<% 
  		}
  		%>
  	</table>
  	<center>
  		��<%=pageCount%>ҳ
  		&nbsp;&nbsp;
  		��<%=pageNo%>ҳ
  		&nbsp;&nbsp;
  		<a href="admin/orderlist.jsp?pageno=1">��ҳ</a>
  		&nbsp;&nbsp;
  		<%if (pageNo > 1) {%>
  		<a href="admin/orderlist.jsp?pageno=<%=pageNo - 1%>">��һҳ</a>
  		&nbsp;&nbsp;
  		<%} %>
  		<%if (pageNo < pageCount) {%>
  		<a href="admin/orderlist.jsp?pageno=<%=pageNo + 1%>">��һҳ</a>
  		&nbsp;&nbsp;
  		<%} %>
  		<a href="admin/orderlist.jsp?pageno=<%=pageCount%>">βҳ</a>
  	</center>   
  </body>
</html>