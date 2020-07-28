package com.spring.alltion.admin;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class AdminRestController {
	
	@Autowired
	private AdminServiceImpl adminServiceImpl;
	
	// 상품(경매) 등록
	@RequestMapping(value = "getAdminHomeData.yb", produces="application/json;charset=UTF-8")
	public HashMap<String, Object> getAdminHomeData() {
		HashMap<String, Object> adminHomeData = adminServiceImpl.getAdminHomeData();
		return adminHomeData;
	}
	
//	// 에디터 이미지 업로드
//	@RequestMapping(value = "editorImgUpload.yb", produces="application/json;charset=UTF-8")
//	public void editorImgUpload(MultipartFile file, HttpServletResponse response, 
//			HttpSession session) {
//		productServiceImpl.editorImgUpload(file, response, session);
//	}
//	
//	// 썸네일 이미지 업로드
//	@RequestMapping(value = "thumbnailsUpload.yb", produces="application/json;charset=UTF-8")
//	public List<String> thumbnailsUpload(MultipartHttpServletRequest mtfRequest, 
//			HttpSession session) {
//		List<String> imgSrcList = new ArrayList<String>(); // 이미지 경로를 담을 배열
//		
//		imgSrcList = productServiceImpl.thumbnailsUpload(mtfRequest, session);
//		
//		return imgSrcList;
//	}
}