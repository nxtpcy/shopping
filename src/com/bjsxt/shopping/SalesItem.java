package com.bjsxt.shopping;

public class SalesItem {
	private int id;
	private Product product;
	private double unitprice;
	private int count;
	private SalesOrder order;	
	
	
	public SalesOrder getOrder() {
		return order;
	}
	public void setOrder(SalesOrder order) {
		this.order = order;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public Product getProduct() {
		return product;
	}
	public void setProduct(Product product) {
		this.product = product;
	}
	public double getUnitprice() {
		return unitprice;
	}
	public void setUnitprice(double unitprice) {
		this.unitprice = unitprice;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}	
}
