package com.spring.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.spring.alltion.hongsub.BidVO;

public interface BidMapper {

	List<BidVO> bidList(@Param(value="bno")int bno,@Param(value="bid_startrow") int bid_startrow,@Param(value="bid_endrow") int bid_endrow);

	int countBidList(int bid_product_number);

	int selectNowPrice(int bid_product_number);

	int bidInsert(BidVO bidvo);

	String getTop_bidder_id(int bid_product_number);


}
