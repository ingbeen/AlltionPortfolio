package com.spring.alltion.creditScore;

public interface CreditScoreService {
	public SaleCreditScoreVO getSaleCreditScore(String sale_id);
//	public SaleCreditScoreVO getSaleScoreInfo(String sale_id);
//	public int saleNormalCount(String sale_id);
//	public int saleDenialCount(String sale_id);
//	public int saleReturnCount(String sale_id);
//	public int saleUndeliveredCount(String sale_id);
//	public SaleCreditScoreVO saleRateScoreCount(String sale_id);
	
	public PurchaseCreditScoreVO getPurchaseCreditScore(String purchase_id);
//	public SaleCreditScoreVO getPurchaseScoreInfo(String sale_id);
//	public int purchaseNormalCount(String sale_id);
//	public int purchaseDenialCount(String sale_id);
//	public int purchaseReturnCount(String sale_id);
//	public int purchaseUndeliveredCount(String sale_id);
//	public SaleCreditScoreVO purchaseRateScoreCount(String sale_id);
}
