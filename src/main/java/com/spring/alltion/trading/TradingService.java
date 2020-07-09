package com.spring.alltion.trading;

import java.text.DateFormat;
import java.text.ParseException;
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
	
	public void seachEndOfProduct() {
		ProductMapper producMapper;
		TradingMapper tradingMapper;
		BidMapper bidMapper;
		List<ProductVO> productEndList;
		
		try {
			producMapper = sqlSession.getMapper(ProductMapper.class);
			tradingMapper = sqlSession.getMapper(TradingMapper.class);
			bidMapper = sqlSession.getMapper(BidMapper.class);
			
			productEndList = producMapper.searchForDeadline();
			
//			System.out.println("사이즈");
//			System.out.println(productEndList.size());
			
			if (productEndList.size() == 0) {
				return;
			}
			
			for(ProductVO productVO : productEndList) {
				int product_re_auction = productVO.getProduct_re_auction();
				
				if (product_re_auction == 0) {
					int product_number = productVO.getProduct_number();
//					System.out.println("상품번호 = " + product_number);
					String trading_buyer_id = bidMapper.getTop_bidder_id(product_number);
					
//					System.out.println("구매자 = " + trading_buyer_id);
					
					TradingVO tradingVO = new TradingVO();
					tradingVO.setTrading_product_number(product_number);
					tradingVO.setTrading_buyer_id(trading_buyer_id);
					tradingVO.setTrading_price(productVO.getProduct_current_price());
					tradingVO.setTrading_deposit_deadline(productVO.getProduct_end_date());
					
					tradingMapper.tradingInsertTheProductEnd(tradingVO);
					
					producMapper.changePoductProgressToEnd(product_number);
					
					System.out.println("성공 = " + product_number);
				} else {
					int product_number = productVO.getProduct_number();
//					System.out.println("상품번호 = " + product_number);
					
					int oldStarting_price = productVO.getProduct_starting_price();
					int newStarting_price;
					if (oldStarting_price <= 10000) {
						newStarting_price = oldStarting_price - 1000;
					} else if (oldStarting_price <= 30000) {
						newStarting_price = oldStarting_price - 3000;
					} else if (oldStarting_price <= 50000) {
						newStarting_price = oldStarting_price - 5000;
					} else if (oldStarting_price <= 100000) {
						newStarting_price = oldStarting_price - 10000;
					} else if (oldStarting_price <= 300000) {
						newStarting_price = oldStarting_price - 20000;
					} else if (oldStarting_price <= 500000) {
						newStarting_price = oldStarting_price - 30000;
					} else {
						newStarting_price = oldStarting_price - 40000;
					}
					
					productVO.setProduct_starting_price(newStarting_price);
					
					String product_end_date = productVO.getProduct_end_date();
					String product_issue_date = productVO.getProduct_issue_date();
					
					DateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm");
					try { 
						Date end_date = format.parse("2020-07-18 17:00");
						Date issue_date = format.parse("2020-07-17 17:30");
						
						long calDate = end_date.getTime() - issue_date.getTime();
						
						long calDateDays = calDate / (60*60*1000);
						
						// if(calDateDays % 24가 23~20이상면 하루추가)
						
						System.out.println("calDateDays  = " + calDateDays);
						
						Calendar cal = Calendar.getInstance();
						cal.setTime(end_date);
						cal.add(Calendar.DATE, 2);
						cal.add(Calendar.MONTH, 2);
						System.err.println(format.format(cal.getTime()));
					} catch (ParseException e) {
						e.printStackTrace();
					}
					
					System.out.println("성공 = " + product_number);
				}

			}
			
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
}
