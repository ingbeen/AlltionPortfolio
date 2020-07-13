package com.spring.alltion.productRegistration;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.alltion.login.MemberVO;
import com.spring.alltion.trading.TradingServiceImpl;

@Controller
public class ProductController {
	
	@Autowired
	private ProductServiceImpl productService;
	
	@Autowired
	private TradingServiceImpl tradingService;
	
	@RequestMapping(value = "/registration.yb")
	public String home(HttpSession session, MemberVO membervo) {
		String userId = (String)session.getAttribute("userId");
        if(userId ==null)
        {
           return "member/login";
        }
        
		return "productRegistration/productRegistration";
	}

	/* test */
	@RequestMapping(value = "productSelectTest.yb")
	public String productSelectTest(int product_number, Model model) {
		
		/* 마감된 상품 test */
//		tradingService.seachEndOfProduct();
		tradingService.endOfAuction(product_number);
		
		ProductVO productVO = productService.productSelectTest(product_number);
		
		model.addAttribute("productVO", productVO);
		
		return "productRegistration/productListTest";
	}
	
}
