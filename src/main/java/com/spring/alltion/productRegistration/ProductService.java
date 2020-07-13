package com.spring.alltion.productRegistration;

public interface ProductService {
	// 상품객체 추가
	public int ProductInsert(ProductVO productVO);
	/* test */
	public ProductVO productSelectTest(int product_number);
}
