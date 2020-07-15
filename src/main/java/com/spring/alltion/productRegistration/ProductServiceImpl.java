package com.spring.alltion.productRegistration;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.alltion.creditScore.SaleCreditScoreVO;
import com.spring.mapper.CreditScoreMapper;
import com.spring.mapper.ProductMapper;

@Service
public class ProductServiceImpl implements ProductService {

	@Autowired
	private SqlSession sqlSession;
	
	// 상품객체 추가
	@Override
	public void ProductInsert(ProductVO productVO) {
		ProductMapper productMapper; // 마이바티스 상품맵퍼
		CreditScoreMapper creditScoreMapper; // 마이바티스 신용도맵퍼
		
		String end_date; // 경매종료일
		String saleId;
		int saleCreditScore;
		SaleCreditScoreVO saleCreditScoreVO;
		
		try {
			productMapper = sqlSession.getMapper(ProductMapper.class);
			creditScoreMapper = sqlSession.getMapper(CreditScoreMapper.class);
			
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
			
			// 판매자의 신용정보에서 신용점수를 가져와 set 해준다
			saleId = productVO.getProduct_id();
			saleCreditScoreVO = creditScoreMapper.getSaleCreditScore(saleId);
			saleCreditScore = saleCreditScoreVO.getSale_credit_score();
			productVO.setProduct_credit_score(saleCreditScore);
			
			// 상품데이터를 insert한다
			productMapper.productInsert(productVO);
		} catch(Exception e) {
			System.out.println("ProductInsert 에러");
			e.printStackTrace();
		}
	}
	
	
	/* test */
	@Override
	public ProductVO productSelectTest(int product_number) {
		ProductMapper productMapper = sqlSession.getMapper(ProductMapper.class);
		
		ProductVO productVO = productMapper.getProduct(product_number);
		
		return productVO;
	}
}
