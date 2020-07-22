package com.spring.alltion.mypage;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.alltion.detailpage.BidServiceImpl;
import com.spring.alltion.productRegistration.ProductVO;

@Controller
public class SellingController {
	
	@Autowired
	private SellingServiceImpl sellingService;
	
	
	
	@RequestMapping("/selling.hs")
	public String sellingpage(HttpSession session,Model model,HttpServletRequest request) throws Exception {
		String userId = (String)session.getAttribute("userId");
		List<ProductVO> productvolist = sellingService.getSelling_product_Info(userId,model,request);
				
		model.addAttribute("page",Integer.parseInt(request.getParameter("page")));
		model.addAttribute("productvolist",productvolist);
		
		return "mypage/selling";
	}
	
}
