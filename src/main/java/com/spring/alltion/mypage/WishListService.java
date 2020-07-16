package com.spring.alltion.mypage;

import java.util.HashMap;
import java.util.List;
import com.spring.alltion.productRegistration.ProductVO;

public interface WishListService {
	HashMap<String, Object> getContentsData(String userId, int page);
	void deleteWishList(List<String> deleteWishList, String userId);
}
