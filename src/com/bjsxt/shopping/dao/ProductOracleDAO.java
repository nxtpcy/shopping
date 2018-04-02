package com.bjsxt.shopping.dao;

import java.util.Date;
import java.util.List;

import com.bjsxt.shopping.Product;

public class ProductOracleDAO implements ProductDAO {

	@Override
	public List<Product> getProducts() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Product> getProducts(int pageNo, int pageSize) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int findProducts(List<Product> products, int[] categoryId, String keyWord, double lowNormalPrice,
			double highNormalPrice, double lowMemberPrice, double highMemberPrice, Date startDate, Date endDate,
			int pageNo, int pageSize) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public boolean deleteProductByCategoryId(int categoryId) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean deleteProductById(int[] idArray) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean updateProduct(Product p) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean addProduct(Product p) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public int getProducts(List<Product> products, int pageNo, int pageSize) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public Product loadById(int id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Product> getLatestProducts(int count) {
		// TODO Auto-generated method stub
		return null;
	}

}
