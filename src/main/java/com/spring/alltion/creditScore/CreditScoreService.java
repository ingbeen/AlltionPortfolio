package com.spring.alltion.creditScore;

public interface CreditScoreService {
	public SaleCreditScoreVO getSaleCreditScore(String sale_id);
	public PurchaseCreditScoreVO getPurchaseCreditScore(String purchase_id);
}
