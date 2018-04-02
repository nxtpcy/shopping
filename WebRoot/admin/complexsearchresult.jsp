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
double lowNormalPrice = -1;
double highNormalPrice = -1;
double lowMemberPrice = -1;
double highMemberPrice = -1; 
String strEndDate = null;
String strStartDate = null;
int categoryId = 0;
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
request.setCharacterEncoding("GB18030");
keyWord = request.getParameter("keyword");
lowNormalPrice = Double.parseDouble(request.getParameter("lownormalprice"));
highNormalPrice = Double.parseDouble(request.getParameter("highnormalprice"));
lowMemberPrice = Double.parseDouble(request.getParameter("lowmemberprice"));
highMemberPrice = Double.parseDouble(request.getParameter("highmemberprice"));
Timestamp startDate;
strStartDate = request.getParameter("startdate");
if (strStartDate == null || strStartDate.trim().equals("")) {
	startDate = null;
} else {
	startDate = Timestamp.valueOf(strStartDate);
}

Timestamp endDate;
strEndDate = request.getParameter("enddate");
if (strEndDate == null || strEndDate.trim().equals("")) {
	endDate = null;
} else {
	endDate = Timestamp.valueOf(strEndDate);
}

int[] idArray;
categoryId = Integer.parseInt(request.getParameter("categoryid"));
if (categoryId == 0) {
idArray = null;
} else {
	idArray = new int[1];
	idArray[0] = categoryId;
}

products = new ArrayList<Product>();
pageCount = ProductMgr.getInstance().findProducts(products, idArray, keyWord, lowNormalPrice, 
									  highNormalPrice, lowMemberPrice, highMemberPrice, 
									  startDate, endDate, pageNo, 2);
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
	<a href="productsearch.jsp?action=<%=action%>&pageno=<%=pageNo + 1%>&keyword=<%=keyWord%>&lownormalprice=<%=lowNormalPrice %>&highnormalprice=<%=highNormalPrice%>&lowmemberprice=<%=lowMemberPrice %>&highmemberprice=<%=highMemberPrice %>&startdate=<%=strStartDate %>&enddate=<%=strEndDate %>&categoryid=<%=categoryId %>">��һҳ</a>
</center>
<% 
	} 

	if (pageNo > 1) {
%>
<center>
	<a href="productsearch.jsp?action=<%=action%>&pageno=<%=pageNo - 1%>&keyword=<%=keyWord%>&lownormalprice=<%=lowNormalPrice %>&highnormalprice=<%=highNormalPrice%>&lowmemberprice=<%=lowMemberPrice %>&highmemberprice=<%=highMemberPrice %>&startdate=<%=strStartDate %>&enddate=<%=strEndDate %>&categoryid=<%=categoryId %>">��һҳ</a>
</center>
<% 
	} 
}
%>
<!-- ��ʾ�����������  -->