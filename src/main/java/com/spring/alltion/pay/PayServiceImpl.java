package com.spring.alltion.pay;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.mapper.PayMapper;

@Service("payservice")
public class PayServiceImpl implements PayService {

	@Autowired
	private SqlSession sqlSession;


	@Override
	public void insertPay(PayVO vo) {
		// TODO Auto-generated method stub
		PayMapper payMapper = sqlSession.getMapper(PayMapper.class);
		payMapper.insertPay(vo);
		return;
	}
	
	@Override
	public void deletePay(String buyer_email) {
		// TODO Auto-generated method stub

	}

	@Override
	public PayVO getPayList(String merchant_uid) {
		// TODO Auto-generated method stub
		PayMapper payMapper = sqlSession.getMapper(PayMapper.class);
		PayVO payVO = new PayVO();
		payVO.setMerchant_uid(merchant_uid);
		payVO = payMapper.getPayList(payVO.getMerchant_uid());

		//payVO.setName(payVO.getName());
		payVO.setStatus(payVO.getStatus());
		payVO.setAmount(payVO.getAmount());
		//payVO.setBuyer_email(payVO.getBuyer_email());
		payVO.setBuyer_name(payVO.getBuyer_name());
		//payVO.setBuyer_tel(payVO.getBuyer_tel());
		return payVO;
	}

}
