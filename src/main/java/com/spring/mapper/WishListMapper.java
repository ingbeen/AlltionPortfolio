package com.spring.mapper;

import java.util.HashMap;

public interface WishListMapper {
	int getWishListCount(String userId);
	void deleteWishList(HashMap<String, Object> hm);
}
