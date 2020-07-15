package com.spring.alltion.mypage;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.alltion.creditScore.CreditScoreService;
import com.spring.alltion.creditScore.PurchaseCreditScoreVO;
import com.spring.alltion.creditScore.SaleCreditScoreVO;



@Controller
public class CreditScoreController {
	
	@Autowired
	private CreditScoreService creditScoreService;
	
	@RequestMapping(value = "creditScore.hn")
	public String checkCreditScore(Model model, HttpSession session) throws Exception {
		
		String userId = (String)session.getAttribute("userId");
		
        if(userId == null) {
        	return "member/login";
        } else {
        	SaleCreditScoreVO salevo = creditScoreService.getSaleCreditScore(userId);
        	System.out.println(salevo.getSale_id());
        	model.addAttribute("saleCreditVO", salevo);
        	
        	PurchaseCreditScoreVO purchasevo = creditScoreService.getPurchaseCreditScore(userId);
        	System.out.println(purchasevo.getPurchase_id());
        	model.addAttribute("purchaseCreditVO", purchasevo);
        
        	return "mypage/creditScore";
        }
	}
}
