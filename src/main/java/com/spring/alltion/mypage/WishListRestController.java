package com.spring.alltion.mypage;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.spring.alltion.productRegistration.ProductVO;

@RestController
public class WishListRestController {
	
	@Autowired
	private WishListServiceImpl wishListServiceImpl;
	
	@RequestMapping(value = "getWishList.yb")
	public HashMap<String, Object> getWishList(HttpSession session, int page) {
		String userId = (String)session.getAttribute("userId");
		HashMap<String, Object> contentsData = wishListServiceImpl.getContentsData(userId, page);
        
		return contentsData;
	}
	
	@RequestMapping(value = "wishListDelete.yb")
	public void wishListDelete(HttpSession session, @RequestParam(value="deleteWishList[]") List<String> deleteWishList) {
		String userId = (String)session.getAttribute("userId");
		wishListServiceImpl.deleteWishList(deleteWishList, userId);
		
	}
	
}
