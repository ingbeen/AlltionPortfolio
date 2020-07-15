package com.spring.alltion.test;
/*
 create table product_kj(
		product_number_kj number primary key, -- 상품번호
		product_id_kj varchar2(1000) references member(member_id) not null , -- 아이디      
		product_subject_kj varchar2(1000) not null, -- 상품제목       
        product_delivery_kj varchar2(1000), -- 택배거래(비용) : before = 착불, after = 착불, none = 불가능
		product_transaction_area_kj varchar2(1000), -- 거래가능지역 : none = 불가능, 사용자입력값        
        product_purchase_price_kj number not null, -- 즉시구매가격  
		product_current_price_kj number not null -- 경매현재가
);
 */
public class Product_kjVO {

	 int product_number;
	 String product_id;
	 String product_subject;
	 String product_delivery;
	 String product_transaction_area;
	 int product_purchase_price;
	 int product_current_price;
	 String trading_deposit_deadline;
	 String trading_transaction_method;
	
	 public String getTrading_deposit_deadline() {
		return trading_deposit_deadline;
	}
	public void setTrading_deposit_deadline(String trading_deposit_deadline) {
		this.trading_deposit_deadline = trading_deposit_deadline;
	}
	public String getTrading_transaction_method() {
		return trading_transaction_method;
	}
	public void setTrading_transaction_method(String trading_transaction_method) {
		this.trading_transaction_method = trading_transaction_method;
	}
	public int getProduct_number() {
		return product_number;
	}
	public void setProduct_number(int product_number) {
		this.product_number = product_number;
	}
	public String getProduct_id() {
		return product_id;
	}
	public void setProduct_id(String product_id) {
		this.product_id = product_id;
	}
	public String getProduct_subject() {
		return product_subject;
	}
	public void setProduct_subject(String product_subject) {
		this.product_subject = product_subject;
	}
	public String getProduct_delivery() {
		return product_delivery;
	}
	public void setProduct_delivery(String product_delivery) {
		this.product_delivery = product_delivery;
	}
	public String getProduct_transaction_area() {
		return product_transaction_area;
	}
	public void setProduct_transaction_area(String product_transaction_area) {
		this.product_transaction_area = product_transaction_area;
	}
	public int getProduct_purchase_price() {
		return product_purchase_price;
	}
	public void setProduct_purchase_price(int product_purchase_price) {
		this.product_purchase_price = product_purchase_price;
	}
	public int getProduct_current_price() {
		return product_current_price;
	}
	public void setProduct_current_price(int product_current_price) {
		this.product_current_price = product_current_price;
	}
	
}
