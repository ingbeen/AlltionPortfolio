package com.spring.mapper;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import com.spring.alltion.test.Product_kjVO;
import com.spring.alltion.test.Test_emoneyVO;

public interface TestMapper {
	public ArrayList<Product_kjVO> getProductlist(@Param(value="userId")String userId);
	public Test_emoneyVO selectEmoney(@Param(value="userId")String userId);
	public Product_kjVO selectProduct(@Param(value="userId")String userId);
}
