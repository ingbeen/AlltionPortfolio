package com.spring.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.spring.alltion.productRegistration.ProductVO;

public interface ProductMapper {
	int productInsert(ProductVO productVO);
	List<ProductVO> searchForDeadline();
	void changePoductProgressToEnd(int productNumber);
	ProductVO getProduct(int productNumber);
	List<ProductVO> getProductForWishList(
			@Param(value = "userId") String userId,
			@Param(value = "startrow") int startrow,
			@Param(value = "endrow") int endrow
	);
}
