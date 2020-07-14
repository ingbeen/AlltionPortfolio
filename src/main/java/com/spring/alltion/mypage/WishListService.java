package com.spring.alltion.mypage;

import java.util.List;

import org.springframework.ui.Model;

import com.spring.alltion.productRegistration.ProductVO;

public interface WishListService {
	List<ProductVO> getWishList(String userId, Model model);
}
