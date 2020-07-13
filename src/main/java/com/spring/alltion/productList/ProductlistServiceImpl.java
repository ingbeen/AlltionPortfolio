package com.spring.alltion.productList;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.alltion.productRegistration.ProductVO;
import com.spring.mapper.ProductListMapper;

@Service
public class ProductlistServiceImpl implements ProductlistService {

	@Autowired(required=false)
	private SqlSession sqlSession;

	/*
	@Override
	public List<ProductVO> getproductList(int page, int limit) {
		// TODO Auto-generated method stub
		int startrow=(page-1)*5+1; 
		int endrow=startrow+limit-1; 
		HashMap<String, Integer> params = new HashMap<String, Integer>();
		params.put("start", startrow);
		params.put("end", endrow);
		
		List<ProductVO> productlist = sqlSession.selectList("com.spring.mapper.ProductListMapper.getProductList",params);
		
		return productlist;
	}
*/
	
	@Override
	public int getListCount() {
		// TODO Auto-generated method stub
		ProductListMapper productListMapper = sqlSession.getMapper(ProductListMapper.class);
		int res = productListMapper.getListCount();
		return res;
	}
/*
	@Override
	public List<ProductVO> getproductList(HashMap<String, Integer> hashmap, ProductVO vo) {
		// TODO Auto-generated method stub
		ProductListMapper productListMapper = sqlSession.getMapper(ProductListMapper.class);
		List<ProductVO> productlist = productListMapper.getProductList(hashmap, vo);
		return productlist;
	}
*/
	@Override
	public List<ProductVO> list(String product_category_2, String product_category_1) throws Exception {
		// TODO Auto-generated method stub
		ProductListMapper productListMapper = sqlSession.getMapper(ProductListMapper.class);
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		map.put("product_category_2", product_category_2);
		map.put("product_category_1", product_category_1);
		List<ProductVO> productlist = productListMapper.list(product_category_2, product_category_1);
		
		return productlist;
		
	}

	@Override
	public List<ProductVO> getproductList(HashMap<String, Integer> hashmap) {
		// TODO Auto-generated method stub
		ProductListMapper productListMapper = sqlSession.getMapper(ProductListMapper.class);
		List<ProductVO> productlist = productListMapper.getProductList(hashmap);
		return productlist;
	}
	@Override
	public List<ProductVO> getMainlist() {
		// TODO Auto-generated method stub
		ProductListMapper productListMapper = sqlSession.getMapper(ProductListMapper.class);
		List<ProductVO> productlist = productListMapper.getMainlist();
		System.out.println(productlist.get(0).getProduct_number());
		return productlist;
	}

}
