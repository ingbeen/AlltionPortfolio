package com.spring.alltion.trading;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.alltion.productRegistration.ProductVO;
import com.spring.mapper.BidMapper;
import com.spring.mapper.ProductMapper;
import com.spring.mapper.TradingMapper;

@Service
public class TradingService {

	@Autowired
	private SqlSession sqlSession;
	
	ProductMapper producMapper; // 마이바티스 상품맵퍼
	TradingMapper tradingMapper; // 마이바티스 트레이딩맵퍼
	BidMapper bidMapper; // 마이바티스 응찰맵퍼
	
	public void seachEndOfProduct() {
		
		List<ProductVO> productEndList; // 마감시간이 지난 상품 배열		
		int productReAuction; // 재경매여부
		int productBids; // 응찰수
		
		try {
			// 맵퍼연결
			producMapper = sqlSession.getMapper(ProductMapper.class);
			tradingMapper = sqlSession.getMapper(TradingMapper.class);
			bidMapper = sqlSession.getMapper(BidMapper.class);
			
			// 마감시간이 지난 상품을의 대한 정보를 가져와서 배열에 넣는다
			productEndList = producMapper.searchForDeadline();
			
			// 'productEndList'에 담은 상품갯수가 없다면 함수종료
			if (productEndList.size() == 0) {
				return;
			}
			
			// 상품을 하나씩 꺼내어 조건에 맞는 함수를 실행한다
			for(ProductVO productVO : productEndList) {
				productReAuction = productVO.getProduct_re_auction(); // 재경매여부
				productBids = productVO.getProduct_bids(); // 응찰수
				
				// 응찰수가 1 이상이면 거래테이블 생성
				if (productBids >= 1) {
					tradingInsert(productVO, producMapper, tradingMapper, bidMapper);
				} 
				// 응찰수가 0이고 재경매를 설정을 안했다면 상품 마감
				else if (productBids == 0 && productReAuction == 0) {
					finishProduct(productVO, producMapper);
				} 
				// 응찰수가 0이고 재경매를 설정 했다면 상품 재등록
				else if (productBids == 0 && productReAuction == 1) {
					reAuction(productVO, producMapper);
				}
			}
		} catch(Exception e) {
			System.out.println("seachEndOfProduct 에러");
			e.printStackTrace();
		}
	}
	
	// 경매현재가격이 즉시구매가에 도달했을때 실행될 함수(마감처리)
	public void endOfAuction(int product_number) {
		
		try {
			// 맵퍼연결
			producMapper = sqlSession.getMapper(ProductMapper.class);
			tradingMapper = sqlSession.getMapper(TradingMapper.class);
			bidMapper = sqlSession.getMapper(BidMapper.class);
			
			// 트레이딩(거래중) 테이블에 객체 데이터 삽입(insert)
			tradingInsert(product_number, producMapper, tradingMapper, bidMapper);
		} catch(Exception e) {
			System.out.println("seachEndOfProduct 에러");
			e.printStackTrace();
		}
	}
	
	/* 오버로딩 */
	// 트레이딩(거래중) 테이블 삽입 - seachEndOfProduct에 의한 삽입
	private void tradingInsert(ProductVO productVO, ProductMapper producMapper, 
			TradingMapper tradingMapper, BidMapper bidMapper) throws Exception {
		int product_number; // 상품번호
		String trading_buyer_id; // 구매자
		String endDate;
		String newDepositDeadline;
		TradingVO tradingVO; // DB에 삽입될 트레이딩(거래중) 객체 
		
		// 기존의 상품 객체에서 상품번호를 가져온다
		product_number = productVO.getProduct_number();
		
		// 해당 상품의 최고 응찰자(구매자) 아이디를 가져온다
		trading_buyer_id = bidMapper.getTop_bidder_id(product_number);
		
		// 기존 상품 객체에서 가져온 데이터 중 필수 데이터를 트레이딩 객체에 할당한다
		tradingVO = new TradingVO();
		tradingVO.setTrading_product_number(product_number);
		tradingVO.setTrading_buyer_id(trading_buyer_id);
		tradingVO.setTrading_price(productVO.getProduct_current_price());
		
		// 기존 상품의 마감시간에 하루를 더해 입금기한을 구하여 트레이딩 객체에 할당한다(마감시간 + 1일 = 입금기한)
		endDate = productVO.getProduct_end_date();
		newDepositDeadline = getDepositDeadline(endDate);
		tradingVO.setTrading_deposit_deadline(newDepositDeadline);
		
		// 트레이딩(거래중) 테이블에 객체 데이터 삽입(insert)
		tradingMapper.tradingInsertTheProductEnd(tradingVO);
		
		// 해당 상품테이블에서 마감처리(0 -> 1)
		producMapper.changePoductProgressToEnd(product_number);
	}
	
	/* 오버로딩 */
	// 트레이딩(거래중) 테이블 삽입 - 즉시구매 혹은 즉시구매가가 경매현재가와 같아졌을때
	private void tradingInsert(int product_number, ProductMapper producMapper, 
			TradingMapper tradingMapper, BidMapper bidMapper) throws Exception {
		String trading_buyer_id; // 구매자
		String toDay; // 
		String newDepositDeadline; //
		ProductVO productVO; //
		TradingVO tradingVO; // DB에 삽입될 트레이딩(거래중) 객체 
		
		// 
		productVO = producMapper.getProduct(product_number);
		
		// 해당 상품의 최고 응찰자(구매자) 아이디를 가져온다
		trading_buyer_id = bidMapper.getTop_bidder_id(product_number);
		
		// 기존 상품 객체에서 가져온 데이터 중 필수 데이터를 트레이딩 객체에 할당한다
		tradingVO = new TradingVO();
		tradingVO.setTrading_product_number(product_number);
		tradingVO.setTrading_buyer_id(trading_buyer_id);
		tradingVO.setTrading_price(productVO.getProduct_current_price());
		
		// 현재시간에 하루를 더해 입금기한을 구하여 트레이딩 객체에 할당한다(현재시간 + 1일 = 입금기한)
		toDay = getToday();
		newDepositDeadline = getDepositDeadline(toDay);
		tradingVO.setTrading_deposit_deadline(newDepositDeadline);
		
		// 트레이딩(거래중) 테이블에 객체 데이터 삽입(insert)
		tradingMapper.tradingInsertTheProductEnd(tradingVO);
		
		// 해당 상품테이블에서 마감처리(0 -> 1)
		producMapper.changePoductProgressToEnd(product_number);
	}
	
	// 상품 마감
	private void finishProduct(ProductVO productVO, ProductMapper producMapper) {
		// 마감처리 될 상품번호를 가져온다
		int product_number = productVO.getProduct_number();
		
		// 해당 상품테이블에서 마감처리(0 -> 1)
		producMapper.changePoductProgressToEnd(product_number);
	}
	
	// 재경매 등록
	private void reAuction(ProductVO productVO, ProductMapper producMapper) throws Exception {
		int oldStartingPrice; // 기존 상품의 시작가
		int newStartingPrice; // 재경매 상품에 적용될 시작가
		
		String productEndDate; // 기존 상품 마감일
		String productIssueDate; //  기존 상품 등록일
		
		DateFormat format; // 날짜형식 
		Date endDate; // 포맷 지정된 마감일
		Date issueDate; // 포맷 지정된 등록일
		
		double auctionPeriod; // 경매기간(마감일 - 등록일)
		int auctionPeriodForDay; // 경매기간(일단위)
		
		// 기존 상품의 시작가를 가져와서 차감 후 새로운 가격을 할당한다
		oldStartingPrice = productVO.getProduct_starting_price();
		newStartingPrice = calcStartingPrice(oldStartingPrice);
		productVO.setProduct_starting_price(newStartingPrice);
		
		// 기존 상품의 마감일과 등록일을 가져온다
		productEndDate = productVO.getProduct_end_date();
		productIssueDate = productVO.getProduct_issue_date();
		
		// 포맷형식을 지정하고 마감일과 등록일에 적용한다
		format = new SimpleDateFormat("yyyy-MM-dd HH:mm");
		endDate = format.parse(productEndDate);
		issueDate = format.parse(productIssueDate);
		
		// 마감시간에서 등록일을 차감 -> 일단위 -> 올림처리 -> int로 형변환
		// 경매기간(일단위)를 구하는 작업
		auctionPeriod = endDate.getTime() - issueDate.getTime();
		auctionPeriodForDay = (int) Math.ceil(auctionPeriod / (24*60*60*1000));
		
		// 기존 상품의 마감일에  + 경매기간(일단위)하여 새로운 마감일을 할당한다
		Calendar cal = Calendar.getInstance();
		cal.setTime(endDate);
		cal.add(Calendar.DATE, auctionPeriodForDay);
		productVO.setProduct_end_date(format.format(cal.getTime()));
		
		// 재경매여부를 0(안함)으로 바꾸고 새로운상품을 등록(insert)한다
		productVO.setProduct_re_auction(0);
		producMapper.productInsert(productVO);
	}
	
	// 재경매시  기존 경매시작가를 파라미터로 받아 차감된 경매시작가를 구한다
	private int calcStartingPrice(int oldStartingPrice) {
		int newStartingPrice; // 새로운(차감된) 경매시작가
		
		// 금액 구간별 차감금액이 다르다
		if (oldStartingPrice <= 10000) {
			newStartingPrice = oldStartingPrice - 1000;
		} else if (oldStartingPrice <= 30000) {
			newStartingPrice = oldStartingPrice - 3000;
		} else if (oldStartingPrice <= 50000) {
			newStartingPrice = oldStartingPrice - 5000;
		} else if (oldStartingPrice <= 100000) {
			newStartingPrice = oldStartingPrice - 10000;
		} else if (oldStartingPrice <= 300000) {
			newStartingPrice = oldStartingPrice - 20000;
		} else if (oldStartingPrice <= 500000) {
			newStartingPrice = oldStartingPrice - 30000;
		} else {
			newStartingPrice = oldStartingPrice - 40000;
		}
		
		// 최저 시작가는 1,000원이다
		if (newStartingPrice < 1000) {
			newStartingPrice = 1000;
		}
		
		// 새로운(차감된) 경매시작가 반환
		return newStartingPrice;
	}
	
	/* 오버로딩 */
	// 파라미터로 넘어온 날짜에 하루를 더해 반환하는 함수
	private String getDepositDeadline(String oldDate) throws Exception {
		Calendar cal; // 캘린더객체
		DateFormat format; // 날짜형식 
		Date FormatOldDate; // 포맷 지정된 기존 날짜
		String newDate; // 새로운 날짜(반환될 날짜)
		
		// 포맷형식을 지정하고 기존 날짜에 적용한다
		format = new SimpleDateFormat("yyyy-MM-dd HH:mm");
		FormatOldDate = format.parse(oldDate);
		
		// 하루를 더하여 스트링타입으로  반환
		cal = Calendar.getInstance();
		cal.setTime(FormatOldDate);
		cal.add(Calendar.DATE, 1);
		newDate = format.format(cal.getTime());
		
		return newDate;
	}
	
	/* 오버로딩 */
//	// 파라미터로 넘어온 날짜에 하루를 더해 반환하는 함수
//	private String getDepositDeadline(String productEndDate, 
//			String productIssueDate) throws Exception {
//		Calendar cal; // 캘린더객체
//		DateFormat format; // 날짜형식 
//		Date FormatOldDate; // 포맷 지정된 기존 날짜
//		String newDate; // 새로운 날짜(반환될 날짜)
//		
//		// 포맷형식을 지정하고 기존 날짜에 적용한다
//		format = new SimpleDateFormat("yyyy-MM-dd HH:mm");
//		FormatOldDate = format.parse(oldDate);
//		
//		// 하루를 더하여 스트링타입으로  반환
//		cal = Calendar.getInstance();
//		cal.setTime(FormatOldDate);
//		cal.add(Calendar.DATE, 1);
//		newDate = format.format(cal.getTime());
//		
//		return newDate;
//	}
	
	// 현재시간을 반환하는 함수
	private String getToday() throws Exception {
		Calendar cal; // 캘린더객체
		DateFormat format; // 날짜형식 
		String toDay; // 현재날짜
		
		// 현재날짜를 지정된 포맷에 적용하여 스트링타입으로 반환
		cal = Calendar.getInstance(); 
		cal.setTime(new Date()); 
		format = new SimpleDateFormat("yyyy-MM-dd HH:mm"); 
		toDay = format.format(cal.getTime());
		
		return toDay;
	}
}
