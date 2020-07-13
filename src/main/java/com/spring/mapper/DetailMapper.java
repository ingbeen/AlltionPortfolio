package com.spring.mapper;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import com.spring.alltion.detailpage.Seller_Credit_Score_TestVO;
import com.spring.alltion.productRegistration.ProductVO;

public interface DetailMapper {

	ArrayList<ProductVO> getBoardList();

	ProductVO getDetail(int product_number);

	int selectNowPrice(int bid_product_number);

	void updateBoard(@Param("price")int price,@Param(value="bid_product_number") int bid_product_number);

	int selectPurchasePrice(int bid_product_number);

	Seller_Credit_Score_TestVO sellerTest(String sale_id);

}
