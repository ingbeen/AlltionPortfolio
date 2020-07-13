package com.spring.alltion.pay;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

//import com.spring.mybatismember.MemberService;
//import com.spring.mybatismember.MemberVO;


@Controller
public class PayController {
	
	@Autowired
	private PayService payService;
	//private MemberService memberService;
	
	@RequestMapping(value = "/pay.ms")
	public String home() 
	{
		return "pay/pay";
	}
	
	@RequestMapping(value = "/cancel.bo", method = RequestMethod.POST)
	@ResponseBody
	public String cancel(@RequestParam(value="merchant_uid") String merchant_uid) {  // 결제번호 : merchant_uid
		System.out.println("merchant_uid=" + merchant_uid);
		PaymentCheck obj = new PaymentCheck();
		String token = obj.getImportToken();
		int res = obj.cancelPayment(token, merchant_uid);
		if (res == 1) {
			return "Success";
		}else
			return "Failure";
	}
	
	@RequestMapping(value = "/getSuccessData.bo", method = RequestMethod.POST, produces="application/json;charset=UTF-8")
	@ResponseBody
	public void goOracle(PayVO payVO){
		try {
			System.out.println("goOracle");
			payService.insertPay(payVO);
			System.out.println("데이터삽입 완료");
		}catch(Exception e) {
			System.out.println("실패");
		}
			
	}
	
	@RequestMapping(value = "/cancelData.bo", method = RequestMethod.POST)
	@ResponseBody
	public void cancelOracle(@RequestParam(value="merchant_uid") String merchant_uid) {
		System.out.println("cancelOracle: " + merchant_uid);
		PayVO vo = new PayVO();
		vo = payService.getPayList(merchant_uid);
		vo.setMerchant_uid(vo.getMerchant_uid());
		//vo.setName(vo.getName());
		vo.setAmount(vo.getAmount());
		vo.setStatus("결제취소");
		//vo.setBuyer_email(vo.buyer_email);
		vo.setBuyer_name(vo.getBuyer_name());
		//vo.setBuyer_tel(vo.getBuyer_tel());
		payService.insertPay(vo);
	}
	
	@RequestMapping(value = "/charge.ms", method = RequestMethod.POST)
	public String gocharge() {

		return "pay/payfnc";
	}
	
	@RequestMapping(value = "/drawback.ms", method = RequestMethod.POST)
	public String gocancel() {

		return "pay/cancelfnc";
	}
}
