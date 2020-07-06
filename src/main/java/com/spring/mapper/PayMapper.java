package com.spring.mapper;

import com.spring.alltion.pay.PayVO;

public interface PayMapper {
	int insertPay(PayVO vo);
	void deletePay(String imp_uid);
	PayVO getPayList(String merchant_uid);
}
