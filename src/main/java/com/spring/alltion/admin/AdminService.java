package com.spring.alltion.admin;

import java.util.HashMap;

public interface AdminService {
	
	public HashMap<String, Object> getAdminHomeData();
	
	public HashMap<String, Object> getAdminMemberDate(AdminMemberVO searchMemberVO);
	
	public void adminMemberUpdate(AdminMemberVO adminMemberVO);
}
