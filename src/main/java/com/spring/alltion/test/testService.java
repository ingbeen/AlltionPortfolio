package com.spring.alltion.test;

import java.util.ArrayList;

public interface testService {
	
		public ArrayList<Product_kjVO> getProductlist(String userId);
		public Test_emoneyVO selectEmoney(String userId);
		public Product_kjVO selectProduct(String userId);
}
