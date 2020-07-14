package com.spring.alltion.mypage;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.spring.alltion.productRegistration.ProductVO;
import com.spring.mapper.ProductMapper;
import com.spring.mapper.WishListMapper;

@Service
public class WishListServiceImpl implements WishListService {
	
	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<ProductVO> getWishList(String userId, Model model) {
		WishListMapper wishListMapper;
		ProductMapper productMapper;
		List<Integer> ProductNumberList;
		List<ProductVO> wishList;
		
		wishListMapper = sqlSession.getMapper(WishListMapper.class);
		productMapper = sqlSession.getMapper(ProductMapper.class);
		
		ProductNumberList = wishListMapper.getWishList(userId);
		
		if (ProductNumberList.size() != 0) {
			wishList = productMapper.getProductForWishList(ProductNumberList);
		} else {
			wishList = null;
		}
		
		return wishList;
	}

}
