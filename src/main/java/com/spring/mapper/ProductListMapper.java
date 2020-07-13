package com.spring.mapper;

import java.util.HashMap;
import java.util.List;

import com.spring.alltion.productRegistration.ProductVO;

public interface ProductListMapper {
	//public ProductVO getProductList(int product_number, String product_category_2);
	public Integer getListCount();
	public List<ProductVO> list(String product_category_2, String product_category_1) throws Exception;
	public List<ProductVO> getProductList(HashMap<String, Integer> hashmap);
	public List<ProductVO> getMainlist();
	//public List<ProductVO> getProductList(HashMap<String, Integer> hashmap, ProductVO vo);
}
