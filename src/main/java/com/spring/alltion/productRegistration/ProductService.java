package com.spring.alltion.productRegistration;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.mapper.ProductMapper;

@Service
public class ProductService {

	@Autowired
	private SqlSession sqlSession;
	
	public int ProductInsert(ProductVO productVO) {
		ProductMapper productMapper = sqlSession.getMapper(ProductMapper.class);		
		int res = productMapper.productInsert(productVO);
		
		return res;
	}
}
