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

public class UserManager {
	public static List<User> getUsers() {
		List<User> list = new ArrayList<User>();
		Connection conn = null;
		ResultSet rs = null;
		
		try {
			conn = DB.getConn();
			String sql = "select * from ruser";
			rs = DB.executeQuery(conn, sql);
			while (rs.next()) {
				User u = new User();
				u.setId(rs.getInt("id"));
				u.setUsername(rs.getString("username"));
				u.setPassword(rs.getString("password"));
				u.setPhone(rs.getString("phone"));
				u.setAddr(rs.getString("addr"));
				u.setRdate(rs.getTimestamp("rdate"));
				list.add(u);
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DB.close(rs);
			DB.close(conn);
		}
		return list;
	}
	
	public static void deleteUser(int id) {
		
		Connection conn = null;
		Statement stmt = null;
		
		try {
			conn = DB.getConn();
			stmt = DB.getStmt(conn);
			String sql = "delete from ruser where id = " + id;
			DB.executeUpdate(stmt, sql);
			
		} finally {
			DB.close(stmt);
			DB.close(conn);
		}
	}
	
	public static User validate(String username, String password) throws UserNotFoundException, PasswordNotCorrectException {
		
		Connection conn = null;
		ResultSet rs = null;
		User u = null;
		String sql = "select * from ruser where username = '" + username + "'";
		
		try {
			conn = DB.getConn();
			rs = DB.executeQuery(conn, sql);
			if (!rs.next()){
				//username doesn't exist!
				throw new UserNotFoundException();
				
			} else if (!rs.getString("password").equals(password)) {
				throw new PasswordNotCorrectException();
			} else {
				u = new User();
				u.setId(rs.getInt("id"));
				u.setUsername(rs.getString("username"));
				u.setPassword(rs.getString("password"));
				u.setPhone(rs.getString("phone"));
				u.setAddr(rs.getString("addr"));
				u.setRdate(rs.getTimestamp("rdate"));
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DB.close(rs);
			DB.close(conn);
		}
		return u;
	}
	
	public static boolean userExists(String username) {
		Connection conn = null;
		ResultSet rs = null;
		String sql = "select * from ruser where username = '" + username + "'";
		boolean result = false;
		
		try {
			conn = DB.getConn();
			rs = DB.executeQuery(conn, sql);
			if (!rs.next()){
				//username还未被使用，可以注册！！
				result = true;
			} else {
				result = false;
			} 
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DB.close(rs);
			DB.close(conn);
		}
		return result;
	}
}