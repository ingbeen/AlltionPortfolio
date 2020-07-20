package com.spring.alltion.pay;

import java.util.List;

import javax.servlet.http.HttpSession;

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
	public String home(HttpSession session) 
	{
		String userId = (String)session.getAttribute("userId");
        if(userId ==null)
        {
           return "member/login";
        }
        String currentMoney = payService.findCurrentMoney(userId);
        if(currentMoney == null) {
			currentMoney = "0";
		}
        session.setAttribute("currentMoney", currentMoney);
		return "pay/pay";
	}
	
	@RequestMapping(value = "/cancel.bo", method = RequestMethod.POST)
	@ResponseBody
	public String cancel(@RequestParam(value="pay_merchant_uid") String pay_merchant_uid) {  // 결제번호 : merchant_uid
		System.out.println("merchant_uid=" + pay_merchant_uid);
		PaymentCheck obj = new PaymentCheck();
		String token = obj.getImportToken();
		int res = obj.cancelPayment(token, pay_merchant_uid);
		if (res == 1) {
			return "Success";
		}else
			return "Failure";
	}
	
	@RequestMapping(value = "/getSuccessData.bo", method = RequestMethod.POST, produces="application/json;charset=UTF-8")
	@ResponseBody
	public void goOracle(PayVO payVO){
		try {
			PayVO vo = new PayVO();
			vo.setPay_merchant_uid(payVO.getPay_merchant_uid());
			vo.setPay_amount(payVO.getPay_amount());
			vo.setPay_status(payVO.getPay_status());
			vo.setPay_id(payVO.getPay_id());
			
			String id = payService.findPayid(vo.getPay_id());
			
			if(id == null) {
				payService.insertPaylist(vo.getPay_id());;
			}
			payService.insertPay(vo);
			
			String pay_id = vo.getPay_id();
			String currentMoney = payService.findCurrentMoney(pay_id);
			if(currentMoney == null) {
				currentMoney = "0";
			}
			String plusMoney = payVO.getPay_amount();
			Integer chargeMoney = Integer.parseInt(currentMoney) + Integer.parseInt(plusMoney);
			String convertChargeMoney = Integer.toString(chargeMoney);
			payService.chargePay(convertChargeMoney, pay_id);
		}catch(Exception e) {
			System.out.println("데이터삽입 실패");
			e.printStackTrace();
		}
			
	}
	
	@RequestMapping(value = "/cancelData.bo", method = RequestMethod.POST)
	@ResponseBody
	public void cancelOracle(@RequestParam(value="pay_merchant_uid") String pay_merchant_uid) {
		System.out.println("cancelOracle: " + pay_merchant_uid);
		PayVO vo = new PayVO();
		vo = payService.getPayList(pay_merchant_uid);
		vo.setPay_merchant_uid(vo.getPay_merchant_uid());
		//vo.setName(vo.getName());
		vo.setPay_amount(vo.getPay_amount());
		vo.setPay_status("결제취소");
		//vo.setBuyer_email(vo.buyer_email);
		vo.setPay_id(vo.getPay_id());
		//vo.setBuyer_tel(vo.getBuyer_tel());
		payService.insertPay(vo);
		String currentMoney = payService.findCurrentMoney(vo.getPay_id());
		if(currentMoney == null) {
			currentMoney = "0";
		}
		String minusMoney = vo.getPay_amount();
		Integer cancelMoney = Integer.parseInt(currentMoney) - Integer.parseInt(minusMoney);
		String convertCancelMoney = Integer.toString(cancelMoney);
		String pay_id = vo.getPay_id();
		payService.cancelPay(convertCancelMoney, pay_id);
	}
	
	@RequestMapping(value = "/charge.ms", method = RequestMethod.POST)
	public String gocharge() {

		return "pay/payfnc";
	}
	
	@RequestMapping(value = "/drawback.ms", method = RequestMethod.POST)
	public String gocancel() {

		return "pay/cancelfnc";
	}
	
	@RequestMapping(value = "/goPaylist.ms")
	public String goPaylist(HttpSession session, Model model, @RequestParam(value = "page1", required = false, defaultValue = "1") int page1, @RequestParam(value = "page2", required = false, defaultValue = "1") int page2) {
		String userId = (String)session.getAttribute("userId");
		String paid = "paid";
		String cancel = "결제취소";
		
		//List<PayVO> chargevo = payService.findChargelist(userId, paid);
		//List<PayVO> cancelvo = payService.findCancellist(userId, cancel);
		
		//model.addAttribute("chargevo", chargevo);
		//model.addAttribute("cancelvo", cancelvo);
		
		//충전 내역 페이지
		int limit = 10;

		int listcount1 = payService.getPaycount(paid);
		int startrow1 = (page1 - 1) * 10 + 1;
		int endrow1 = startrow1 + limit - 1;
		
		List<PayVO> chargevo = payService.findChargelist(userId, paid, startrow1, endrow1);
		int maxpage1 = (int) ((double) listcount1 / limit + 0.95);
		int startpage1 = (((int) ((double) page1 / 10 + 0.9)) - 1) * 10 + 1;
		int endpage1 = maxpage1;

		if (endpage1 > startpage1 + 10 - 1)
			endpage1 = startpage1 + 10 - 1;
		
		model.addAttribute("page1", page1);
		model.addAttribute("listcount1", listcount1);
		model.addAttribute("chargevo", chargevo);
		model.addAttribute("maxpage1", maxpage1);
		model.addAttribute("startpage1", startpage1);
		model.addAttribute("endpage1", endpage1);
		
		//환불 내역 페이지
		int listcount2 = payService.getPaycount(cancel);
		int startrow2 = (page2 - 1) * 10 + 1;
		int endrow2 = startrow2 + limit - 1;
		
		List<PayVO> cancelvo = payService.findCancellist(userId, cancel, startrow2, endrow2);
		int maxpage2 = (int) ((double) listcount2 / limit + 0.95);
		int startpage2 = (((int) ((double) page2 / 10 + 0.9)) - 1) * 10 + 1;
		int endpage2 = maxpage1;

		if (endpage2 > startpage2 + 10 - 1)
			endpage2 = startpage2 + 10 - 1;
		
		model.addAttribute("page2", page2);
		model.addAttribute("listcount2", listcount2);
		model.addAttribute("cancelvo", cancelvo);
		model.addAttribute("maxpage2", maxpage2);
		model.addAttribute("startpage2", startpage2);
		model.addAttribute("endpage2", endpage2);
		
		
		return "pay/paylist";
	}
}
