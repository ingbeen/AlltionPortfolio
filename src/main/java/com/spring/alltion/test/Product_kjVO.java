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

CREATE TABLE product_kj_trading (
    trading_product_number number primary key references product_kj(product_number) not null, -- 상품번호
    trading_buyer_id varchar2(1000) references member(member_id) not null, -- 구매자아이디
    trading_price number not null, -- 거래가격
    
    trading_deposit_deadline date not null, -- 입금기한
    trading_waybill_deadline date, -- 운송장번호입력기한
    trading_purchase_deadline date, -- 구매확정기한
    trading_purchase_date date, -- 구매확정일
    
    trading_transaction_method varchar2(1000) null, -- 거래방식
    
    sample4_postcode varchar2(1000) null, -- 우편번호
    sample4_roadaddress varchar2(1000) null, -- 도로명주소
    sample4_jibunaddress varchar2(1000) null, -- 지번주소
    sample4_detailaddress varchar2(1000) null, -- 상세주소
    trading_phone varchar2(1000) not null, -- 연락처
    trading_waybill_number varchar2(1000) not null, -- 운송장번호
    
    trading_progress varchar2(1000), -- 진행상태
    trading_date date not null -- 등록일
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
	 int trading_price;
	 public int getTrading_price() {
		return trading_price;
	}
	public void setTrading_price(int trading_price) {
		this.trading_price = trading_price;
	}
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
