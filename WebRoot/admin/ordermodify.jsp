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
	out.println("����״̬�޸ĳɹ�����");	
}
%>


<center>
	�µ��ˣ�<%=so.getUser().getId() == -1 ? "δע���û�" : so.getUser().getUsername()%><br>
	����״̬�޸ģ�<br>
	<form action="ordermodify.jsp" method="post">
	<input type="hidden" name="action" value="modify">
	<input type="hidden" name="id" value="<%=id%>">
		<select name="status">
			<option value="0" <%=so.getStatus() == 0 ? "selected" : "" %> >δ����</option>
			<option value="1" <%=so.getStatus() == 1 ? "selected" : "" %> >�Ѵ���</option>
			<option value="2" <%=so.getStatus() == 2 ? "selected" : "" %> >�ϵ�</option>
		</select>
		<input type="submit" value="�޸�">
	</form>
</center>