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
		ProductMapper productMapper; // 상품 맵퍼
		String end_date; // 경매종료일
		int res; // insert 결과값
		
		try {
			productMapper = sqlSession.getMapper(ProductMapper.class);
			
			// 경매종료일을 sql문의 to_date에 맞는 형식으로 변환한다
			end_date = productVO.getProduct_end_date();
			end_date = end_date.replace("년 ", "/");
			end_date = end_date.replace("월 ", "/");
			end_date = end_date.replace("일", "");
			end_date = end_date.replace("시 ", ":");
			end_date = end_date.replace("분", "");
			productVO.setProduct_end_date(end_date);
			
			// 직거래가 없으면 "none"으로 변환한다
			if (productVO.getProduct_transaction_area().equals("")) {
				productVO.setProduct_transaction_area("none");
			}
			
			// 정상적으로  insert가 되면 1을 반화한다
			res = productMapper.productInsert(productVO);
			
			return res;
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		// insert가 정상적으로 안되었으면 0을 반환한다
		return 0;
	}
	
	/* test */
	public ProductVO productSelectTest() {
		ProductMapper productMapper = sqlSession.getMapper(ProductMapper.class);
		
		ProductVO productVO = productMapper.productSelectTest();
		
		return productVO;
	}
}
