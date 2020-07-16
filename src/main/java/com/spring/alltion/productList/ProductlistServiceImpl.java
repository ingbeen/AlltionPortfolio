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
	
	@Override
	public int getListCount() {
		// TODO Auto-generated method stub
		ProductListMapper productListMapper = sqlSession.getMapper(ProductListMapper.class);
		int res = productListMapper.getListCount();
		return res;
	}

	@Override
	public List<ProductVO> getproductList(HashMap<String, Integer> hashmap) {
		// TODO Auto-generated method stub
		ProductListMapper productListMapper = sqlSession.getMapper(ProductListMapper.class);
		List<ProductVO> productlist = productListMapper.getProductList(hashmap);
		return productlist;
	}
	@Override
	public List<ProductVO> getOrderbylist(String product_category_2, String sort_list) {
		// TODO Auto-generated method stub
		ProductListMapper productListMapper = sqlSession.getMapper(ProductListMapper.class);
		List<ProductVO> productlist = productListMapper.getOrderbylist(product_category_2, sort_list);
		return productlist;
	}
	@Override
	public List<ProductVO> getfamousPricelist(String product_category_2) {
		// TODO Auto-generated method stub
		ProductListMapper productListMapper = sqlSession.getMapper(ProductListMapper.class);
		List<ProductVO> productlist = productListMapper.getfamousPricelist(product_category_2);
		return productlist;
	}
	@Override
	public List<ProductVO> getfamousParticipantslist(String product_category_2) {
		// TODO Auto-generated method stub
		ProductListMapper productListMapper = sqlSession.getMapper(ProductListMapper.class);
		List<ProductVO> productlist = productListMapper.getfamousParticipantslist(product_category_2);
		return productlist;
	}
	@Override
	public List<ProductVO> getfamousViewslist(String product_category_2) {
		// TODO Auto-generated method stub
		ProductListMapper productListMapper = sqlSession.getMapper(ProductListMapper.class);
		List<ProductVO> productlist = productListMapper.getfamousViewslist(product_category_2);
		return productlist;
	}
	@Override
	public List<ProductVO> getfamousPricelist2() {
		// TODO Auto-generated method stub
		ProductListMapper productListMapper = sqlSession.getMapper(ProductListMapper.class);
		List<ProductVO> productlist = productListMapper.getfamousPricelist2();
		return productlist;
	}
	@Override
	public List<ProductVO> getfamousParticipantslist2() {
		// TODO Auto-generated method stub
		ProductListMapper productListMapper = sqlSession.getMapper(ProductListMapper.class);
		List<ProductVO> productlist = productListMapper.getfamousParticipantslist2();
		return productlist;
	}
	@Override
	public List<ProductVO> getfamousViewslist2() {
		// TODO Auto-generated method stub
		ProductListMapper productListMapper = sqlSession.getMapper(ProductListMapper.class);
		List<ProductVO> productlist = productListMapper.getfamousViewslist2();
		return productlist;
	}
	@Override
	public List<ProductVO> getMainlist(HashMap<String, Integer> hashmap) {
		// TODO Auto-generated method stub
		ProductListMapper productListMapper = sqlSession.getMapper(ProductListMapper.class);
		List<ProductVO> productlist = productListMapper.getMainlist(hashmap);
		return productlist;
	}
	@Override
	public List<ProductVO> getCategorylist(String product_category_2, int startrow, int endrow) {
		// TODO Auto-generated method stub
		ProductListMapper productListMapper = sqlSession.getMapper(ProductListMapper.class);
		System.out.println("product_category_2 = " + product_category_2);
		System.out.println("startrow = " + startrow);
		System.out.println("endrow = " + endrow);
		List<ProductVO> productlist = productListMapper.getCategorylist(product_category_2, startrow, endrow);
		return productlist;
	}
	@Override
	public int getCategorylistCount(String product_category_2) {
		// TODO Auto-generated method stub
		ProductListMapper productListMapper = sqlSession.getMapper(ProductListMapper.class);
		int res = productListMapper.getCategorylistCount(product_category_2);
		return res;
	}
}
