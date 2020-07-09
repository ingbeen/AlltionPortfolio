package com.spring.mapper;

import java.util.List;

import com.spring.alltion.productRegistration.ProductVO;

public interface ProductMapper {
	int productInsert(ProductVO productVO);
	List<ProductVO> searchForDeadline();
	void changePoductProgressToEnd(int product_number);
	ProductVO productSelectTest(); /* test */
}
