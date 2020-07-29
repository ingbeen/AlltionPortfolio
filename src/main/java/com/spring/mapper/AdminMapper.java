package com.spring.mapper;

import java.util.List;

import com.spring.alltion.admin.AdminMemberVO;
import com.spring.alltion.login.MemberVO;

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
	int getDailyAuction(int period);
	
	// 카테고리별 상품수
	int getCateCount(String cate);
	
	// 최근 일주일 가입자수
	int getDailySubscribers(int period);
	
	// 멤버리스트 검색결과 갯수
	int getMemberListCount(AdminMemberVO adminMemberVO);
	
	// 멤버리스트 검색결과
	List<MemberVO> getMemberList(AdminMemberVO adminMemberVO);
	
	// 멤버정보 수정
	void adminMemberUpdate(AdminMemberVO adminMemberVO);
}
