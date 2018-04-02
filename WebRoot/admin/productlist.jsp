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
List<Product> products = new ArrayList<Product>();
int pageCount = ProductMgr.getInstance().getProducts(products, pageNo, PAGE_SIZE);
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
  			<td>产品ID</td>
  			<td>产品名称</td>
  			<td>产品描述</td>
  			<td>市场价</td>
  			<td>会员价</td>
  			<td>上货时间</td>
  			<td>所属类别</td>
  			<td>操作</td>
  		</tr>
  		<%
  		for (Iterator<Product> it = products.iterator(); it.hasNext(); ){
  			Product p = it.next();
  		%>
  			<tr>
	  			<td><%=p.getId() %></td>
	  			<td><%=p.getName() %></td>
	  			<td><%=p.getDescr() %></td>
	  			<td><%=p.getNormalPrice() %></td>
	  			<td><%=p.getMemberPrice() %></td>
	  			<td><%=p.getPdate() %></td>
	  			<td><%=p.getCategory().getName()%></td>
	  			<td>
	  				<a href="admin/productdelete.jsp?id=<%=p.getId() %>" target="detail" onclick="return confirm('您确定要删除该商品吗？')">删除</a>&nbsp;&nbsp;&nbsp;&nbsp;
	  				<a href="admin/productmodify.jsp?id=<%=p.getId() %>" target="detail">修改</a>&nbsp;&nbsp;&nbsp;&nbsp;
	  				<a href="admin/productimageup.jsp?id=<%=p.getId() %>" target="detail">图片上传</a>
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
  		<a href="admin/productlist.jsp?pageno=1">首页</a>
  		&nbsp;&nbsp;
  		<%if (pageNo > 1) {%>
  		<a href="admin/productlist.jsp?pageno=<%=pageNo - 1%>">上一页</a>
  		&nbsp;&nbsp;
  		<%} %>
  		<%if (pageNo < pageCount) {%>
  		<a href="admin/productlist.jsp?pageno=<%=pageNo + 1%>">下一页</a>
  		&nbsp;&nbsp;
  		<%} %>
  		<a href="admin/productlist.jsp?pageno=<%=pageCount%>">尾页</a>
  	</center>   
  </body>
</html>