package com.spring.alltion.productRegistration;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ProductController {
	
	@RequestMapping(value = "/")
	public String home(HttpSession session) {
		session.setAttribute("userId", "ingbeen");
		return "productRegistration/productRegistration";
	}
	
}
