package com.bjsxt.shopping.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.bjsxt.shopping.Cart;
import com.bjsxt.shopping.CartItem;
import com.bjsxt.shopping.Category;
import com.bjsxt.shopping.Product;
import com.bjsxt.shopping.SalesItem;
import com.bjsxt.shopping.SalesOrder;
import com.bjsxt.shopping.User;
import com.bjsxt.shopping.util.DB;

public class OrderMySQLDAO {

	public void saveOrder(SalesOrder so) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rsKey = null;
		
		try {
			conn = DB.getConn();
			
			conn.setAutoCommit(false);
			
			String sql = "insert into salesorder values (null, ?, ?, ?, ?)";
			pstmt = DB.prepareStmt(conn, sql, true);
			pstmt.setInt(1, so.getUser().getId());
			pstmt.setString(2, so.getAddr());
			pstmt.setTimestamp(3, so.getoDate());
			pstmt.setInt(4, so.getStatus());
			
			pstmt.executeUpdate();
			rsKey = pstmt.getGeneratedKeys();
			rsKey.next();
			int orderId = rsKey.getInt(1);
			
			String sqlItem = "insert into salesitem values (null, ?, ?, ?, ?)";
			pstmt = DB.prepareStmt(conn, sqlItem);
			Cart cart = so.getCart();
			List<CartItem> items = cart.getItems();
			for (int i = 0; i < items.size(); i++) {
				CartItem ci = items.get(i);
				pstmt.setInt(1, ci.getProductId());
				pstmt.setDouble(2, ci.getPrice());
				pstmt.setInt(3, ci.getCount());
				pstmt.setInt(4, orderId);
				pstmt.addBatch();
			}
			pstmt.executeBatch();
			
			conn.commit();
			conn.setAutoCommit(true);
			
		} catch (SQLException e) {
			try {
				conn.setAutoCommit(true);
				conn.rollback();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
			e.printStackTrace();
		} finally {
			DB.close(rsKey);
			DB.close(pstmt);
			DB.close(conn);
		}
	}

	public int getOrders(List<SalesOrder> orders, int pageNo, int pageSize) {
		Connection conn = null;
		ResultSet rs = null;
		ResultSet rsCount = null;
		int pageCount = 0;
		
		try {
			conn = DB.getConn();
			rsCount = DB.executeQuery(conn, "select count(*) from salesorder");
			rsCount.next();
			pageCount = (rsCount.getInt(1) + pageSize - 1) / pageSize;
			
			String sql = "select salesorder.id, salesorder.userid, salesorder.addr, salesorder.odate, salesorder.status, ruser.id uid, ruser.username,"
					   + " ruser.password, ruser.phone, ruser.addr uaddr, ruser.rdate"
					   + " from salesorder left join ruser on (salesorder.userid = ruser.id) limit " + (pageNo - 1) * pageSize + "," + pageSize;
			System.out.println(sql);
			
			rs = DB.executeQuery(conn, sql);
			while (rs.next()) {
				
				User user = new User();
				user.setId(rs.getInt("userid"));
				user.setUsername(rs.getString("username"));
				user.setPassword(rs.getString("password"));
				user.setAddr(rs.getString("uaddr"));
				user.setPhone(rs.getString("phone"));
				user.setRdate(rs.getTimestamp("rdate"));
				
				SalesOrder so = new SalesOrder();
				so.setId(rs.getInt("id"));
				so.setAddr(rs.getString("addr"));
				so.setoDate(rs.getTimestamp("odate"));
				so.setStatus(rs.getInt("status"));
				so.setUser(user);
				
				orders.add(so);			
				
			}
			
		} catch (SQLException e) {
			e.printStackTrace();			
		} finally {
			DB.close(rsCount);
			DB.close(rs);
			DB.close(conn);
		}
		return pageCount;
	}

	public SalesOrder loadById(int id) {
		Connection conn = null;
		ResultSet rs = null;
		SalesOrder so = null;
		
		try {
			conn = DB.getConn();
			
			String sql = "select salesorder.id, salesorder.userid, salesorder.addr, salesorder.odate, salesorder.status, ruser.id uid, ruser.username,"
					   + " ruser.password, ruser.phone, ruser.addr uaddr, ruser.rdate"
					   + " from salesorder left join ruser on (salesorder.userid = ruser.id) where salesorder.id = " + id;
			System.out.println(sql);
			
			rs = DB.executeQuery(conn, sql);
			if (rs.next()) {
				
				User user = new User();
				user.setId(rs.getInt("userid"));
				user.setUsername(rs.getString("username"));
				user.setPassword(rs.getString("password"));
				user.setAddr(rs.getString("uaddr"));
				user.setPhone(rs.getString("phone"));
				user.setRdate(rs.getTimestamp("rdate"));
				
				so = new SalesOrder();
				so.setId(rs.getInt("id"));
				so.setAddr(rs.getString("addr"));
				so.setoDate(rs.getTimestamp("odate"));
				so.setStatus(rs.getInt("status"));
				so.setUser(user);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();			
		} finally {
			DB.close(rs);
			DB.close(conn);
		}
		return so;
	}

	public List<SalesItem> getItems(SalesOrder order) {
		Connection conn = null;
		ResultSet rs = null;
		List<SalesItem> items = new ArrayList<SalesItem>();
		
		try {
			conn = DB.getConn();
			
			String sql = "select salesitem.id, salesitem.productid, salesitem.unitprice, salesitem.pcount, salesitem.orderid, product.id pid, product.name,"
					   + " product.descr, product.memberprice, product.normalprice, product.pdate, product.categoryid"
					   + " from salesitem join product on (salesitem.productid = product.id) where  salesitem.orderid = " + order.getId();
			System.out.println(sql);
			
			rs = DB.executeQuery(conn, sql);
			while (rs.next()) {
				
				Product p = new Product();
				p.setId(rs.getInt("pid"));
				p.setCategoryId(rs.getInt("categoryid"));
				p.setName(rs.getString("name"));
				p.setDescr(rs.getString("descr"));
				p.setNormalPrice(rs.getDouble("normalprice"));
				p.setMemberPrice(rs.getDouble("memberprice"));
				p.setPdate(rs.getTimestamp("pdate"));
				
				
				SalesItem si = new SalesItem();
				si.setId(rs.getInt("id"));
				si.setProduct(p);
				si.setUnitprice(rs.getDouble("unitprice"));
				si.setCount(rs.getInt("pcount"));
				si.setOrder(order);
				
				items.add(si);		
				
			}
			
		} catch (SQLException e) {
			e.printStackTrace();			
		} finally {
			DB.close(rs);
			DB.close(conn);
		}
		return items;
	}

	public void updateStatus(SalesOrder order) {
		Connection conn = null;
		
		try {
			conn = DB.getConn();						
			String sql = "update salesorder set status = " + order.getStatus() + " where id = " + order.getId();
			DB.executeUpdate(conn, sql);
		} finally {
			DB.close(conn);
		}
	}

}