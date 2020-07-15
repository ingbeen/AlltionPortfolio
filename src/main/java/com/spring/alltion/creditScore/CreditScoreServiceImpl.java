package com.spring.alltion.creditScore;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.mapper.CreditScoreMapper;

@Service
public class CreditScoreServiceImpl implements CreditScoreService {
	
	@Autowired
	private SqlSession sqlSession;
	
	public SaleCreditScoreVO getSaleCreditScore(String sale_id) {
		SaleCreditScoreVO saleCreditScorevo = new SaleCreditScoreVO();
		saleCreditScorevo.saleScoreRate();
		CreditScoreMapper scoreMapper = sqlSession.getMapper(CreditScoreMapper.class);
		saleCreditScorevo = scoreMapper.getSaleCreditScore(sale_id);
		
		return saleCreditScorevo;
	}
	
//	public int saleNormalCount(String sale_id) {
//		CreditScoreMapper scoreMapper = sqlSession.getMapper(CreditScoreMapper.class);
//		SaleCreditScoreVO saleCreditScorevo = new SaleCreditScoreVO();
//		
//		if (){
//			int saleNormalCount = saleCreditScorevo.getSale_normal() + 1;
//		} else{
//			int saleNormalCount = saleCreditScorevo.getSale_normal() - 1;
//		}
//		
//	}
//	public int saleDenialCount(String sale_id)
//	public int saleReturnCount(String sale_id)
//	public int saleUndeliveredCount(String sale_id)
//	public SaleCreditScoreVO saleRateScoreCount(String sale_id)
	
	public PurchaseCreditScoreVO getPurchaseCreditScore(String purchase_id) {
		PurchaseCreditScoreVO purchaseCreditScorevo = new PurchaseCreditScoreVO();
		purchaseCreditScorevo.purchaseScoreRate();
		CreditScoreMapper scoreMapper = sqlSession.getMapper(CreditScoreMapper.class);
		purchaseCreditScorevo = scoreMapper.getPurchaseCreditScore(purchase_id);
		
		return purchaseCreditScorevo;
	}
}
