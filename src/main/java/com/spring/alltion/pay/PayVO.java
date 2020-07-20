package com.spring.alltion.pay;

public class PayVO {
	String pay_merchant_uid;
	String pay_amount;
	String pay_status;
	String pay_id;
	
	public String getPay_merchant_uid() {
		return pay_merchant_uid;
	}
	public void setPay_merchant_uid(String pay_merchant_uid) {
		this.pay_merchant_uid = pay_merchant_uid;
	}
	public String getPay_amount() {
		return pay_amount;
	}
	public void setPay_amount(String pay_amount) {
		this.pay_amount = pay_amount;
	}
	public String getPay_status() {
		return pay_status;
	}
	public void setPay_status(String pay_status) {
		this.pay_status = pay_status;
	}
	public String getPay_id() {
		return pay_id;
	}
	public void setPay_id(String pay_id) {
		this.pay_id = pay_id;
	}
	
}
