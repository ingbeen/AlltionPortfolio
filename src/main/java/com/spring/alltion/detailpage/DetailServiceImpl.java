package com.spring.alltion.detailpage;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.spring.alltion.productRegistration.ProductVO;
import com.spring.mapper.DetailMapper;

@Service
public class DetailServiceImpl {

	@Autowired
	private SqlSession sqlSession;
	
	//경매 상품 정보 불러오기
	public ProductVO getDetail(int product_number) {
		DetailMapper detailmapper = sqlSession.getMapper(DetailMapper.class);
		ProductVO productvo = detailmapper.getDetail(product_number);
		// 1차 카테고리 다듬기
		String product_category_1 = productvo.getProduct_category_1();
		productvo.setProduct_category_1(TranslateCate_1(product_category_1));
		
		// 2차 카테고리 다듬기
		String product_category_2 = productvo.getProduct_category_2();
		productvo.setProduct_category_2(TranslateCate_2(product_category_2));
		
		// 거래방법 한글로 다듬기 (택배)
		String product_delivery = productvo.getProduct_delivery();
		if(product_delivery.equals("before")) {
			product_delivery = "선불";
		}else if(product_delivery.equals("after")) {
			product_delivery = "착불";
		}else{
			product_delivery = "불가능";
		}
		productvo.setProduct_delivery(product_delivery);
		
		// 거래방법 한글로 다듬기 (직거래)
		String product_transaction_area = productvo.getProduct_transaction_area();
		if(product_transaction_area.equals("none")) {
			product_transaction_area = "불가능";
		}
		
		productvo.setProduct_transaction_area(product_transaction_area);
		
		return productvo;
	}
	
	// 판매자 신용정보 불러오기
	public Seller_Credit_Score_TestVO seller_credit_score_test(String sale_id) {
		DetailMapper detailmapper = sqlSession.getMapper(DetailMapper.class);
		Seller_Credit_Score_TestVO scstvo = detailmapper.sellerTest(sale_id);
		
		return scstvo;
	}
	
	/*
	// 남은 시간이 완료되었을때 경매가 종료되고
	// product테이블의 product_progress 가 1로바뀜 (경매진행중일때는 0임)
	public int update_product_progress(int product_number) {
		DetailMapper detailmapper = sqlSession.getMapper(DetailMapper.class);
		
		return detailmapper.update_product_progress(product_number);
	}
	*/
	// 1차 카테고리 한글 변환 (저장은 영어로되어있음)
	public String TranslateCate_1(String product_category_1) {
		
		switch(product_category_1) {
			case "cate01":
				product_category_1 = "패션";
				break;
			case "cate02":
				product_category_1 = "뷰티";
				break;
			case "cate03":
				product_category_1 = "출산/유아동";
				break;
			case "cate04":
				product_category_1 = "전자기기";
				break;
			case "cate05":
				product_category_1 = "가전제품";
				break;
			case "cate06":
				product_category_1 = "가구/인테리어";
				break;
			case "cate07":
				product_category_1 = "반려동물/취미";
				break;
			case "cate08":
				product_category_1 = "도서/음반/문구";
				break;
			case "cate09":
				product_category_1 = "티켓/쿠폰";
				break;
			case "cate10":
				product_category_1 = "스포츠";
				break;
			case "cate11":
				product_category_1 = "공구/산업";
				break;
			case "cate12":
				product_category_1 = "기타잡화";
				break;
			default:
				product_category_1 = "기타잡화";
				break;
		}
		
		return product_category_1;
	}
	
	// 2차 카테고리 한글 변환 (저장은 영어로되어있음)
	public String TranslateCate_2(String product_category_2) {
		// 2차 카테고리 (출산/유아동) 까지만 만들었음.
		
		switch(product_category_2) {
		case "cate0101":
			product_category_2 = "여성의류";
			break;
		case "cate0102":
			product_category_2 = "남성의류";
			break;
		case "cate0103":
			product_category_2 = "여성신발";
			break;
		case "cate0104":
			product_category_2 = "남성신발";
			break;
		case "cate0105":
			product_category_2 = "액세서리";
			break;
		case "cate0106":
			product_category_2 = "귀금속";
			break;
		case "cate0107":
			product_category_2 = "모자";
			break;
		case "cate0108":
			product_category_2 = "기타잡화/관련용품";
			break;
		case "cate0109":
			product_category_2 = "수입명품";
			break;
			
		case "cate0201":
			product_category_2 = "스킨케어";
			break;
		case "cate0202":
			product_category_2 = "메이크업";
			break;
		case "cate0203":
			product_category_2 = "헤어/바디";
			break;
		case "cate0204":
			product_category_2 = "향수";
			break;
		case "cate0205":
			product_category_2 = "네일케어";
			break;
		case "cate0206":
			product_category_2 = "남성 화장품";
			break;
		case "cate0207":
			product_category_2 = "가발/기타용품";
			break;
		
		case "cate0301":
			product_category_2 = "출산/육아용품";
			break;
		case "cate0302":
			product_category_2 = "유아동안전/실내용품";
			break;
		case "cate0303":
			product_category_2 = "유아동의류";
			break;
		case "cate0304":
			product_category_2 = "유아동잡화";
			break;
		case "cate0305":
			product_category_2 = "유아동가구";
			break;
		case "cate0306":
			product_category_2 = "기타 유아동용품";
			break;
		
		default:
			product_category_2 = "기타잡화";
			break;
		}
		
		return product_category_2;
	}
	
	public List<ReviewVO> reviewListService(String review_id, int page, Model model) {
		DetailMapper detailmapper = sqlSession.getMapper(DetailMapper.class);
		
		int review_page = 1;
		int review_limit = 5;
		if(page!=0) {
			review_page = page;
		}
		int review_listcount = 0;
		review_listcount = reviewListCount(review_id);
		int review_endrow = review_listcount - (review_page-1)*5;
		int review_startrow = review_endrow - review_limit +1;
		
		int review_maxpage = (int)((double)review_listcount/review_limit+0.9);
		int review_startpage = (((int)((double)review_page/10+0.9))-1)*10+1;
		int review_endpage = review_maxpage;
		if(review_endpage>review_startpage+10-1) {
			review_endpage = review_startpage+10-1;
		}
		model.addAttribute("review_page",review_page);
		model.addAttribute("review_maxpage",review_maxpage);
		model.addAttribute("review_startpage",review_startpage);
		model.addAttribute("review_endpage",review_endpage);
		model.addAttribute("review_listcount",review_listcount);
		
		return detailmapper.reviewList(review_id,review_startrow,review_endrow);
	}
	
	public int reviewListCount(String review_id) {
		DetailMapper detailmapper = sqlSession.getMapper(DetailMapper.class);
		
		return detailmapper.getReviewCount(review_id);
	}
}
