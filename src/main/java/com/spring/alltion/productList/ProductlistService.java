package com.spring.alltion.productList;

import java.util.HashMap;
import java.util.List;

import com.spring.alltion.productRegistration.ProductVO;


public interface ProductlistService {
	//public List<ProductVO> getproductList(int page,int limit);
	public int getListCount();
	public List<ProductVO> getproductList(HashMap<String, Integer> hashmap);
	public List<ProductVO> getCategorylist(String product_category_2);
	public List<ProductVO> getMainlist();
	//public List<ProductVO> getOrderbylist(String sort_list);
	public List<ProductVO> getOrderbylist(String product_category_2, String sortD);
	public List<ProductVO> getfamousPricelist(String product_category_2);
	public List<ProductVO> getfamousParticipantslist(String product_category_2);
	public List<ProductVO> getfamousViewslist(String product_category_2);
	public List<ProductVO> getfamousPricelist2();
	public List<ProductVO> getfamousParticipantslist2();
	public List<ProductVO> getfamousViewslist2();
}	
