package com.spring.alltion.mypage;

import java.util.List;

import com.spring.alltion.productRegistration.ProductVO;

public interface WishListService {
	List<ProductVO> getWishList(String userId);
}
