package com.spring.alltion.admin;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.alltion.login.MemberVO;
import com.spring.alltion.mypage.Pagination;
import com.spring.alltion.pay.PayVO;
import com.spring.alltion.pay.PaymentVO;
import com.spring.alltion.productRegistration.ProductVO;
import com.spring.alltion.trading.TradingVO;
import com.spring.mapper.AdminMapper;

@Service
public class AdminServiceImpl implements AdminService {

	@Autowired
	private SqlSession sqlSession;
	
	// 관리자페이지 - 메인 데이터 가져오기
	@Override
	public HashMap<String, Object> getAdminHomeData() {
		AdminMapper adminMapper;
		
		int memberCount; // 회원수
		int productCount; // 경매건수
		int tradingCount; // 거래건수
		int bidCount; // 입찰건수
		int paySum; // 결제금액
		
		ArrayList<Integer> dailyAuctionList; // 최근 일주일 경매등록수
		int dailyAuction; // 하루 경매등록수
		
		ArrayList<Integer> cateCountList; // 카테고리별 상품수
		String cateName; // 카테고리 기본 접두사
		int cateCount; // 해당 카테고리 상품수
		
		ArrayList<Integer> dailySubscribersList; // 최근 일주일 가입자수
		int dailySubscribers; // 하루 가입자 수
		
		HashMap<String, Object> adminHomeData; // 메인 화면에 필요한 데이터
		
		try {
			adminMapper = sqlSession.getMapper(AdminMapper.class);
			memberCount = adminMapper.getMemberCount();
			productCount = adminMapper.getProductCount();
			tradingCount = adminMapper.getTradingCount();
			bidCount = adminMapper.getBidCount();
			paySum = adminMapper.getPaySum();
			
			// 최근 일주일 경매등록수
			dailyAuctionList = new ArrayList<Integer>();
			for (int i = 7; i >= 1; i--) {
				dailyAuction =  adminMapper.getDailyAuction(i);
				dailyAuctionList.add(dailyAuction);
			}
			
			/*
			 * 카테고리별 상품수
			 * DB에 저장되는 양식인 cate를 기본으로 하여 넘버링 한다
			 */
			cateCountList = new ArrayList<Integer>();
			for (int i = 1; i <= 12; i++) {
				cateName = "cate";
				if (i < 10) {
					cateName += 0 + Integer.toString(i);
				} else {
					cateName += Integer.toString(i);
				}
				
				cateCount =  adminMapper.getCateCount(cateName);
				cateCountList.add(cateCount);
			}
			
			// 최근 일주일 가입자수
			dailySubscribersList = new ArrayList<Integer>();
			for (int i = 7; i >= 1; i--) {
				dailySubscribers =  adminMapper.getDailySubscribers(i);
				dailySubscribersList.add(dailySubscribers);
			}
			
			// 메인 화면에 필요한 데이터
			adminHomeData = new HashMap<String, Object>();
			adminHomeData.put("memberCount", memberCount);
			adminHomeData.put("productCount", productCount);
			adminHomeData.put("tradingCount", tradingCount);
			adminHomeData.put("bidCount", bidCount);
			adminHomeData.put("paySum", paySum);
			adminHomeData.put("dailyAuctionList", dailyAuctionList);
			adminHomeData.put("cateCountList", cateCountList);
			adminHomeData.put("dailySubscribersList", dailySubscribersList);
			
			return adminHomeData;
		} catch(Exception e) {
			System.out.println("getAdminHomeData 에러");
			e.printStackTrace();
		}
		
		return null;
	}
	
	// 관리자페이지 - 회원관리 데이터 가져오기
	@Override
	public HashMap<String, Object> getAdminMemberDate(AdminMemberVO adminMemberVO) {
		AdminMapper adminMapper;
		
		int page; // 현재 페이지
		int listcount; // 게시글 갯수
		int startrow;  // 화면에 표시될 첫번째 게시글
		int endrow; // 화면에 표시될 마지막 게시글
		Pagination pagination; // 페이징 처리에 대한 정보를 담은 객체
		
		List<MemberVO> memberList; // 화면에 출력될 회원정보 리스트
		HashMap<String, Object> adminMemberDate; // 회원관리 화면에 필요한 데이터
		
		try {
			adminMapper = sqlSession.getMapper(AdminMapper.class);
			
			// 현재 페이지와 게시글의 갯수를 구하여 페이징 처리를 위한 데이터를 계산한다
			page = adminMemberVO.getPage();
			listcount = adminMapper.getMemberListCount(adminMemberVO);
			pagination = new Pagination(page, listcount, 15, 10);
			pagination.setPageInfo();
			
			// 화면에 표시될 첫번째와 마지막 게시글의 행번호를 할당 후 리스트를 가져온다
			startrow = pagination.getStartrow();
			endrow = pagination.getEndrow();
			adminMemberVO.setStartrow(startrow);
			adminMemberVO.setEndrow(endrow);
			memberList = adminMapper.getMemberList(adminMemberVO);
			
			// 회원관리 화면에 출력될 데이터
			adminMemberDate = new HashMap<String, Object>();
			adminMemberDate.put("pagination", pagination);
			adminMemberDate.put("listcount", listcount);
			adminMemberDate.put("memberList", memberList);
			
			return adminMemberDate;
		} catch(Exception e) {
			System.out.println("getAdminMemberDate 에러");
			e.printStackTrace();
		}
		
		return null;
	}
	
	// 관리자페이지 - 회원정보수정
	@Override
	public void adminMemberUpdate(AdminMemberVO adminMemberVO) {
		AdminMapper adminMapper;
		
		try {
			adminMapper = sqlSession.getMapper(AdminMapper.class);
			adminMapper.adminMemberUpdate(adminMemberVO);
		} catch(Exception e) {
			System.out.println("adminMemberUpdate 에러");
			e.printStackTrace();
		}
	}
	
	// 관리자페이지 - 상품 관리 데이터 가져오기
	@Override
	public HashMap<String, Object> getAdminProductDate(AdminProductVO adminProductVO) {
		AdminMapper adminMapper;
		
		int page; // 현재 페이지
		int listcount; // 게시글 갯수
		int startrow;  // 화면에 표시될 첫번째 게시글
		int endrow; // 화면에 표시될 마지막 게시글
		Pagination pagination; // 페이징 처리에 대한 정보를 담은 객체
		
		List<ProductVO> productList; // 화면에 출력될 상품정보 리스트
		HashMap<String, Object> adminProductDate; // 상품관리 화면에 필요한 데이터
		
		try {
			adminMapper = sqlSession.getMapper(AdminMapper.class);
			
			// 현재 페이지와 게시글의 갯수를 구하여 페이징 처리를 위한 데이터를 계산한다
			page = adminProductVO.getPage();
			listcount = adminMapper.getProductListCount(adminProductVO);
			pagination = new Pagination(page, listcount, 15, 10);
			pagination.setPageInfo();
			
			// 화면에 표시될 첫번째와 마지막 게시글의 행번호를 할당 후 리스트를 가져온다
			startrow = pagination.getStartrow();
			endrow = pagination.getEndrow();
			adminProductVO.setStartrow(startrow);
			adminProductVO.setEndrow(endrow);
			productList = adminMapper.getProductList(adminProductVO);
			
			// 리스트의 카테고리칼럼의 내용을 출력용(한글)으로 변환한다
			for (ProductVO vo : productList) {
				vo.changeTranslateCate_1ToKorean();
			}
			
			// 상품관리 화면에 출력될 데이터
			adminProductDate = new HashMap<String, Object>();
			adminProductDate.put("pagination", pagination);
			adminProductDate.put("listcount", listcount);
			adminProductDate.put("productList", productList);
			
			return adminProductDate;
		} catch(Exception e) {
			System.out.println("getAdminProductDate 에러");
			e.printStackTrace();
		}
		
		return null;
	}
	
	// 관리자페이지 - 상품마감처리
	@Override
	public void adminProductEnd(ProductVO productVO) {
		AdminMapper adminMapper;
		
		try {
			adminMapper = sqlSession.getMapper(AdminMapper.class);
			adminMapper.adminProductEnd(productVO);
		} catch(Exception e) {
			System.out.println("adminProductEnd 에러");
			e.printStackTrace();
		}
	}
	
	// 관리자페이지 - 거래관리 데이터 가져오기
	@Override
	public HashMap<String, Object> getAdminTradingtDate(AdminTradingVO adminTradingVO) {
		AdminMapper adminMapper;
		
		int page; // 현재 페이지
		int listcount; // 게시글 갯수
		int startrow;  // 화면에 표시될 첫번째 게시글
		int endrow; // 화면에 표시될 마지막 게시글
		Pagination pagination; // 페이징 처리에 대한 정보를 담은 객체
		
		List<AdminProductJoinTradingVO> tradingList; // 화면에 출력될 거래정보 리스트
		HashMap<String, Object> adminTradingDate; // 거래관리 화면에 필요한 데이터
		
		try {
			adminMapper = sqlSession.getMapper(AdminMapper.class);
			
			// 현재 페이지와 게시글의 갯수를 구하여 페이징 처리를 위한 데이터를 계산한다
			page = adminTradingVO.getPage();
			listcount = adminMapper.getTradingListCount(adminTradingVO);
			pagination = new Pagination(page, listcount, 15, 10);
			pagination.setPageInfo();
			
			// 화면에 표시될 첫번째와 마지막 게시글의 행번호를 할당 후 리스트를 가져온다
			startrow = pagination.getStartrow();
			endrow = pagination.getEndrow();
			adminTradingVO.setStartrow(startrow);
			adminTradingVO.setEndrow(endrow);
			tradingList = adminMapper.getTradingList(adminTradingVO);
			
			// 거래관리 화면에 출력될 데이터
			adminTradingDate = new HashMap<String, Object>();
			adminTradingDate.put("pagination", pagination);
			adminTradingDate.put("listcount", listcount);
			adminTradingDate.put("tradingList", tradingList);
			
			return adminTradingDate;
		} catch(Exception e) {
			System.out.println("getAdminTradingtDate 에러");
			e.printStackTrace();
		}
		
		return null;
	}
	
	// 관리자페이지 - 거래기한 연장
	@Override
	public TradingVO adminExtendDeadlineOfTrading(TradingVO tradingVO, int target) {
		AdminMapper adminMapper;
		
		HashMap<String, Object> conditionDataForExtension; // 연장에 필요 조건데이터
		TradingVO newTradingVO; // 연장 후 갱신된 데이터
		
		try {
			adminMapper = sqlSession.getMapper(AdminMapper.class);
			
			/*
			 * tradingVO = 상품번호
			 * target = 연장시킬 컬럼 식별
			 * 위 두가지 데이터를 활용하여 거래기한을 연장한다
			 */
			conditionDataForExtension = new HashMap<String,  Object>();
			conditionDataForExtension.put("tradingVO", tradingVO);
			conditionDataForExtension.put("target", target);
			adminMapper.adminExtendDeadlineOfTrading(conditionDataForExtension);
			
			// 연장 후 갱신된 데이터를 가져온다
			newTradingVO = adminMapper.getTradingDeadline(tradingVO);
			
			return newTradingVO;
		} catch(Exception e) {
			System.out.println("adminExtendDeadlineOfTrading 에러");
			e.printStackTrace();
		}
		
		return null;
	}
	
	// 관리자페이지 - 거래 초기화
	@Override
	public TradingVO adminTradingReset(TradingVO tradingVO) {
		AdminMapper adminMapper;
		
		int productNumber; // 상품번호
		String buyerId; // 구매자아이디
		String productSubject; // 상품제목
		String tradingPrice; // 거래가격
		String currentMoney; // 구매자 현재 이머니
		String newCurrentMoney; // 변경된 현재 이머니
		PaymentVO paymentVO; // 거래내역에 추가하기 위한 객체
		
		try {
			
		} catch(Exception e) {
			System.out.println("adminTradingReset 에러");
			e.printStackTrace();
		}
		
		adminMapper = sqlSession.getMapper(AdminMapper.class);
		
		// 거래초기화
		adminMapper.adminTradingReset(tradingVO);
		
		// 상품정보와 구매자의 이머니, 그리고 초기화로 인한 "현재이머니 + 취소금액"을 계산한다
		productNumber = tradingVO.getTrading_product_number();
		buyerId = tradingVO.getTrading_buyer_id();
		productSubject = adminMapper.getProductSubject(productNumber);
		tradingPrice = Integer.toString(tradingVO.getTrading_price());
		currentMoney = adminMapper.findCurrentMoney(buyerId);
		newCurrentMoney = Integer.toString((Integer.parseInt(tradingPrice) + Integer.parseInt(currentMoney)));
		
		// 거래취소로 인해 내역을 추가하고 이머니잔액을 변경한다
		paymentVO = new PaymentVO();
		paymentVO.setPayment_userId(buyerId);
		paymentVO.setPayment_product_subject(productSubject);
		paymentVO.setPayment_amount(tradingPrice);
		paymentVO.setPayment_lastmoney(currentMoney);
		paymentVO.setPayment_nowmoney(newCurrentMoney);
		paymentVO.setPayment_status("거래취소");
		adminMapper.adminCancelPayment(paymentVO);
		adminMapper.changeMoney(buyerId, newCurrentMoney);
		
		return tradingVO;
	}
	
	// 관리자페이지 - 결제관리 데이터 가져오기
	@Override
	public HashMap<String, Object> getAdminPayDate(AdminPayVO adminPayVO) {
		AdminMapper adminMapper;
		
		int page; // 현재 페이지
		int listcount; // 게시글 갯수
		int startrow;  // 화면에 표시될 첫번째 게시글
		int endrow; // 화면에 표시될 마지막 게시글
		Pagination pagination; // 페이징 처리에 대한 정보를 담은 객체
		
		List<PayVO> payList; // 화면에 출력될 결제정보 리스트
		ArrayList<String> payDateList; // 형식이 지정된 날짜정보 리스트
		Date oldPayDate; // 날짜형식이 지정이 안된 데이터
		String newPayDate; // 날짜형식이 지정이 된 데이터
		
		HashMap<String, Object> adminPayDate; // 결제관리 화면에 필요한 데이터
		
		try {
			adminMapper = sqlSession.getMapper(AdminMapper.class);
			
			// 현재 페이지와 게시글의 갯수를 구하여 페이징 처리를 위한 데이터를 계산한다
			page = adminPayVO.getPage();
			listcount = adminMapper.getPayListCount(adminPayVO);
			pagination = new Pagination(page, listcount, 15, 10);
			pagination.setPageInfo();
			
			// 화면에 표시될 첫번째와 마지막 게시글의 행번호를 할당 후 리스트를 가져온다
			startrow = pagination.getStartrow();
			endrow = pagination.getEndrow();
			adminPayVO.setStartrow(startrow);
			adminPayVO.setEndrow(endrow);
			payList = adminMapper.getPayList(adminPayVO);
			
			// 형식이 지정되는 않은 Date형를  String 타입으로 변환하여 리스트에 저장한다
			payDateList = new ArrayList<String>();
			for (PayVO payVO : payList) {
				oldPayDate = payVO.getPay_date();
				newPayDate = new SimpleDateFormat("yyyy-MM-dd HH:mm").format(oldPayDate);
				payDateList.add(newPayDate);
			}
			
			// 결제관리 화면에 출력될 데이터
			adminPayDate = new HashMap<String, Object>();
			adminPayDate.put("pagination", pagination);
			adminPayDate.put("listcount", listcount);
			adminPayDate.put("payList", payList);
			adminPayDate.put("payDateList", payDateList);
			
			return adminPayDate;
		} catch(Exception e) {
			System.out.println("getAdminPayDate 에러");
			e.printStackTrace();
		}
		
		return null;
	}
}
