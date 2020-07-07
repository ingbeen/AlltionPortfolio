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
		ProductMapper productMapper;
		String end_date;
		int res;
		
		try {
			productMapper = sqlSession.getMapper(ProductMapper.class);
			end_date = productVO.getProduct_end_date();
			end_date = end_date.replace("년 ", "/");
			end_date = end_date.replace("월 ", "/");
			end_date = end_date.replace("일", "");
			end_date = end_date.replace("시 ", ":");
			end_date = end_date.replace("분", "");
			productVO.setProduct_end_date(end_date);
			
			if (productVO.getProduct_transaction_area().equals("")) {
				productVO.setProduct_transaction_area("none");
			}
			
			res = productMapper.productInsert(productVO);
			
			return res;
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return 0;
	}
	
	/* test */
	public ProductVO productSelectTest() {
		ProductMapper productMapper = sqlSession.getMapper(ProductMapper.class);
		
		ProductVO productVO = productMapper.productSelectTest();
		
		return productVO;
	}
}
