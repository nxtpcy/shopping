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
  			<td>订单ID</td>
  			<td>用户名</td>
  			<td>送货地址</td>
  			<td>下单时间</td>
  			<td>订单状态</td>
  			<td>操作</td>
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
	  				<a href="admin/orderdetailshow.jsp?id=<%=order.getId()%>" target="detail">订单明细</a>
	  				&nbsp;
	  				<a href="admin/ordermodify.jsp?id=<%=order.getId()%>" target="detail">订单状态修改</a>
	  			</td>
  			</tr>
  		<% 
  		}
  		%>
  	</table>
  	<center>
  		共<%=pageCount%>页
  		&nbsp;&nbsp;
  		第<%=pageNo%>页
  		&nbsp;&nbsp;
  		<a href="admin/orderlist.jsp?pageno=1">首页</a>
  		&nbsp;&nbsp;
  		<%if (pageNo > 1) {%>
  		<a href="admin/orderlist.jsp?pageno=<%=pageNo - 1%>">上一页</a>
  		&nbsp;&nbsp;
  		<%} %>
  		<%if (pageNo < pageCount) {%>
  		<a href="admin/orderlist.jsp?pageno=<%=pageNo + 1%>">下一页</a>
  		&nbsp;&nbsp;
  		<%} %>
  		<a href="admin/orderlist.jsp?pageno=<%=pageCount%>">尾页</a>
  	</center>   
  </body>
</html>