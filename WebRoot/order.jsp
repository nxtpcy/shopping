<%@page import="com.bjsxt.shopping.User"%>
<%@page import="com.bjsxt.shopping.SalesOrder"%>
<%@page import="com.bjsxt.shopping.CartItem"%>
<%@page import="com.bjsxt.shopping.Cart"%>
<%@page import="com.bjsxt.shopping.ProductMgr"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="com.bjsxt.shopping.Product"%>
<%@page import="com.bjsxt.shopping.Category"%>
<%@page language="java" import="java.util.*" pageEncoding="GB18030"%>

<%
request.setCharacterEncoding("GB18030");

//check the session to see whether there is a cart in it
Cart cart = (Cart)session.getAttribute("cart");
if (cart == null) {
	out.println("���ﳵ��û����Ʒ����");
	return;
}

User user = (User)session.getAttribute("user");
if (user == null) {
	user = new User();
	user.setId(-1);
}

String addr = new String(request.getParameter("addr").getBytes(), "GB18030");
SalesOrder so = new SalesOrder();
so.setAddr(addr);
so.setCart(cart);
so.setoDate(new Timestamp(System.currentTimeMillis()));
so.setStatus(0);
so.setUser(user);
so.save();
session.removeAttribute("cart");
out.println("�µ��ɹ������Ķ����ѱ��棬���ǻᾡ��Ϊ����������Thank You����");
%>
