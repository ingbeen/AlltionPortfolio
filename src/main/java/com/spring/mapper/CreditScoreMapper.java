package com.spring.mapper;

import com.spring.alltion.creditScore.PurchaseCreditScoreVO;
import com.spring.alltion.creditScore.SaleCreditScoreVO;

public interface CreditScoreMapper {
	public SaleCreditScoreVO getSaleCreditScore(String sale_id);
	public PurchaseCreditScoreVO getPurchaseCreditScore(String purchase_id);
}