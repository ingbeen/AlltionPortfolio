package com.spring.mapper;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import com.spring.alltion.login.MemberVO;
import com.spring.alltion.test.Product_kjVO;
import com.spring.alltion.test.Test_emoneyVO;

public interface TestMapper {
	public ArrayList<Product_kjVO> getProductlist(@Param(value="userId")String userId);
	public ArrayList<Product_kjVO> getdealcomplete_buyer(@Param(value="userId")String userId);
	public ArrayList<Product_kjVO> getdealcomplete_seller(@Param(value="userId")String userId);
	public ArrayList<Product_kjVO> getSalelist(@Param(value="userId")String userId);
	public ArrayList<Product_kjVO> getdeliveryList(@Param(value="userId")String userId);
	public int deliverycomplete(Product_kjVO Product_kjvo,@Param(value="userId")String userId);
	public Test_emoneyVO selectEmoney(@Param(value="userId")String userId);
	public Product_kjVO selectProduct(@Param(value="userId")String userId);
	public int update_deal_address(MemberVO membervo);	
	//public int update_emoney(@Param(value="userId")String userId);
	public int updateWaybill(Product_kjVO Product_kjvo);
	public int after_deposit(Product_kjVO Product_kjvo);	
	
	
	
}
