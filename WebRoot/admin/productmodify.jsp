<%@ page language="java" import="java.util.*" pageEncoding="GB18030"%>
<%@ page import="java.sql.*, java.util.*, com.bjsxt.shopping.*" %>
<%@ include file="_sessioncheck.jsp" %>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<%
request.setCharacterEncoding("GB18030");
String action = request.getParameter("action");

String strId = request.getParameter("id");
int id = 0;
if (strId != null && !strId.trim().equals("")) {
	try {
		id = Integer.parseInt(strId);
	} catch (NumberFormatException e) {
		e.printStackTrace();
		out.println("Error Id!!");
		return;
		
	}
	
}
Product p = ProductMgr.getInstance().loadById(id);

if (action != null && action.trim().equals("modify")){
	String name = request.getParameter("name");
	String descr = request.getParameter("descr");
	double normalPrice = Double.parseDouble(request.getParameter("normalprice"));
	double memberPrice = Double.parseDouble(request.getParameter("memberprice"));
	int categoryId = Integer.parseInt(request.getParameter("categoryid"));
	
	Category c = Category.loadById(categoryId);
	if (!c.isLeaf()) {
		out.println("��Ҷ�ӽ���²�������Ʒ��");
		return;
	}
	
	p.setName(name);
	p.setDescr(descr);
	p.setNormalPrice(normalPrice);
	p.setMemberPrice(memberPrice);
	p.setCategoryId(categoryId);
	
	boolean info = ProductMgr.getInstance().updateProduct(p);
	if (info) {
		out.println("�޸���Ʒ�ɹ�������");
	%>
	<script type="text/javascript">
		window.parent.main.location.reload();
	</script>
	<% 
	} else {
		out.println("�޸���Ʒʧ�ܣ�����");
	}		
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

	<script type="text/javascript">
		var arrLeaf = new Array();
		<!--
			function checkdata() {
				if (arrLeaf[document.forms["form"].categoryid.selectedIndex] != "leaf") {
					alert("����ѡ���Ҷ�ӽ�㣡");
					document.forms["form"].categoryid.focus();
					return false;
				}
				return true;
			}
		-->
	</script>

  </head>
  
  <body>
	<center>�޸Ĳ�Ʒ</center>
   	<form action="admin/productmodify.jsp" method="post" name="form" onsubmit="return checkdata()" >
   	<input type="hidden" name="action" value="modify"/>
   	<input type="hidden" name="id" value="<%=id %>"/>
   		<table>
   			<tr>
   				<td>��Ʒ���ƣ�</td>
   				<td><input type="text" name="name" value="<%=p.getName()%>"></td>
   			</tr>
   			<tr>
   				<td>��Ʒ������</td>
   				<td>
   					<textarea name="descr" rows="8" cols="40"><%=p.getDescr()%></textarea>
   				</td>
   			</tr>
   			<tr>
   				<td>�г��ۣ�</td>
   				<td><input type="text" name="normalprice" value="<%=p.getNormalPrice()%>"></td>
   			</tr>
   			<tr>
   				<td>��Ա�ۣ�</td>
   				<td><input type="text" name="memberprice" value="<%=p.getMemberPrice()%>"></td>
   			</tr>
   			<tr>
   				<td>
   					���
   				</td>
   				<td>
   					<select name="categoryid">
   					<%
   					List<Category> categories = Category.getCategories();
   					int index = 0;
   					for (Iterator<Category> it = categories.iterator(); it.hasNext(); ) {
   						Category c = it.next();
   						String preStr = "";
   						for (int i = 1; i < c.getGrade(); i++) {
   							preStr += "--";
   						}
   					%>
   						<script type="text/javascript">
   							<!--
   							arrLeaf[<%=index%>] = '<%=c.isLeaf() ? "leaf" : "notleaf" %>';
   							-->
   						</script>
   						<option value="<%=c.getId()%>" <%=c.getId() == p.getCategoryId() ? "selected" : "" %>><%=preStr + c.getName() %></option>
   					<% 
   						index++;
   					}
   					%>
   					</select>
   				</td>
   			</tr>
   			<tr>
   				<td colspan="2"><input type="submit" value="�޸�"></td>
   			</tr>
   		</table>
   	</form>  	  
  </body>
</html>