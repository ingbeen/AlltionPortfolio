package com.spring.alltion.trading;

/*
-- 상품정보
CREATE TABLE product (
    trading_product_number number primary key, -- 상품번호
    trading_buyer_id varchar2(1000) not null, -- 구매자아이디
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

public class TradingVO {
	
    int trading_product_number; // 상품번호
    String trading_buyer_id; // 구매자아이디
    int trading_price; // 거래가격
    
    String trading_deposit_deadline; // 입금기한
    String trading_waybill_deadline; // 운송장번호입력기한
    String trading_purchase_deadline; // 구매확정기한
    String trading_purchase_date; // 구매확정일
    
    String trading_transaction_method; // 거래방식
    
    String sample4_postcode; // 우편번호
    String sample4_roadaddress; // 도로명주소
    String sample4_jibunaddress; // 지번주소
    String sample4_detailaddress; // 상세주소
    String trading_phone; // 연락처
    String trading_waybill_number; // 운송장번호
    
    String trading_progress; // 진행상태
    String trading_date; // 등록일
    
	public int getTrading_product_number() {
		return trading_product_number;
	}
	public void setTrading_product_number(int trading_product_number) {
		this.trading_product_number = trading_product_number;
	}
	public String getTrading_buyer_id() {
		return trading_buyer_id;
	}
	public void setTrading_buyer_id(String trading_buyer_id) {
		this.trading_buyer_id = trading_buyer_id;
	}
	public int getTrading_price() {
		return trading_price;
	}
	public void setTrading_price(int trading_price) {
		this.trading_price = trading_price;
	}
	public String getTrading_deposit_deadline() {
		return trading_deposit_deadline;
	}
	public void setTrading_deposit_deadline(String trading_deposit_deadline) {
		this.trading_deposit_deadline = trading_deposit_deadline;
	}
	public String getTrading_waybill_deadline() {
		return trading_waybill_deadline;
	}
	public void setTrading_waybill_deadline(String trading_waybill_deadline) {
		this.trading_waybill_deadline = trading_waybill_deadline;
	}
	public String getTrading_purchase_deadline() {
		return trading_purchase_deadline;
	}
	public void setTrading_purchase_deadline(String trading_purchase_deadline) {
		this.trading_purchase_deadline = trading_purchase_deadline;
	}
	public String getTrading_purchase_date() {
		return trading_purchase_date;
	}
	public void setTrading_purchase_date(String trading_purchase_date) {
		this.trading_purchase_date = trading_purchase_date;
	}
	public String getTrading_transaction_method() {
		return trading_transaction_method;
	}
	public void setTrading_transaction_method(String trading_transaction_method) {
		this.trading_transaction_method = trading_transaction_method;
	}
	public String getSample4_postcode() {
		return sample4_postcode;
	}
	public void setSample4_postcode(String sample4_postcode) {
		this.sample4_postcode = sample4_postcode;
	}
	public String getSample4_roadaddress() {
		return sample4_roadaddress;
	}
	public void setSample4_roadaddress(String sample4_roadaddress) {
		this.sample4_roadaddress = sample4_roadaddress;
	}
	public String getSample4_jibunaddress() {
		return sample4_jibunaddress;
	}
	public void setSample4_jibunaddress(String sample4_jibunaddress) {
		this.sample4_jibunaddress = sample4_jibunaddress;
	}
	public String getSample4_detailaddress() {
		return sample4_detailaddress;
	}
	public void setSample4_detailaddress(String sample4_detailaddress) {
		this.sample4_detailaddress = sample4_detailaddress;
	}
	public String getTrading_phone() {
		return trading_phone;
	}
	public void setTrading_phone(String trading_phone) {
		this.trading_phone = trading_phone;
	}
	public String getTrading_waybill_number() {
		return trading_waybill_number;
	}
	public void setTrading_waybill_number(String trading_waybill_number) {
		this.trading_waybill_number = trading_waybill_number;
	}
	public String getTrading_progress() {
		return trading_progress;
	}
	public void setTrading_progress(String trading_progress) {
		this.trading_progress = trading_progress;
	}
	public String getTrading_date() {
		return trading_date;
	}
	public void setTrading_date(String trading_date) {
		this.trading_date = trading_date;
	}
	
}
