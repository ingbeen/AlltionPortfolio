package com.spring.alltion.productList;

import java.util.HashMap;
import java.util.List;

import com.spring.alltion.productRegistration.ProductVO;


public interface ProductlistService {
	//public List<ProductVO> getproductList(int page,int limit);
	public int getListCount();
	public List<ProductVO> getproductList(HashMap<String, Integer> hashmap);
	public List<ProductVO> list(String product_category_2, String product_category_1) throws Exception;
	public List<ProductVO> getMainlist();
	//public List<ProductVO> getproductList(HashMap<String, Integer> hashmap, ProductVO vo);
}	
