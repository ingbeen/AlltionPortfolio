package com.spring.alltion.admin;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class AdminRestController {
	
	@Autowired
	private AdminServiceImpl adminServiceImpl;
	
	// 관리자페이지 홈화면 데이터 가져오기
	@RequestMapping(value = "getAdminHomeData.yb", produces="application/json;charset=UTF-8")
	public HashMap<String, Object> getAdminHomeData() {
		HashMap<String, Object> adminHomeData = adminServiceImpl.getAdminHomeData();
		return adminHomeData;
	}
	
	// 관리자페이지 회원관리 화면 데이터 가져오기
	@RequestMapping(value = "getAdminMemberDate.yb", produces="application/json;charset=UTF-8")
	public HashMap<String, Object> getAdminMemberDate(AdminMemberVO adminMemberVO) {
		HashMap<String, Object> adminMemberDate = adminServiceImpl.getAdminMemberDate(adminMemberVO);
		return adminMemberDate;
	}
	
	// 관리자페이지 회원정보 수정하기
	@RequestMapping(value = "adminMemberUpdate.yb", produces="application/json;charset=UTF-8")
	public void adminMemberUpdate(AdminMemberVO adminMemberVO) {
		adminServiceImpl.adminMemberUpdate(adminMemberVO);
	}
}