package com.spring.mapper;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import com.spring.alltion.test.Product_kjVO;

public interface TestMapper {
	public ArrayList<Product_kjVO> getProductlist(@Param(value="userId")String userId);
}
