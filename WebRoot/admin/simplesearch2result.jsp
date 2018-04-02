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
List<Product> products = new ArrayList<Product>();
int pageNo = 1;
int pageCount = 0;
String keyWord = null;
String strCategoryIdsQuery = "";
String strPageNo = request.getParameter("pageno");
	if (strPageNo != null && !strPageNo.trim().equals("")) {
		try {
			pageNo = Integer.parseInt(strPageNo);
		} catch (NumberFormatException e) {
			e.printStackTrace();
			pageNo = 1;
		}
		
	}
%>

<%
//处理多类别下搜索提交的表单       simplesearch2
keyWord = request.getParameter("keyword");
int[] idArray;
String[] strCategoryIds = request.getParameterValues("categoryid");
if (strCategoryIds != null && strCategoryIds.length > 0) {
	
	for (int i=0; i<strCategoryIds.length; i++) {
		strCategoryIdsQuery += "&categoryid=" + strCategoryIds[i];
	}
	
	idArray = new int[strCategoryIds.length];
	for (int i=0; i<strCategoryIds.length; i++) {
		idArray[i] = Integer.parseInt(strCategoryIds[i]);
	}
} else {
	idArray = null;
}
products = new ArrayList<Product>();
pageCount = ProductMgr.getInstance().findProducts(products, idArray, keyWord, -1, 
									  			  -1, -1, -1, 
									  			  null, null, pageNo, 3);
									  			  	
%>

<!-- 显示搜索结果开始  -->
<% 
if (products.size() > 0) {
%>
	<center>搜索结果</center>
<table border="1" align="center">
	<tr>
		<td>产品ID</td>
		<td>产品名称</td>
		<td>产品描述</td>
		<td>市场价</td>
		<td>会员价</td>
		<td>上货时间</td>
		<td>类别ID</td>
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
		<td><%=p.getCategoryId() %></td>
	</tr>
	<% 
 		}
 		%>
</table>
<center>
	共<%=pageCount%>页 第<%=pageNo%>页
</center>
<%
	if (pageNo < pageCount) {
%>
<center>
	<a href="productsearch.jsp?action=<%=action %>&pageno=<%=pageNo + 1%>&keyword=<%=keyWord%><%=strCategoryIdsQuery%>">下一页</a>
</center>
<% 
	} 

	if (pageNo > 1) {
%>
<center>
	<a href="productsearch.jsp?action=<%=action %>&pageno=<%=pageNo - 1%>&keyword=<%=keyWord%><%=strCategoryIdsQuery%>">上一页</a>
</center>
<% 
	} 
}
%>
<!-- 显示搜索结果结束  -->