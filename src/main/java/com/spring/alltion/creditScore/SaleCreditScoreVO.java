package com.spring.alltion.creditScore;

public class SaleCreditScoreVO {
	private String sale_id;
	private int sale_credit_score;
	private int sale_normal;
	private int sale_denial;
	private int sale_undelivered;
	private int sale_return;
	private double sale_success_rate;
	
	public String getSale_id() {
		return sale_id;
	}
	
	public void setSale_id(String sale_id) {
		this.sale_id = sale_id;
	}
	
	public int getSale_credit_score() {
		return sale_credit_score;
	}
	
	public void setSale_credit_score(int sale_credit_score) {
		this.sale_credit_score = sale_credit_score;
	}
	
	public int getSale_normal() {
		return sale_normal;
	}
	
	public void setSale_normal(int sale_normal) {
		this.sale_normal = sale_normal;
	}
	
	public int getSale_denial() {
		return sale_denial;
	}
	
	public void setSale_denial(int sale_denial) {
		this.sale_denial = sale_denial;
	}
	
	public int getSale_undelivered() {
		return sale_undelivered;
	}
	
	public void setSale_undelivered(int sale_undelivered) {
		this.sale_undelivered = sale_undelivered;
	}
	
	public int getSale_return() {
		return sale_return;
	}
	
	public void setSale_return(int sale_return) {
		this.sale_return = sale_return;
	}
	
	public double getSale_success_rate() {
		return sale_success_rate;
	}
	
	public void setSale_success_rate(int sale_success_rate) {
		this.sale_success_rate = sale_success_rate;
	}

	// 로직 다시 짜기	
	public void saleScoreRate() {
		if(sale_normal != 0 && sale_denial == 0 && sale_undelivered == 0 && sale_return == 0) {
			sale_success_rate = 100;
		} else {
			int baseCount = sale_normal * 100;
			sale_normal = 1;
			
			sale_success_rate = baseCount / (sale_normal + sale_undelivered + sale_return + sale_denial);
		}
		
		saleScoreProcess(sale_success_rate);
	}
	
	public void saleScoreProcess(double sale_success_rate) {
		sale_credit_score = Integer.parseInt(String.valueOf(Math.round(sale_success_rate * 2)));
	}
}
