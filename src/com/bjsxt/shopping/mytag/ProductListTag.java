package com.bjsxt.shopping.mytag;

import java.io.IOException;
import java.util.List;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.SimpleTagSupport;

import com.bjsxt.shopping.Product;
import com.bjsxt.shopping.ProductMgr;

public class ProductListTag extends SimpleTagSupport {

	@Override
	public void doTag() throws JspException, IOException {
		List<Product> products = ProductMgr.getInstance().getProducts();
		for (int i = 0; i < products.size(); i++) {
			this.getJspContext().getOut().write(products.get(i).getName() + "<br>");
		}
	}	
}