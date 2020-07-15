package com.spring.alltion.mypage;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.alltion.detailpage.DetailServiceImpl;
import com.spring.alltion.productRegistration.ProductVO;
import com.spring.mapper.ProductMapper;
import com.spring.mapper.WishListMapper;

@Service
public class WishListServiceImpl implements WishListService {
	
	@Autowired
	private SqlSession sqlSession;
	
	@Autowired
	private DetailServiceImpl detailServiceImpl;

	@Override
	public List<ProductVO> getWishList(String userId) {
		WishListMapper wishListMapper; // 마이바티스 찜목록맵퍼
		ProductMapper productMapper; // 마이바티스 상품맵퍼
		List<Integer> ProductNumberList; // 찜목록에 있는 상품번호 리스트
		List<ProductVO> wishList = null; // 상품정보 리스트
		
		try {
			wishListMapper = sqlSession.getMapper(WishListMapper.class);
			productMapper = sqlSession.getMapper(ProductMapper.class);
			
			// 로그인 한 아이디 기준으로 찜목록에 있는 상품번호들을 가져온다
			ProductNumberList = wishListMapper.getWishList(userId);
			
			// 찜목록이 한개 이상이라면 실행
			if (ProductNumberList.size() != 0) {
				// 상품번호리스트로 조건을 걸어 상품정보들을 가져온다
				wishList = productMapper.getProductForWishList(ProductNumberList);
				
				// DB형식으로 저장되었는 것들을 변환시켜준다 예) cate0101 -> 여성의류
				for (ProductVO productVO : wishList) {
					translateCategory(productVO); // 카테고리 한글로 다듬기
					translatedelivery(productVO); // 택배한글로 다듬기
					translateTransactionArea(productVO); // 직거래 한글로 다듬기
				}
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return wishList;
	}
	
	// 카테고리 한글로 다듬기
	public void translateCategory(ProductVO productVO) {
		String productCategory_1; // 1차 카테고리(DB버전)
		String newProductCategory_1; // 1차 카테고리(view버전)
		String productCategory_2; // 2차 카테고리(DB버전)
		String newProductCategory_2; // 2차 카테고리(view버전)
		
		// 1차 카테고리 다듬기
		productCategory_1 = productVO.getProduct_category_1();
		newProductCategory_1 = detailServiceImpl.TranslateCate_1(productCategory_1);
		productVO.setProduct_category_1(newProductCategory_1);
		
		// 2차 카테고리 다듬기
		productCategory_2 = productVO.getProduct_category_2();
		newProductCategory_2 = detailServiceImpl.TranslateCate_2(productCategory_2);
		productVO.setProduct_category_2(newProductCategory_2);
	}
	
	// 택배 한글로 다듬기
	public void translatedelivery(ProductVO productVO) {
		// DB에 저장된 택배컬럼을 가져온다
		String productDelivery = productVO.getProduct_delivery();
		
		// 아래 조건에 맞게 변형시킨다(한글로)
		if (productDelivery.equals("before")) {
			productDelivery = "선불";
		} else if (productDelivery.equals("after")) {
			productDelivery = "착불";
		} else {
			productDelivery = "불가능";
		}
		
		// 변형된 데이터를 셋한다
		productVO.setProduct_delivery(productDelivery);
	}
	
	// 직거래 한글로 다듬기
	public void translateTransactionArea(ProductVO productVO) {
		// DB에 저장된 직거래컬럼을 가져온다
		String productTransactionArea = productVO.getProduct_transaction_area();

		// 아래 조건에 맞게 변형시킨다(한글로)
		if (productTransactionArea.equals("none")) {
			productTransactionArea = "불가능";
		}
		
		// 변형된 데이터를 셋한다
		productVO.setProduct_transaction_area(productTransactionArea);
	}
}
