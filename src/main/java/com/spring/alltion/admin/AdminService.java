package com.spring.alltion.admin;

import java.util.HashMap;

import com.spring.alltion.productRegistration.ProductVO;
import com.spring.alltion.trading.TradingVO;

public interface AdminService {
	// 관리자페이지 - 메인 데이터 가져오기
	public HashMap<String, Object> getAdminHomeData();
	
	// 관리자페이지 - 회원관리 데이터 가져오기
	public HashMap<String, Object> getAdminMemberDate(AdminMemberVO searchMemberVO);
	
	// 관리자페이지 - 회원정보수정
	public void adminMemberUpdate(AdminMemberVO adminMemberVO);
	
	// 관리자페이지 - 상품 관리 데이터 가져오기
	public HashMap<String, Object> getAdminProductDate(AdminProductVO adminproductVO);
	
	// 관리자페이지 - 상품마감처리
	public void adminProductEnd(ProductVO productVO);
	
	// 관리자페이지 - 거래관리 데이터 가져오기
	HashMap<String, Object> getAdminTradingtDate(AdminTradingVO adminTradingVO);
	
	// 관리자페이지 - 거래기한 연장
	TradingVO adminExtendDeadlineOfTrading(TradingVO tradingVO, int target);
	
	// 관리자페이지 - 거래 초기화
	TradingVO adminTradingReset(TradingVO tradingVO);
	
	// 관리자페이지 - 결제관리 데이터 가져오기
	HashMap<String, Object> getAdminPayDate(AdminPayVO adminPayVO);
}
