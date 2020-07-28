package com.spring.mapper;

public interface AdminMapper {
	// 회원수
	int getMemberCount();
	
	// 경매건수
	int getProductCount();
	
	// 거래건수
	int getTradingCount();
	
	// 입찰건수
	int getBidCount();
	
	// 결제금액
	int getPaySum();
	
	// 최근 일주일 경매등록수
	int getDailyAuctioCount(int period);
	
//	// 최근 일주일 경매등록수
//	int getDailyAuctioCount(int period);
}
