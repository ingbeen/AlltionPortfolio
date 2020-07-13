package com.spring.alltion.productRegistration;

/*
-- 상품정보
CREATE TABLE product (
		product_number number primary key, -- 상품번호
		product_id varchar2(1000) not null, -- 아이디
        
		product_category_1 varchar2(1000) not null, -- 카테고리 1차
		product_category_2 varchar2(1000) not null, -- 카테고리 2차
        
		product_subject varchar2(1000) not null, -- 상품제목
		product_content varchar2(4000) not null, -- 상품내용
        product_img_1 varchar2(1000) not null, -- 이미지(썸네일)_1
        product_img_2 varchar2(1000), -- 이미지(썸네일)_2
        product_img_3 varchar2(1000), -- 이미지(썸네일)_3
        product_img_4 varchar2(1000), -- 이미지(썸네일)_4
        product_img_5 varchar2(1000), -- 이미지(썸네일)_5
        
		product_starting_price number not null, -- 경매시작가
        product_bidding_unit number not null, -- 입찰단위
        product_end_date date not null, -- 경매종료일
        
        product_delivery varchar2(1000) not null, -- 택배거래(비용) : before = 착불, after = 착불, none = 불가능
		product_transaction_area varchar2(1000) not null, -- 거래가능지역 : none = 불가능, 사용자입력값
        
        product_purchase_price number not null, -- 즉시구매가격
		product_re_auction number not null, -- 재경매 : 0 = 불가능, 1 = 가능
        
		product_current_price number not null, -- 경매현재가
		product_bids number not null, -- 입찰수
		product_participants number not null, -- 참가자수
		product_credit_score number not null, -- 신용도
		product_views number not null, -- 조회수
		product_issue_date date not null, -- 등록일
		product_progress number not null -- 진행상태 : 진행중 = 0, 낙찰 = 1
);
*/

public class ProductVO {
	int product_number; // 상품번호
	String product_id; // 아이디
	String product_category_1; // 카테고리 1차
	String product_category_2; // 카테고리 2차
	
	String product_subject; // 상품제목
	String product_content; // 상품내용
	String product_img_1; // 이미지(썸네일)_1
	String product_img_2; // 이미지(썸네일)_2
	String product_img_3; // 이미지(썸네일)_3
	String product_img_4; // 이미지(썸네일)_4
	String product_img_5; // 이미지(썸네일)_5

	int product_starting_price; // 경매시작가
	int product_bidding_unit; // 입찰단위
	String product_end_date; // 경매종료일
    
	String product_delivery; // 택배거래(비용)
	String product_transaction_area; // 거래가능지역 

	int product_purchase_price; // 즉시구매가격
	int product_re_auction; // 재경매
	
	int product_current_price; // 경매현재가
	int product_bids; // 입찰수
	int product_participants; // 참가자수
	int product_credit_score; // 신용도
	int product_views; // 조회수
	String product_issue_date; // 등록일
	int product_progress; // 진행상태
	
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
	public String getProduct_category_1() {
		return product_category_1;
	}
	public void setProduct_category_1(String product_category_1) {
		this.product_category_1 = product_category_1;
	}
	public String getProduct_category_2() {
		return product_category_2;
	}
	public void setProduct_category_2(String product_category_2) {
		this.product_category_2 = product_category_2;
	}
	public String getProduct_subject() {
		return product_subject;
	}
	public void setProduct_subject(String product_subject) {
		this.product_subject = product_subject;
	}
	public String getProduct_content() {
		return product_content;
	}
	public void setProduct_content(String product_content) {
		this.product_content = product_content;
	}
	public String getProduct_img_1() {
		return product_img_1;
	}
	public void setProduct_img_1(String product_img_1) {
		this.product_img_1 = product_img_1;
	}
	public String getProduct_img_2() {
		return product_img_2;
	}
	public void setProduct_img_2(String product_img_2) {
		this.product_img_2 = product_img_2;
	}
	public String getProduct_img_3() {
		return product_img_3;
	}
	public void setProduct_img_3(String product_img_3) {
		this.product_img_3 = product_img_3;
	}
	public String getProduct_img_4() {
		return product_img_4;
	}
	public void setProduct_img_4(String product_img_4) {
		this.product_img_4 = product_img_4;
	}
	public String getProduct_img_5() {
		return product_img_5;
	}
	public void setProduct_img_5(String product_img_5) {
		this.product_img_5 = product_img_5;
	}
	public int getProduct_starting_price() {
		return product_starting_price;
	}
	public void setProduct_starting_price(int product_starting_price) {
		this.product_starting_price = product_starting_price;
	}
	public int getProduct_bidding_unit() {
		return product_bidding_unit;
	}
	public void setProduct_bidding_unit(int product_bidding_unit) {
		this.product_bidding_unit = product_bidding_unit;
	}
	public String getProduct_end_date() {
		return product_end_date;
	}
	public void setProduct_end_date(String product_end_date) {
		this.product_end_date = product_end_date;
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
	public int getProduct_re_auction() {
		return product_re_auction;
	}
	public void setProduct_re_auction(int product_re_auction) {
		this.product_re_auction = product_re_auction;
	}
	public int getProduct_current_price() {
		return product_current_price;
	}
	public void setProduct_current_price(int product_current_price) {
		this.product_current_price = product_current_price;
	}
	public int getProduct_bids() {
		return product_bids;
	}
	public void setProduct_bids(int product_bids) {
		this.product_bids = product_bids;
	}
	public int getProduct_participants() {
		return product_participants;
	}
	public void setProduct_participants(int product_participants) {
		this.product_participants = product_participants;
	}
	public int getProduct_credit_score() {
		return product_credit_score;
	}
	public void setProduct_credit_score(int product_credit_score) {
		this.product_credit_score = product_credit_score;
	}
	public int getProduct_views() {
		return product_views;
	}
	public void setProduct_views(int product_views) {
		this.product_views = product_views;
	}
	public String getProduct_issue_date() {
		return product_issue_date;
	}
	public void setProduct_issue_date(String product_issue_date) {
		this.product_issue_date = product_issue_date;
	}
	public int getProduct_progress() {
		return product_progress;
	}
	public void setProduct_progress(int product_progress) {
		this.product_progress = product_progress;
	}
}
