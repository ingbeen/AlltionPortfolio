package com.spring.alltion.admin;

import java.util.HashMap;

import com.spring.alltion.productRegistration.ProductVO;

public interface AdminService {
	
	public HashMap<String, Object> getAdminHomeData();
	
	public HashMap<String, Object> getAdminMemberDate(AdminMemberVO searchMemberVO);
	
	public void adminMemberUpdate(AdminMemberVO adminMemberVO);
	
	public HashMap<String, Object> getAdminProductDate(AdminProductVO adminproductVO);
	
	public ProductVO adminProductEnd(ProductVO productVO);
	
	void getTradingListCount(AdminTradingVO adminTradingVO);
}
