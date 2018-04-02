package com.bjsxt.shopping;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import com.bjsxt.shopping.util.DB;

public class CategoryDAO {

	public static void save(Category c) {
		Connection conn = DB.getConn();
		String sql = "insert into category values (null, ?, ?, ?, ?, ?)";
		PreparedStatement pstmt = DB.prepareStmt(conn, sql);
		try {
			
			pstmt.setString(1, c.getName());
			pstmt.setString(2, c.getDescr());
			pstmt.setInt(3, c.getPid());
			pstmt.setInt(4, c.isLeaf() ? 0 : 1);
			pstmt.setInt(5, c.getGrade());
			
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DB.close(pstmt);
			DB.close(conn);
		}
	}
	private static void getCategories(Connection conn, List<Category> list, int id){
		ResultSet rs = null;
		try {
			String sql = "select * from category where pid = " + id;
			rs = DB.executeQuery(conn, sql);
			while (rs.next()) {
				Category c = new Category();
				c.setId(rs.getInt("id"));
				c.setName(rs.getString("name"));
				c.setDescr(rs.getString("descr"));
				c.setPid(rs.getInt("pid"));
				c.setLeaf(rs.getInt("isleaf") == 0 ? true : false);
				c.setGrade(rs.getInt("grade"));
				list.add(c);
				if (!c.isLeaf()) {
					getCategories(conn, list, c.getId());
				}
				
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DB.close(rs);
		}
	}
	
	public static void getCategories(List<Category> list, int id){
		Connection conn = null;
		
		try {
			conn = DB.getConn();
			getCategories(conn, list, id);
		} finally {
			DB.close(conn);
		}
	}
	
	public static void addChildCategory(int pid, String name, String descr) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = DB.getConn();
			
			conn.setAutoCommit(false);
			
			String sql = "insert into category values (null, ?, ?, ?, ?, ?)";
			pstmt = DB.prepareStmt(conn, sql);
		
			rs = DB.executeQuery(conn, "select * from category where id = " + pid);
			int parentGrade = 0;
			if (rs.next()){
				parentGrade = rs.getInt("grade");
			}
			pstmt.setString(1, name);
			pstmt.setString(2, descr);
			pstmt.setInt(3, pid);
			pstmt.setInt(4, 0);
			pstmt.setInt(5, parentGrade + 1);
			//插入子类别
			pstmt.executeUpdate();
			//更新父类别的leaf值为非叶子值1
			DB.executeUpdate(conn, "update category set isleaf = 1 where id = " + pid);
			conn.commit();
			conn.setAutoCommit(true);
			
		} catch (SQLException e) {
			try {
				conn.rollback();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
			e.printStackTrace();
		} finally {
			DB.close(rs);
			DB.close(pstmt);
			DB.close(conn);
		}
	}
	public static Category loadById(int id) {
		Connection conn = null;
		ResultSet rs = null;
		Category c = null;
		
		try {
			conn = DB.getConn();
			rs = DB.executeQuery(conn, "select * from category where id = " + id);
			if (rs.next()){
				c = new Category();
				c.setId(rs.getInt("id"));
				c.setName(rs.getString("name"));
				c.setDescr(rs.getString("descr"));
				c.setPid(rs.getInt("pid"));
				c.setLeaf(rs.getInt("isleaf") == 0 ? true : false);
				c.setGrade(rs.getInt("grade"));
				
			}						
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DB.close(rs);
			DB.close(conn);
		}
		return c;
	}
	public static void deleteCategory(int id, int pid, int leaf) {
		Connection conn = null;
		ResultSet rs = null;
		ResultSet rsCount = null;
		try {
			conn = DB.getConn();			
			conn.setAutoCommit(false);
			
			//非叶子节点
			if (leaf == 1){
				//非叶子节点先递归删掉它所有的孩子们						
				rs = DB.executeQuery(conn, "select * from category where pid = " + id);
				while (rs.next()){
					deleteCategory(rs.getInt("id"), rs.getInt("pid"), rs.getInt("isleaf"));
				}
			}			
			//删完孩子节点后，再删除自己
			DB.executeUpdate(conn, "delete from category where id = " + id);
			
			//检查是否需要更新父类别的leaf值			
			rsCount = DB.executeQuery(conn, "select count(*) from category where pid = " + pid);
			rsCount.next();
			int count = rsCount.getInt(1);
			if (count == 0){
				DB.executeUpdate(conn, "update category set isleaf = 0 where id = " + pid);
			}
						
			conn.commit();
			conn.setAutoCommit(true);			
		} catch (SQLException e) {
			try {
				conn.rollback();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
			e.printStackTrace();
		} finally {
			DB.close(rs);
			DB.close(rsCount);
			DB.close(conn);
		}
	}
	
	
	public static void updateCategory(int id, String name, String descr) {
		Connection conn = null;
		PreparedStatement pstmt = null;		
		try {
			conn = DB.getConn();
						
			String sql = "update category set name = ?,descr = ? where id = ?";
			pstmt = DB.prepareStmt(conn, sql);
			
			pstmt.setString(1, name);
			pstmt.setString(2, descr);
			pstmt.setInt(3, id);
			pstmt.executeUpdate();			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DB.close(pstmt);
			DB.close(conn);
		}
	}
	public static List<Category> getChildren(int id) {
		Connection conn = null;
		ResultSet rs = null;
		List<Category> childrenCategories = new ArrayList<Category>();
		
		try {
			conn = DB.getConn();
			rs = DB.executeQuery(conn, "select * from category where pid = " + id);
			while (rs.next()){
				Category c = new Category();
				c.setId(rs.getInt("id"));
				c.setName(rs.getString("name"));
				c.setDescr(rs.getString("descr"));
				c.setPid(rs.getInt("pid"));
				c.setLeaf(rs.getInt("isleaf") == 0 ? true : false);
				c.setGrade(rs.getInt("grade"));
				childrenCategories.add(c);
				
			}						
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DB.close(rs);
			DB.close(conn);
		}
		return childrenCategories;
	}
}