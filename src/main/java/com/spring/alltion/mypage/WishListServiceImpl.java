package com.spring.alltion.mypage;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
	public HashMap<String, Object> getContentsData(String userId, int page) {
		WishListMapper wishListMapper; // 마이바티스 찜목록맵퍼
		ProductMapper productMapper; // 마이바티스 상품맵퍼
		List<ProductVO> wishList = null; // 상품정보 리스트
		HashMap<String, Object> contentsData = null;
		
		try {
			wishListMapper = sqlSession.getMapper(WishListMapper.class);
			productMapper = sqlSession.getMapper(ProductMapper.class);
			// 총 리스트 수를 받아옴
			int listcount = wishListMapper.getWishListCount(userId);
			
			Map<String, Integer> pagesAndRows = getPagesAndRows(userId, page, listcount);
			
			int startrow = pagesAndRows.get("startrow");
			int endrow = pagesAndRows.get("endrow");
			
			wishList = productMapper.getProductForWishList(userId, startrow, endrow);
			
			// 찜목록이 한개 이상이라면 실행
			if (wishList.size() != 0) {
				// DB형식으로 저장되었는 것들을 변환시켜준다 예) cate0101 -> 여성의류
				for (ProductVO productVO : wishList) {
					translateCategory(productVO); // 카테고리 한글로 다듬기
					translatedelivery(productVO); // 택배한글로 다듬기
					translateTransactionArea(productVO); // 직거래 한글로 다듬기
				}
			}

			contentsData = new HashMap<String, Object>();
			
			contentsData.put("pagesAndRows", pagesAndRows);
			contentsData.put("listcount", listcount);
			contentsData.put("wishList", wishList);
			
			
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return contentsData;
	}

	@Override
	public void deleteWishList(List<String> deleteWishList, String userId) {
		WishListMapper wishListMapper; // 마이바티스 찜목록맵퍼
		wishListMapper = sqlSession.getMapper(WishListMapper.class);
		
		HashMap<String, Object> hm = new HashMap<String, Object>();
		hm.put("userId", userId);
		hm.put("deleteWishList", deleteWishList);
		
		wishListMapper.deleteWishList(hm);
		
	}
	
	// 현재 페이지번호에 따른 row번호와 
	public Map<String, Integer> getPagesAndRows(String userId, int page, int listcount) {
		// 한 화면에 보이는 글의 갯수
		int rowlimit = 5;
		
		int pagelimit = 5;
		
		// 읽기 시작할 row 번호
		int startrow = (page - 1) * rowlimit + 1;

		// 읽을 마지막 row 번호
		int endrow = startrow + rowlimit - 1;

		// 0.9를 더해서 페이지를 총페이지수를 구함(글이 1개이면 1페이지, 11개면 2페이지, 101개면 11페이지)
		int maxpage = (int) ((double) listcount / rowlimit + 0.9);

		// 하단 페이지링크 갯수[이전] [1] ... [10] [다음]의 [1]에 해당
		int startpage = (((int) ((double) page / pagelimit + 0.9)) - 1) * pagelimit + 1;

		// 하단 페이지링크 갯수[이전] [1] ... [10] [다음]의 [10]에 해당
		int endpage = maxpage;

		// 글이 1개이면 startpage는 1이 되고 maxpage는 1이 된다
		// 글이 11개이면 startpage는 1이 되고 maxpage는 2이 된다
		// 글이 101개이면 startpage는 1이 되고 maxpage는 11이 된다
		// 글이 101인 상태에서는 하단에 page링크는 1~10까지만 떠야되며 11은 뜨지 말아야 된다
		// 그걸 위해 startpage가 1일때는 10까지만 11일때는 20까지만 뜨게 한다
		if (endpage > startpage + pagelimit - 1) {
			endpage = startpage + pagelimit - 1;
		}
		
		// getBoardList에서 실행되는 sql문을 위한 파라미터 할당
		Map<String, Integer> pagesAndRows = new HashMap<String, Integer>();
		pagesAndRows.put("startrow", startrow);
		pagesAndRows.put("endrow", endrow);
		pagesAndRows.put("page", page);
		pagesAndRows.put("maxpage", maxpage);
		pagesAndRows.put("startpage", startpage);
		pagesAndRows.put("endpage", endpage);
		
		System.out.println("maxpage = " + maxpage);
		System.out.println("startpage = " + startpage);
		System.out.println("endpage = " + endpage);
		
		return pagesAndRows;
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
