package com.bjsxt.shopping;

import java.util.List;

import com.bjsxt.shopping.dao.OrderMySQLDAO;

public class OrderMgr {
	private static OrderMgr om = null;
	private OrderMySQLDAO dao = null;
	
	static {
		if (om == null) {
			om = new OrderMgr();
			om.setDao(new OrderMySQLDAO());
		}
	}
	
	private OrderMgr() {}
	
	public static OrderMgr getInstance() {
		return om;
	}
	
	
	public OrderMySQLDAO getDao() {
		return dao;
	}

	public void setDao(OrderMySQLDAO dao) {
		this.dao = dao;
	}

	public void saveOrder(SalesOrder so) {
		dao.saveOrder(so);
	}
	
	public int getOrders(List<SalesOrder> orders, int pageNo, int pageSize) {
		return dao.getOrders(orders, pageNo, pageSize);
	}
	
	public SalesOrder loadById(int id) {
		return dao.loadById(id);
	}

	public List<SalesItem> getItems(SalesOrder order) {
		return dao.getItems(order);
	}

	public void updateStatus(SalesOrder order) {
		dao.updateStatus(order);
	}
	
}