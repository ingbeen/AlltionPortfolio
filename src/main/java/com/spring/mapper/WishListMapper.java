package com.spring.mapper;

import java.util.List;

public interface WishListMapper {
	List<Integer> getWishList(String userId);
}
