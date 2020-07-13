package com.spring.alltion.creditScore;

public class SaleCreditScoreVO {
	private String sale_id;
	private int sale_credit_score;
	private int sale_normal;
	private int sale_denial;
	private int sale_undelivered;
	private int sale_return;
	private int sale_success_rate;
	
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
	
	public int getSale_success_rate() {
		return sale_success_rate;
	}
	
	public void setSale_success_rate(int sale_success_rate) {
		this.sale_success_rate = sale_success_rate;
	}
}
