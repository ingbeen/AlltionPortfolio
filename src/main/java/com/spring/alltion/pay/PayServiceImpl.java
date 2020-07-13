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
	public PayVO charge(PayVO payVO) {
		// TODO Auto-generated method stub
		payVO.setAmount(payVO.getAmount());
		payVO.setBuyer_name(payVO.getBuyer_name());
		System.out.println(payVO.getAmount());
		System.out.println(payVO.getBuyer_name());
		return payVO;
	}

	@Override
	public PayVO getPayList(String merchant_uid) {
		PayMapper payMapper = sqlSession.getMapper(PayMapper.class);
		PayVO payVO = new PayVO();
		System.out.println("getlist1: " + merchant_uid);
		payVO.setMerchant_uid(merchant_uid);
		System.out.println("getlist2(payVOuid): " + payVO.getMerchant_uid());
		payVO = payMapper.getPayList(payVO.getMerchant_uid());
		System.out.println("status:" + payVO.getStatus());
		//payVO.setName(payVO.getName());
		payVO.setStatus(payVO.getStatus());
		payVO.setAmount(payVO.getAmount());
		//payVO.setBuyer_email(payVO.getBuyer_email());
		payVO.setBuyer_name(payVO.getBuyer_name());
		//payVO.setBuyer_tel(payVO.getBuyer_tel());
		return payVO;
	}

}
