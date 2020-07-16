package com.spring.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.spring.alltion.productRegistration.ProductVO;

public interface ProductListMapper {
	public int getCategorylistCount(String product_category_2);
	public List<ProductVO> getProductList(HashMap<String, Integer> hashmap);
	public List<ProductVO> getOrderbylist(String product_category_2, String sort_list);
	public List<ProductVO> getfamousPricelist(String product_category_2);
	public List<ProductVO> getfamousParticipantslist(String product_category_2);
	public List<ProductVO> getfamousViewslist(String product_category_2);
	public List<ProductVO> getfamousPricelist2();
	public List<ProductVO> getfamousParticipantslist2();
	public List<ProductVO> getfamousViewslist2();
	public int getListCount();
	public List<ProductVO> getMainlist(HashMap<String, Integer> hashmap);
	public List<ProductVO> getCategorylist(@Param("product_category_2")String product_category_2,@Param("startrow") int startrow,@Param("endrow") int endrow);
}
