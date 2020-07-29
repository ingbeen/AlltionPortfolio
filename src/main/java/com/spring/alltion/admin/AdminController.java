package com.spring.alltion.admin;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.alltion.login.MemberVO;

@Controller
public class AdminController {
	
	// 관리자페이지 홈으로 이동
	@RequestMapping(value = "adminHome.yb")
	public String adminHome(HttpSession session, MemberVO membervo) {
//		String userId = (String)session.getAttribute("userId");
//        if(userId ==null)
//        {
//           return "member/login";
//        }
        
		return "admin/admin_home";
	}
	
	// 관리자페이지 회원관리로 이동
	@RequestMapping(value = "adminMember.yb")
	public String adminMember(HttpSession session, MemberVO membervo) {
//		String userId = (String)session.getAttribute("userId");
//        if(userId ==null)
//        {
//           return "member/login";
//        }
        
		return "admin/admin_member";
	}
	
	// 관리자페이지 회원관리로 이동
	@RequestMapping(value = "adminProduct.yb")
	public String adminProduct(HttpSession session, MemberVO membervo) {
//		String userId = (String)session.getAttribute("userId");
//        if(userId ==null)
//        {
//           return "member/login";
//        }
        
		return "admin/admin_product";
	}
}
