package com.bjsxt.shopping;

import java.sql.Timestamp;
import java.util.List;

public class SalesOrder {
	private User user;
	private int id;
	private Timestamp oDate;
	private String addr;
	private Cart cart;
	private int status;
	
	
	
	
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public Timestamp getoDate() {
		return oDate;
	}
	public void setoDate(Timestamp oDate) {
		this.oDate = oDate;
	}
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	public Cart getCart() {
		return cart;
	}
	public void setCart(Cart cart) {
		this.cart = cart;
	}
	
	public void save() {
		OrderMgr.getInstance().saveOrder(this);
	}
	
	public List<SalesItem> getItems() {
		return OrderMgr.getInstance().getItems(this);
	}
	
	public void updateStatus() {
		OrderMgr.getInstance().updateStatus(this);
	}
	
}