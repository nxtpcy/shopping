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

String action = request.getParameter("action");
if (action != null && action.trim().equals("modify")) {
	int status = Integer.parseInt(request.getParameter("status"));
	so.setStatus(status);
	so.updateStatus();
	out.println("订单状态修改成功！！");	
}
%>


<center>
	下单人：<%=so.getUser().getId() == -1 ? "未注册用户" : so.getUser().getUsername()%><br>
	订单状态修改：<br>
	<form action="ordermodify.jsp" method="post">
	<input type="hidden" name="action" value="modify">
	<input type="hidden" name="id" value="<%=id%>">
		<select name="status">
			<option value="0" <%=so.getStatus() == 0 ? "selected" : "" %> >未处理</option>
			<option value="1" <%=so.getStatus() == 1 ? "selected" : "" %> >已处理</option>
			<option value="2" <%=so.getStatus() == 2 ? "selected" : "" %> >废单</option>
		</select>
		<input type="submit" value="修改">
	</form>
</center>