package com.spring.alltion.admin;

import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.mapper.AdminMapper;

@Service
public class AdminServiceImpl implements AdminService {

	@Autowired
	private SqlSession sqlSession;

	@Override
	public HashMap<String, Object> getAdminHomeData() {
		AdminMapper adminMapper = sqlSession.getMapper(AdminMapper.class);
		int memberCount =  adminMapper.getMemberCount();
		System.out.println("memberCount = " + memberCount);
		
		int productCount =  adminMapper.getProductCount();
		System.out.println("productCount = " + productCount);
		
		int tradingCount =  adminMapper.getTradingCount();
		System.out.println("tradingCount = " + tradingCount);
		
		int bidCount =  adminMapper.getBidCount();
		System.out.println("bidCount = " + bidCount);
		
		int paySum =  adminMapper.getPaySum();
		System.out.println("paySum = " + paySum);
		
		ArrayList<Integer> dailyAuctioCountList = new ArrayList<Integer>();
		for (int i = 7; i >= 1; i--) {
			int dailyAuctioCount =  adminMapper.getDailyAuctioCount(i);
			dailyAuctioCountList.add(dailyAuctioCount);
			System.out.println("dailyAuctioCount = " + dailyAuctioCount);
		}
		
		HashMap<String, Object> adminHomeData = new HashMap<String, Object>();
		adminHomeData.put("memberCount", memberCount);
		adminHomeData.put("productCount", productCount);
		adminHomeData.put("tradingCount", tradingCount);
		adminHomeData.put("bidCount", bidCount);
		adminHomeData.put("paySum", paySum);
		adminHomeData.put("dailyAuctioCountList", dailyAuctioCountList);
		
		return adminHomeData;
	}
}
