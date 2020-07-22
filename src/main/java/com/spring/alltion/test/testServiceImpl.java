package com.spring.alltion.test;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.alltion.login.MemberVO;
import com.spring.mapper.TestMapper;

@Service("testService")
public class testServiceImpl implements testService{

	@Autowired
	private SqlSession sqlSession;

	@Override
	public ArrayList<Product_kjVO> getProductlist(String userId) {
		TestMapper testMapper = sqlSession.getMapper(TestMapper.class);
		ArrayList<Product_kjVO>list = testMapper.getProductlist(userId);
		return list;
	}
	
	@Override
	public ArrayList<Product_kjVO> getSalelist(String userId) {
		TestMapper testMapper = sqlSession.getMapper(TestMapper.class);
		ArrayList<Product_kjVO>list = testMapper.getSalelist(userId);
		return list;
	}
	
	

	@Override
	public Test_emoneyVO selectEmoney(String userId) {
		TestMapper testMapper = sqlSession.getMapper(TestMapper.class);
		Test_emoneyVO emoneyvo = testMapper.selectEmoney(userId);
		return emoneyvo;
	}

	@Override
	public Product_kjVO selectProduct(String userId) {
		TestMapper testMapper = sqlSession.getMapper(TestMapper.class);
		Product_kjVO Product_kjvo = testMapper.selectProduct(userId);
		return Product_kjvo;
	}


	@Override
	public int update_deal_address(MemberVO membervo) {
		TestMapper testMapper = sqlSession.getMapper(TestMapper.class);
		return testMapper.update_deal_address(membervo);
	}

	@Override
	public int update_emoney(String userId, int trading_price) {
		TestMapper testMapper = sqlSession.getMapper(TestMapper.class);		
		return testMapper.update_emoney(userId, trading_price);
	}
	
	@Override
	public int updateWaybill(Product_kjVO Product_kjvo) {
		TestMapper testMapper = sqlSession.getMapper(TestMapper.class);
		return testMapper.updateWaybill(Product_kjvo);
	}

	@Override
	public int after_deposit(Product_kjVO Product_kjvo) {
		TestMapper testMapper = sqlSession.getMapper(TestMapper.class);
		return testMapper.after_deposit(Product_kjvo);
	}

	

	
	
}
