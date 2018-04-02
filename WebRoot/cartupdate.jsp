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
	out.println("购物车中没有商品！！");
	response.sendRedirect("index.jsp");
	return;
}

List<CartItem> items = cart.getItems();
for (int i=0; i<items.size(); i++) {
	CartItem ci = items.get(i);
	String strCount = request.getParameter("p" + ci.getProductId());
	if (strCount != null && !strCount.trim().equals("")) {
		int count = Integer.parseInt(strCount);
		ci.setCount(count);
	}
	
}
%>

<center>修改成功！！！</center>
<center>
	<span id="lefttime" style="background:pink">3</span>秒钟后自动返回购物车
</center>
<script type="text/javascript">
<!-- 
	function go() {
		var leftTime = document.getElementById("lefttime").innerHTML;		
		if (leftTime > 0) {
			leftTime -= 1;
			document.getElementById("lefttime").innerHTML = leftTime;
		} else {
			clearInterval(id);
			document.location.href = "cart.jsp";
		}
	}
	
	var id = setInterval(go, 1000);
-->
</script>