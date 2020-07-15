package com.spring.alltion.creditScore;

public class PurchaseCreditScoreVO {
	private String purchase_id;
	private int purchase_credit_score;
	private int purchase_normal;
	private int purchase_denial;
	private int purchase_undelivered;
	private int purchase_return;
	private double purchase_success_rate;
	
	public String getPurchase_id() {
		return purchase_id;
	}
	
	public void setPurchase_id(String purchase_id) {
		this.purchase_id = purchase_id;
	}
	
	public int getPurchase_credit_score() {
		return purchase_credit_score;
	}
	
	public void setPurchase_credit_score(int purchase_credit_score) {
		this.purchase_credit_score = purchase_credit_score;
	}
	
	public int getPurchase_normal() {
		return purchase_normal;
	}
	
	public void setPurchase_normal(int purchase_normal) {
		this.purchase_normal = purchase_normal;
	}
	
	public int getPurchase_denial() {
		return purchase_denial;
	}
	
	public void setPurchase_denial(int purchase_denial) {
		this.purchase_denial = purchase_denial;
	}
	
	public int getPurchase_undelivered() {
		return purchase_undelivered;
	}
	
	public void setPurchase_undelivered(int purchase_undelivered) {
		this.purchase_undelivered = purchase_undelivered;
	}
	
	public int getPurchase_return() {
		return purchase_return;
	}
	
	public void setPurchase_return(int purchase_return) {
		this.purchase_return = purchase_return;
	}
	
	public double getPurchase_success_rate() {
		return purchase_success_rate;
	}
	
	public void setPurchase_success_rate(int purchase_success_rate) {
		this.purchase_success_rate = purchase_success_rate;
	}
	
	public void purchaseScoreRate() {
		if(purchase_normal != 0 && purchase_denial == 0 && purchase_undelivered == 0 && purchase_return == 0) {
			purchase_success_rate = 100;
		} else {
			int baseCount = purchase_normal * 100;
			purchase_normal = 1;
			
			purchase_success_rate = baseCount / (purchase_normal + purchase_undelivered + purchase_return + purchase_denial);
		}
		
		saleScoreProcess(purchase_success_rate);
	}
	
	public void saleScoreProcess(double purchase_success_rate) {
		purchase_credit_score = Integer.parseInt(String.valueOf(Math.round(purchase_success_rate * 2)));
	}
}
