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
//���������������ύ�ı�       simplesearch2
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

<!-- ��ʾ���������ʼ  -->
<% 
if (products.size() > 0) {
%>
	<center>�������</center>
<table border="1" align="center">
	<tr>
		<td>��ƷID</td>
		<td>��Ʒ����</td>
		<td>��Ʒ����</td>
		<td>�г���</td>
		<td>��Ա��</td>
		<td>�ϻ�ʱ��</td>
		<td>���ID</td>
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
	��<%=pageCount%>ҳ ��<%=pageNo%>ҳ
</center>
<%
	if (pageNo < pageCount) {
%>
<center>
	<a href="productsearch.jsp?action=<%=action %>&pageno=<%=pageNo + 1%>&keyword=<%=keyWord%><%=strCategoryIdsQuery%>">��һҳ</a>
</center>
<% 
	} 

	if (pageNo > 1) {
%>
<center>
	<a href="productsearch.jsp?action=<%=action %>&pageno=<%=pageNo - 1%>&keyword=<%=keyWord%><%=strCategoryIdsQuery%>">��һҳ</a>
</center>
<% 
	} 
}
%>
<!-- ��ʾ�����������  -->