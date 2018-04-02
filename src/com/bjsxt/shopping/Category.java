package com.bjsxt.shopping;

import java.util.ArrayList;
import java.util.List;

import org.eclipse.jdt.internal.compiler.ast.ThisReference;

public class Category {
	private int id;
	private String name;
	private String descr;
	private int pid;
	private boolean leaf;
	
	public boolean isLeaf() {
		return leaf;
	}
	public void setLeaf(boolean leaf) {
		this.leaf = leaf;
	}
	private int grade;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getDescr() {
		return descr;
	}
	public void setDescr(String descr) {
		this.descr = descr;
	}
	public int getPid() {
		return pid;
	}
	public void setPid(int pid) {
		this.pid = pid;
	}
	public int getGrade() {
		return grade;
	}
	public void setGrade(int grade) {
		this.grade = grade;
	}
	
	public static void add(Category c) {
		CategoryDAO.save(c);
	}
	
	public void addChild(Category c) {
		Category.addChildCategory(id, c.getName(), c.getDescr());
	}
	
	public static Category loadById(int id) {
		return CategoryDAO.loadById(id);
	}
	
	public static void addTopCategory(String name, String descr) {
		/*
		Category c = new Category();
		c.setId(-1);
		c.setName(name);
		c.setDescr(descr);
		c.setPid(0);
		c.setLeaf(true);
		c.setGrade(1);
		add(c);
		*/
		addChildCategory(0, name, descr);
	}
	
	public static List<Category> getCategories() {
		List<Category> list = new ArrayList<Category>();
		CategoryDAO.getCategories(list, 0);
		return list;
	}
	public static void addChildCategory(int pid, String name, String descr) {
		CategoryDAO.addChildCategory(pid, name, descr);
	}
	
	public static void deleteCategory(int id, int pid, int leaf) {
		CategoryDAO.deleteCategory(id, pid, leaf);
	}
	
	public static void updateCategory(int id, String name, String descr) {
		CategoryDAO.updateCategory(id, name, descr);		
	}
	
	public List<Category> getChildren() {
		return CategoryDAO.getChildren(this.getId());
	}
}