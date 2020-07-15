package com.spring.mapper;

import java.util.HashMap;
import java.util.List;

import com.spring.alltion.productRegistration.ProductVO;

public interface ProductListMapper {
	//public ProductVO getProductList(int product_number, String product_category_2);
	public Integer getListCount();
	public List<ProductVO> getCategorylist(String product_category_2);
	public List<ProductVO> getProductList(HashMap<String, Integer> hashmap);
	public List<ProductVO> getMainlist();
	//public List<ProductVO> getOrderbylist(String sort_list);
	public List<ProductVO> getOrderbylist(String product_category_2, String sort_list);
	public List<ProductVO> getfamousPricelist(String product_category_2);
	public List<ProductVO> getfamousParticipantslist(String product_category_2);
	public List<ProductVO> getfamousViewslist(String product_category_2);
	public List<ProductVO> getfamousPricelist2();
	public List<ProductVO> getfamousParticipantslist2();
	public List<ProductVO> getfamousViewslist2();
}
