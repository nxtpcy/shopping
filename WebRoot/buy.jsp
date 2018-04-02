<%@page import="com.bjsxt.shopping.CartItem"%>
<%@page import="com.bjsxt.shopping.Cart"%>
<%@page import="com.bjsxt.shopping.ProductMgr"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="com.bjsxt.shopping.Product"%>
<%@page import="com.bjsxt.shopping.Category"%>
<%@page language="java" import="java.util.*" pageEncoding="GB18030"%>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<%
request.setCharacterEncoding("GB18030");

//check the session to see whether there is a cart in it
Cart cart = (Cart)session.getAttribute("cart");
if (cart == null) {
	cart = new Cart();
}

%>

<%
int id = Integer.parseInt(request.getParameter("id"));
Product p = ProductMgr.getInstance().loadById(id);
CartItem ci = new CartItem();
ci.setProductId(id);
ci.setProductName(p.getName());
ci.setPrice(p.getNormalPrice());
ci.setCount(1);
cart.add(ci);

session.setAttribute("cart", cart); 
response.sendRedirect("cart.jsp");
%>