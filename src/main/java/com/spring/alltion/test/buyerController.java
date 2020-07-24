package com.spring.alltion.test;

import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.alltion.creditScore.CreditScoreService;
import com.spring.alltion.creditScore.PurchaseCreditScoreVO;
import com.spring.alltion.creditScore.SaleCreditScoreVO;
import com.spring.alltion.login.MemberService;
import com.spring.alltion.login.MemberVO;
import com.spring.alltion.pay.PayController;
import com.spring.alltion.pay.PayService;
import com.spring.alltion.pay.PaymentVO;
@Controller
public class buyerController {

	@Autowired
	private MemberService memberService;
	@Autowired
	private testService testservice;
	@Autowired
	private CreditScoreService creditScoreService;
	@Autowired
	private PayService payService;
	
	@RequestMapping(value = "/buyer.kj")
	public String getProductlist(Model model, HttpSession session)
	throws Exception
	{
		String userId = (String)session.getAttribute("userId");
		if(userId == null)
		{
			return "member/login";
		}
		else
		{
		ArrayList<Product_kjVO> product_list = testservice.getProductlist(userId);
		model.addAttribute("product_list", product_list);
		ArrayList<Product_kjVO> delivery_list = testservice.getdeliveryList(userId);
		model.addAttribute("delivery_list", delivery_list);
		ArrayList<Product_kjVO> dealcomplete_list = testservice.getdealcomplete_buyer(userId);
		model.addAttribute("dealcomplete_list", dealcomplete_list);
		return  "mypage/buyer";
		}
	}
	
	@RequestMapping(value = "/seller.kj")
	public String getSeller(Model model, HttpSession session)
	throws Exception
	{
		String userId = (String)session.getAttribute("userId");
		if(userId == null)
		{
			return "member/login";
		}
		else
		{
		ArrayList<Product_kjVO> getSale_list = testservice.getSalelist(userId);
		model.addAttribute("getSale_list", getSale_list);
		ArrayList<Product_kjVO> dealcompleteseller_list = testservice.getdealcomplete_seller(userId);
		model.addAttribute("dealcompleteseller_list", dealcompleteseller_list);
		return  "mypage/seller";
		}
	}
	
	@RequestMapping(value = "/waybill.kj")
	public String waybillpage(Model model, HttpSession session)
			throws Exception
			{
				String userId = (String)session.getAttribute("userId");
				if(userId == null)
				{
					return "member/login";
				}
				else
				{
				ArrayList<Product_kjVO> getSale_list = testservice.getSalelist(userId);
				model.addAttribute("getSale_list", getSale_list);
				return "mypage/waybill";
				}
		
	}
	
	
	@RequestMapping(value = "/insert_waybill.kj")
	public String insertwaybill(Product_kjVO Product_kjvo , HttpServletResponse response,  HttpSession session) 
			throws Exception
	{
		String userId = (String)session.getAttribute("userId");
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		PrintWriter writer = response.getWriter();
		int res = testservice.updateWaybill(Product_kjvo);
		if(userId == null)
		{
			return "member/login";
		}
		else
		{
		if(res != 0)
		{
			
			writer.write("<script>alert('운송장 번호 입력 완료되었습니다');"
			+ "location.href='/alltion/seller.kj';</script>");
		}
		 else 
		{
			writer.write("<script>alert('운송장 번호 입력이 실패하였습니다!!');location.href='./waybill.kj';</script>");
		}
		return null;
		}
	}
	
	@RequestMapping(value = "/delivery.kj")
	public String deliverycomplete(Product_kjVO Product_kjvo , HttpServletResponse response,  HttpSession session)
	throws Exception
	{
		String userId = (String)session.getAttribute("userId");
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		PrintWriter writer = response.getWriter();
		int res = testservice.deliverycomplete(Product_kjvo,userId); // 거래중 -> 거래완료
		if(userId == null)
		{
			return "member/login";
		}
		else
		{
		if(res != 0)
		{
			ArrayList<Product_kjVO> delivery_list = testservice.getdealcomplete_buyer(userId);
//			System.out.println("id : " + delivery_list.get(0).getProduct_id());
//			System.out.println("amount : " + delivery_list.get(0).getTrading_price());
			String id = delivery_list.get(0).getProduct_id();
			int amount = delivery_list.get(0).getTrading_price();
			//System.out.println("vo id : " + Product_kjvo.getProduct_id());
			//String result = plusMoney(Product_kjvo.getProduct_id(), Product_kjvo.getTrading_price(),"상품제목제목");
			String result = plusMoney(id, amount,"상품제목제목");
			session.setAttribute("currentMoney", result);
			writer.write("<script>alert('구매가 완료되었습니다');"
			+ "location.href='/alltion/buyer.kj';</script>");
		}
		 else 
		{
			writer.write("<script>alert('구매가  실패하였습니다!!');location.href='./waybill.kj';</script>");
		}
		return null;
		}
	}
	
	@RequestMapping(value = "/buyer_emoney.kj")
	public String emoney(Model model,HttpSession session)
	throws Exception
	{
		String userId = (String)session.getAttribute("userId");
		if(userId == null)
		{
			return "member/login";
		}
		else
		{
			Test_emoneyVO emoneyvo = testservice.selectEmoney(userId);
			model.addAttribute("emoneyvo", emoneyvo);			
			Product_kjVO  Product_kjvo = testservice.selectProduct(userId);
			model.addAttribute("Product_kjvo", Product_kjvo);
			MemberVO membervo = memberService.selectMember(userId);
			model.addAttribute("membervo", membervo);
			String pmvo = payService.findCurrentMoney(userId);
			 if (pmvo == null) {
				 pmvo = "0";
		      }
			model.addAttribute("pmvo", pmvo);
		    return "mypage/buyer_emoney";
		}
	}	
	
	@RequestMapping(value = "/buyer_deal.kj")
	public String deal(Product_kjVO  Product_kjvo, Model model, HttpSession session, HttpServletResponse response)throws Exception
	{
		
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		PrintWriter writer = response.getWriter();
		
		String userId = (String)session.getAttribute("userId");
		
		int res = testservice.after_deposit(Product_kjvo);
		int currentMoney = Integer.parseInt(payService.findCurrentMoney(userId));
		//int res_emoney = testservice.update_emoney(userId);
		if(userId == null)
		{
			return "member/login";
		}
		else 
		{
			if(currentMoney >= Product_kjvo.getTrading_price())
			{
				//if(res_emoney != 0)
				//{
					
					if(res != 0)
					{
						String result = minusMoney(userId, Product_kjvo.getTrading_price(), "상품제목제목");
						session.setAttribute("currentMoney", result);
						writer.write("<script>alert('결제가 완료되었습니다');"
						+ "location.href='/alltion/buyer.kj';</script>");
					}
				//}
			else
			{
				writer.write("<script>alert('이머니가 부족합니다 충전해주세요!!');location.href='./buyer_emoney.kj';</script>");
				
			}
			
			}
			return null;
		}
	}
		@RequestMapping(value = "/buyer_deal_update") 
		public String address_update(MemberVO membervo, HttpSession session ,HttpServletResponse response)throws Exception
		{
			
			String userId = (String)session.getAttribute("userId");
			membervo.setMember_id(userId);
			int  res = testservice.update_deal_address(membervo);
			if(userId == null)
			{
			return "member/login";
			}
			else
			{			
			response.setCharacterEncoding("utf-8");
			response.setContentType("text/html; charset=utf-8");
			PrintWriter writer = response.getWriter();
			if(res != 0)
			{
				writer.write("<script>alert('주소가 변경되었습니다');"
						+ "location.href='./buyer_emoney.kj';</script>");
			}
			else
			{
				writer.write("<script>alert('주소 변경실패!!');"
						+ "location.href='./buyer_emoney.kj';</script>");
			}
			return null;
		}
		
	}
		
		// 출금할 경우 쓰는 메소드(userId에 amount만큼 출금)
		public String minusMoney(String userId, int amount, String product_subject) {
			// userId가 존재하는지 체크
			if (userId == null) {
				return "member/login";
			}
			// userId의 결제내역이 존재하는지 체크
			String id = payService.findPayid(userId);
			// 없으면 결제내역 테이블 만들어주기
			if (id == null) {
				payService.insertPaylist(userId);
			}
			// currentMoney = 해당 아이디가 가진 보유 사이버머니
			String currentMoney = payService.findCurrentMoney(userId);
			if (currentMoney == null) {
				currentMoney = "0";
			}
			// result = 결제 후 금액, amount = 결제할 금액
			String result = Integer.toString(Integer.parseInt(currentMoney) - amount);
			if (Integer.parseInt(result) < 0) {
				// 결제 실패 -> 충전페이지로 연결
				return "pay/pay";
			} else {
				// userId가 보유한 사이버머니를 result값으로 바꿈
				payService.changeMoney(userId, result);
				// 거래내역 추가
				PaymentVO vo = new PaymentVO();
				vo.setPayment_userId(userId);
				vo.setPayment_product_subject(product_subject);
				vo.setPayment_amount(Integer.toString(amount));
				vo.setPayment_lastmoney(currentMoney);
				vo.setPayment_nowmoney(result);
				vo.setPayment_status("상품결제");
				payService.insertPayment(vo);
			}
			return result;
	
		}
		
		// 입금될 경우 쓰는 메소드(userId에 amount만큼 입금, product_subject: 상품 이름)
		public String plusMoney(String userId, int amount, String product_subject) {
			// userId가 존재하는지 체크
			if (userId == null) {
				return "member/login";
			}
			// userId의 결제내역이 존재하는지 체크
			String id = payService.findPayid(userId);
			// 없으면 결제내역 테이블 만들어주기
			if (id == null) {
				payService.insertPaylist(userId);
			}
			// currentMoney = 해당 아이디가 가진 보유 사이버머니
			String currentMoney = payService.findCurrentMoney(userId);
			if (currentMoney == null) {
				currentMoney = "0";
			}
			// result = 결제 후 금액, amount = 결제할 금액
			String result = Integer.toString(Integer.parseInt(currentMoney) + amount);
			if (Integer.parseInt(result) < 0) {
				System.out.println("결제 실패");
			} else {
				// userId가 보유한 사이버머니를 result값으로 바꿈
				payService.changeMoney(userId, result);
				// 거래내역 추가
				PaymentVO vo = new PaymentVO();
				vo.setPayment_userId(userId);
				vo.setPayment_product_subject(product_subject);
				vo.setPayment_amount(Integer.toString(amount));
				vo.setPayment_lastmoney(currentMoney);
				vo.setPayment_nowmoney(result);
				vo.setPayment_status("판매입금");
				payService.insertPayment(vo);
			}
			return result;
		}
}
