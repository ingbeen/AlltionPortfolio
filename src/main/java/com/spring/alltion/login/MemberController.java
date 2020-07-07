package com.spring.alltion.login;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.scribejava.core.model.OAuth2AccessToken;



@Controller
public class MemberController {

	/* NaverLoginBO */
	private NaverLoginBO naverLoginBO;
	private String apiResult = null;
	
	@Autowired
	private void setNaverLoginBO(NaverLoginBO naverLoginBO)
	{
		this.naverLoginBO = naverLoginBO;
	}
	
	@Autowired
	private MemberService memberService;

	@RequestMapping("/")
	public String main()
	{
		return "index";
	}
	
	@RequestMapping("/main.kj")
	public String mainPage()
	{
		return "index";
	}

		@RequestMapping(value = "/loginForm.kj")
		public String loginPage()
		{
			return "member/login";
		}
		
		@RequestMapping("/login.kj")
		public String userCheck(MemberVO membervo, HttpSession session,
				HttpServletResponse response) throws Exception
		{
			
			int res = memberService.userCheck(membervo);
			
			response.setCharacterEncoding("utf-8");
			response.setContentType("text/html; charset=utf-8");
			PrintWriter writer = response.getWriter();
			if (res == 1)
			{
				session.setAttribute("userId",membervo.getMember_id());
				
				return "redirect:/";
			}
			else 	
			{
					
				writer.write("<script>alert('해당 아이디와 비밀번호를 확인해 주세요!!');location.href='./loginForm.kj';</script>");
				
			}
			return null;
		}
		//로그아웃
		@RequestMapping(value = "/logout.kj", method = { RequestMethod.GET, RequestMethod.POST })
		public String logout(HttpSession session) throws IOException {
		session.invalidate();
		return "redirect:/";
		}
		
		//로그인 첫 화면 요청 메소드
		@RequestMapping(value = "/naverjoin.kj", method = { RequestMethod.GET, RequestMethod.POST })
		public String login(Model model, HttpSession session) {
			/* 네이버아이디로 인증 URL을 생성하기 위하여 naverLoginBO클래스의 getAuthorizationUrl메소드 호출 */
			String naverAuthUrl = naverLoginBO.getAuthorizationUrl(session);
			//https://nid.naver.com/oauth2.0/authorize?response_type=code&client_id=sE***************&
			//redirect_uri=http%3A%2F%2F211.63.89.90%3A8090%2Flogin_project%2Fcallback&state=e68c269c-5ba9-4c31-85da-54c16c658125
			System.out.println("네이버 : " + naverAuthUrl);
			//네이버
			model.addAttribute("url", naverAuthUrl);
			
			return "member/join";
		}
		//네이버 로그인 성공시 callback호출 메소드
		@RequestMapping(value = "/callback.kj", method = { RequestMethod.GET, RequestMethod.POST })
		public String callback(Model model, @RequestParam String code, @RequestParam String state, HttpSession session)
			throws IOException, ParseException {
			System.out.println("여기는 callback");
			OAuth2AccessToken oauthToken;
			oauthToken = naverLoginBO.getAccessToken(session, code, state);
			//1. 로그인 사용자 정보를 읽어온다.
			apiResult = naverLoginBO.getUserProfile(oauthToken); // String형식의 json데이터
			/**
			 * apiResult json 구조 {"resultcode":"00", "message":"success",
			 * "response":{"id":"33666449","nickname":"shinn****","age":"20-29","gender":"M","email":"sh@naver.com","name":"\uc2e0\ubc94\ud638"}}
			 **/
			//2. String형식인 apiResult를 json형태로 바꿈
			JSONParser parser = new JSONParser();
			Object obj = parser.parse(apiResult);
			JSONObject jsonObj = (JSONObject) obj;
			//3. 데이터 파싱
			//Top레벨 단계 _response 파싱
			JSONObject response_obj = (JSONObject) jsonObj.get("response");
			//response의 nickname값 파싱
			String email = (String) response_obj.get("email");
			System.out.println(email);
			//4.파싱 닉네임 세션으로 저장
			session.setAttribute("email", email); // 세션 생성
			model.addAttribute("result", apiResult);
			
			return "member/joinForm";
		}
		
		@RequestMapping(value = "/joinForm.kj")
		public String joinFormPage()
		{
			return "member/joinForm";
		}
		@RequestMapping("/joinprocess.kj") 
		public String insertMember(MemberVO membervo, HttpServletResponse response) 
			throws Exception { 
			//파라미터에는 form 양식의 name에 따라 값이 저장된다.\
			int res = memberService.insertMember(membervo);
			
			
			response.setCharacterEncoding("utf-8");
			response.setContentType("text/html; charset=utf-8");
			PrintWriter writer = response.getWriter();
			if (res != 0)
			{
				writer.write("<script>alert('회원가입 성공!!');"
						+ "location.href='./loginForm.kj';</script>");
			}
			else
			{
				writer.write("<script>alert('회원가입 실패!!');"
						+ "location.href='./joinForm.kj';</script>");
			}
			return null;
		}
		@RequestMapping(value="/user_check.kj", produces= "application/json; charset=utf-8")
		private @ResponseBody int idCheck(String member_id)throws Exception
		{
			int res = memberService.idCheckService(member_id);
			return res;
		}
		@RequestMapping(value = "/mypage.kj")
		public String myPage(MemberVO membervo, HttpSession session)throws Exception
		{
			String userId = (String)session.getAttribute("userId");
			if(userId == null)
			{
			return "member/login";
			}else
			
			return "member/mypage";
		}
		@RequestMapping(value = "/memberinfo.kj")
		public String updateForm(Model model,HttpSession session)throws Exception
		{	
			String userId = (String)session.getAttribute("userId");
			if(userId ==null)
			{
				return "member/login";
			}else 
			{
			MemberVO vo = memberService.selectMember(userId);
			model.addAttribute("membervo",vo);
			
			return "member/update";
			}
		}
		//회원 수정 이메일
		@RequestMapping(value = "/updateEmail.kj")
		public String updateEmail(MemberVO membervo, HttpServletResponse response,HttpSession session)
		throws Exception 
		{
			String userId = (String)session.getAttribute("userId");
			membervo.setMember_id(userId);
			int res = memberService.updateEmail(membervo);
			
			response.setCharacterEncoding("utf-8");
			response.setContentType("text/html; charset=utf-8");
			PrintWriter writer = response.getWriter();
			if (res != 0)
			{
				writer.write("<script>alert('이메일 변경완료!!');"
						+ "location.href='./memberinfo.kj';</script>");
			}
			else
			{
				writer.write("<script>alert('이메일 변경실패!!');"
						+ "location.href='./memberinfo.kj';</script>");
			}
			return null;
			
		}
		//회원 수정 비밀번호		
		@RequestMapping(value = "/updatePassword.kj", method = { RequestMethod.GET, RequestMethod.POST })
		public String updatePassword(MemberVO membervo, HttpServletResponse response,HttpSession session)
		throws Exception 
		{
			String userId = (String)session.getAttribute("userId");
			membervo.setMember_id(userId);
			int res = memberService.updatePassword(membervo);
			
			response.setCharacterEncoding("utf-8");
			response.setContentType("text/html; charset=utf-8");
			PrintWriter writer = response.getWriter();
			if (res != 0)
			{
				
				writer.write("<script>alert('비밀번호 변경 완료!!');"
				+ "location.href='./loginForm.kj';</script>");
				//비밀번호 변경시 로그아웃
				session.invalidate();
			}
			else
			{
				writer.write("<script>alert('비밀번호 변경 실패!!');"
						+ "location.href='./memberinfo.kj';</script>");
			}
			return null;
			
		}
		
		@RequestMapping(value = "/updatePhone.kj")
		public String updatePhone(MemberVO membervo, HttpServletResponse response,HttpSession session)
		throws Exception 
		{
			String userId = (String)session.getAttribute("userId");
			membervo.setMember_id(userId);
			int res = memberService.updatePhone(membervo);
			
			response.setCharacterEncoding("utf-8");
			response.setContentType("text/html; charset=utf-8");
			PrintWriter writer = response.getWriter();
			if (res != 0)
			{
				writer.write("<script>alert('휴대전화 변경완료!!');"
						+ "location.href='./memberinfo.kj';</script>");
			}
			else
			{
				writer.write("<script>alert('휴대전화 변경실패!!');"
						+ "location.href='./memberinfo.kj';</script>");
			}
			return null;
			
		}
		
		@RequestMapping(value = "/updateAddress.kj")
		public String updateAddress(MemberVO membervo, HttpServletResponse response,HttpSession session)
		throws Exception 
		{
			String userId = (String)session.getAttribute("userId");
			membervo.setMember_id(userId);
			int res = memberService.updateAddress(membervo);
			
			response.setCharacterEncoding("utf-8");
			response.setContentType("text/html; charset=utf-8");
			PrintWriter writer = response.getWriter();
			if (res != 0)
			{
				writer.write("<script>alert('주소 변경완료!!');"
						+ "location.href='./memberinfo.kj';</script>");
			}
			else
			{
				writer.write("<script>alert('주소 변경실패!!');"
						+ "location.href='./memberinfo.kj';</script>");
			}
			return null;
			
		}
		
		@RequestMapping(value = "/delete.kj",  method = { RequestMethod.GET, RequestMethod.POST })
		public String member_delete(MemberVO membervo, HttpServletResponse response,HttpSession session)
		throws Exception 
		{
			String userId = (String)session.getAttribute("userId");
			membervo.setMember_id(userId);
			int res = memberService.member_delete(membervo);
			
			response.setCharacterEncoding("utf-8");
			response.setContentType("text/html; charset=utf-8");
			PrintWriter writer = response.getWriter();
			if (res != 0)
			{
				writer.write("<script>alert('회원이 삭제 되었습니다!!');"
				+ "location.href='./main.kj';</script>");
				session.invalidate();
			}
			else
			{
				writer.write("<script>alert('회원 삭제가 실패햐였습니다!!');"
						+ "location.href='./memberinfo.kj';</script>");
			}
			return null;
			
		}
		
		@RequestMapping(value = "/buyer.kj")
		public String history(Model model,HttpSession session)throws Exception
		{	
			String userId = (String)session.getAttribute("userId");
			if(userId ==null)
			{
				return "member/login";
			}else {
			MemberVO vo = memberService.selectMember(userId);
			model.addAttribute("membervo",vo);
			
			return "member/buyer";
		}
		}
}
