package com.spring.alltion.productRegistration;

import javax.servlet.http.HttpSession;

public interface ProductService {
	// 상품객체 추가
	public void ProductInsert(ProductVO productVO);
	/* test */
	public ProductVO productSelectTest(int product_number);
}
