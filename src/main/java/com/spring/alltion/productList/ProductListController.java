package com.spring.alltion.productList;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.http.HttpResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.spring.alltion.productRegistration.ProductVO;

@Controller
public class ProductListController {
	
	@Autowired
	private ProductlistService productlistService;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home() {
	
		return "productList/productList";
	}
	@RequestMapping(value = "/Mainlist.ms", method = RequestMethod.GET)
	public String getMainlist(Model model) {
		model.addAttribute("mainlist", productlistService.getMainlist());
		model.addAttribute("pricelist", productlistService.getfamousPricelist2());
		model.addAttribute("participantslist", productlistService.getfamousParticipantslist2());
		model.addAttribute("viewslist", productlistService.getfamousViewslist2());
		
		return "productList/mainlist";
	}
	
	@RequestMapping(value = "/goDetail.ms")
	public String goDetail() {
		
		return "/boardetail.hs";
	}

	@RequestMapping(value = "/productList.ms", method = RequestMethod.GET)
	public String getProductList(Model model, @RequestParam(value="page" , required=false, defaultValue="1") int page) throws Exception {
		int limit = 9;
		int listcount = productlistService.getListCount();
		int startrow = (page - 1) * 5 + 1;
		int endrow = startrow + limit - 1;
		HashMap<String, Integer> hashmap = new HashMap<String, Integer>();
		hashmap.put("startrow", startrow);
		hashmap.put("endrow", endrow);
		List<ProductVO> productlist = productlistService.getproductList(hashmap);
		
		// 총 페이지 수
		int maxpage=(int)((double)listcount/limit+0.95);
		// 페이지 첫 시작 숫자(1, 6, 11 ��...)
   		int startpage = (((int) ((double)page / 10 + 0.9)) - 1) * 5 + 1;
   		// 페이지 마지막 숫자(5, 10, 15 ��...)
   		int endpage = maxpage;
   		
   		if (endpage>startpage+5-1) endpage=startpage+5-1;
   		
		model.addAttribute("page", page);	
		model.addAttribute("listcount", listcount);
		model.addAttribute("productlist", productlist);
		model.addAttribute("maxpage", maxpage);
		model.addAttribute("startpage", startpage);
		model.addAttribute("endpage", endpage);
		
		return "productList/productList";
	}
	
	@RequestMapping(value = "/getCategorylist.ms", method = RequestMethod.GET)
	public String getCategorylist(HttpServletRequest res,@RequestParam(value = "product_category_2") String product_category_2, @RequestParam(value = "sortD", defaultValue="sort1") String sortD, Model model) {
		String category = res.getParameter("product_category_2");
		String sort = res.getParameter("sortD");
		List<ProductVO> categorylist = null;
		List<ProductVO> pricelist = null;
		List<ProductVO> participantslist = null;
		List<ProductVO> viewslist = null;
		if(sortD.equals("sort1")) {
		categorylist = productlistService.getCategorylist(product_category_2);
		pricelist = productlistService.getfamousPricelist(product_category_2);
		participantslist = productlistService.getfamousPricelist(product_category_2);
		viewslist = productlistService.getfamousPricelist(product_category_2);
		
		model.addAttribute("categorylist", categorylist);
		model.addAttribute("pricelist", pricelist);
		model.addAttribute("participantslist", participantslist);
		model.addAttribute("viewslist", viewslist);
		}else {
			categorylist = productlistService.getOrderbylist(category, sort);
			pricelist = productlistService.getfamousPricelist(product_category_2);
			participantslist = productlistService.getfamousPricelist(product_category_2);
			viewslist = productlistService.getfamousPricelist(product_category_2);
			model.addAttribute("categorylist", categorylist);
			model.addAttribute("pricelist", pricelist);
			model.addAttribute("participantslist", participantslist);
			model.addAttribute("viewslist", viewslist);
		}
		String category1 = TranslateCate_1(product_category_2.substring(0, 6));
		String category2 = TranslateCate_2(product_category_2);
		model.addAttribute("category1", category1);
		model.addAttribute("category2", category2);
		/*
		if(product_category_2.equals("cate0104")) {
			product_category_2 = "패션 -> 남성신발";
		}
		model.addAttribute("category", product_category_2);
		*/
		return "productList/productList";
	}
	
	@RequestMapping(value = "/getOrderbylist.bo", method = RequestMethod.POST)
	public String getOrderbylist(HttpServletRequest req, @RequestParam(value = "product_category_2") String product_category_2, @RequestParam(value = "sortD", defaultValue="sort1") String sortD) {
		System.out.println("getOrderbylist.bo 도착");
		//Parameter
		String sort_list = sortD;
		if(sort_list.equals("sort1")) {
			sort_list = "product_issue_date";
		}else if(sort_list.equals("sort2")) {
			sort_list = "product_views";
		}else if(sort_list.equals("sort3")) {
			sort_list = "product_current_price";
		}else {
			sort_list = "product_current_price";
		}
		req.setAttribute("sortD", sort_list);
		req.setAttribute("product_category_2", product_category_2);
		return "forward:/getCategorylist.ms";
	}
	
	
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
	
	public String TranslateCate_2(String product_category_2) {
		
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
		
		case "cate0401":
			product_category_2 = "모바일";
			break;
		case "cate0402":
			product_category_2 = "태블릿 PC";
			break;
		case "cate0403":
			product_category_2 = "노트북";
			break;
		case "cate0404":
			product_category_2 = "데스크탑";
			break;
		case "cate0405":
			product_category_2 = "카메라";
			break;
		case "cate0406":
			product_category_2 = "캠코더";
			break;	
			
		default:
			product_category_2 = "기타잡화";
			break;
		}
		
		return product_category_2;
	}
}
