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
String action = request.getParameter("action");
String strCategoryId = request.getParameter("categoryid");
int categoryId = 0;
if (strCategoryId != null && !strCategoryId.trim().equals("")) {
	categoryId = Integer.parseInt(strCategoryId);
}

if (action != null && action.trim().equals("add")){
	String name = request.getParameter("name");
	String descr = request.getParameter("descr");
	double normalPrice = Double.parseDouble(request.getParameter("normalprice"));
	double memberPrice = Double.parseDouble(request.getParameter("memberprice"));
	
	
	Category c = Category.loadById(categoryId);
	if (!c.isLeaf()) {
		out.println("非叶子结点下不能添加商品！");
		return;
	}
	
	Product p = new Product();
	p.setId(-1);
	p.setName(name);
	p.setDescr(descr);
	p.setNormalPrice(normalPrice);
	p.setMemberPrice(memberPrice);
	p.setPdate(new Timestamp(System.currentTimeMillis()));
	p.setCategoryId(categoryId);
	
	ProductMgr.getInstance().addProduct(p);
		
	out.println("添加商品成功！！！");	
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
		var arrLeaf = new Array();
		<!--
			function checkdata() {
				if (arrLeaf[document.forms["form"].categoryid.selectedIndex] != "leaf") {
					alert("不能选择非叶子结点！");
					document.forms["form"].categoryid.focus();
					return false;
				}
				return true;
			}
		-->
	</script>
  </head>
  
  <body>
   	<center>添加产品</center>
   	<form action="admin/productadd.jsp" method="post" name="form" onsubmit="return checkdata()" >
   	<input type="hidden" name="action" value="add"/>
   		<table>
   			<tr>
   				<td>产品名称：</td>
   				<td><input type="text" name="name"></td>
   			</tr>
   			<tr>
   				<td>产品描述：</td>
   				<td>
   					<textarea name="descr" rows="8" cols="40"></textarea>
   				</td>
   			</tr>
   			<tr>
   				<td>市场价：</td>
   				<td><input type="text" name="normalprice"></td>
   			</tr>
   			<tr>
   				<td>会员价：</td>
   				<td><input type="text" name="memberprice"></td>
   			</tr>
   			<tr>
   				<td>
   					类别：
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
   						<option value="<%=c.getId()%>" <%=c.getId() == categoryId ? "selected" : "" %>><%=preStr + c.getName() %></option>
   					<% 
   						index++;
   					}
   					%>
   					</select>
   				</td>
   			</tr>
   			<tr>
   				<td colspan="2"><input type="submit" value="提交"></td>
   			</tr>
   		</table>
   	</form>
  </body>
</html>