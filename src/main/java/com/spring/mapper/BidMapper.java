package com.spring.mapper;

import java.util.List;

import com.spring.alltion.hongsub.BidVO;

public interface BidMapper {

	List<BidVO> bidList(int bno);

	int countBidList(int bid_product_number);

	int selectNowPrice(int bid_product_number);

	int bidInsert(BidVO bidvo);


}
