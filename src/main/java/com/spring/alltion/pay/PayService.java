package com.spring.alltion.pay;

import java.util.List;

public interface PayService {
	void insertPay(PayVO vo);
	void deletePay(String buyer_email);
	PayVO getPayList(String merchant_uid);
}
