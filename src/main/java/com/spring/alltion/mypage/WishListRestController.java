package com.spring.alltion.mypage;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.spring.alltion.productRegistration.ProductVO;

@RestController
public class WishListRestController {
	
	@Autowired
	private WishListServiceImpl wishListServiceImpl;
	
	@RequestMapping(value = "getWishList.yb")
	public List<ProductVO> home(HttpSession session, Model model) {
		String userId = (String)session.getAttribute("userId");
		List<ProductVO> wishList = wishListServiceImpl.getWishList(userId, model);
        
		return wishList;
	}
	
}
