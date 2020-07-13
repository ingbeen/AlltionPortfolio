package com.spring.alltion.productList;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

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
	
	@RequestMapping(value = "/gocategory.ms", method = RequestMethod.GET, produces="application/json;charset=UTF-8")
	public String getList(@RequestParam(value = "product_category_2") String product_category_2, @RequestParam(value = "product_category_1") String product_category_1, Model model) throws Exception{
		
		List<ProductVO> productlist = null;
		productlist = productlistService.list(product_category_2, product_category_1);
		model.addAttribute("productlist", productlist);
		
		return "productList/productList";
	}
	@RequestMapping(value = "/categoryCheck.ms", method = RequestMethod.GET)
	public String goCategory(HttpServletRequest request, ProductVO vo) {
		vo.setProduct_category_1(request.getParameter(""));
		return "redirect:/productList.ms";
	}
}
