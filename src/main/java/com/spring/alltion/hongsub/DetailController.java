package com.spring.alltion.hongsub;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.spring.alltion.login.MemberService;
import com.spring.alltion.login.MemberVO;
import com.spring.alltion.productRegistration.ProductVO;

@Controller
public class DetailController {
	
	@Autowired
	private DetailServiceImpl detailService;
	
	@Autowired
	private CommentServiceImpl commentService;
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private BidServiceImpl bidService;
	
	//상세페이지 들어가기전 리스트 보는 화면
	//지워야됨. 필요없음. 테스트용으로 만듬
	@RequestMapping("/boardlist.hs")
	public String boardlist(HttpServletRequest request,Model model)throws Exception {
		detailService.getBoardList(request,model);
		
		return "detail_page/board_list";
	}
	
	//상세페이지로 들어가기위한 작업
	//필요함 지우면안됨. 받아올때 파라미터 product_number값 같이 받아와야됨 
	@RequestMapping("/boarddetail.hs")
	public String boardDetail(@RequestParam(value="product_number")int product_number,Model model) {
		// 상품번호를 통해서 상품 상세 정보를 얻는다.
		ProductVO productvo = detailService.getDetail(product_number);
		model.addAttribute("productvo",productvo);
		
		// 판매자 정보를 얻는다.
		MemberVO membervo = memberService.selectMember(productvo.getProduct_id());
		model.addAttribute("membervo",membervo);
		
		// 응찰 리스트 갯수를 얻는다.
		int bid_listcount = bidService.getBid_listcountService(product_number);
		model.addAttribute("bid_listcount",bid_listcount);
		
		// 최고응찰자의 정보(아이디)를 얻는다.
		String top_bidder_id = bidService.getTop_bidderService(product_number);
		model.addAttribute("top_bidder_id",top_bidder_id);
		
		// 상품 번호와 응찰리스트 페이지 수를 얻어서 응찰 리스트 페이징을 한다.
		int bno = product_number;
		int bid_page = (int)(double)(bid_listcount/10+0.9);
		bidService.bidListService(bno, bid_page, model);
		
		// 댓글 리스트 갯수를 얻는다.
		int comment_listcount = commentService.getCount_comment(product_number)-1;
		model.addAttribute("comment_listcount",comment_listcount);
		
		// 상품 번호와 응찰리스트 페이지 수를 얻어서 응찰 리스트 페이징을 한다.
		int comment_product_number = product_number;
		int comment_page = (int)(double)(comment_listcount/10+0.9);
		commentService.commentListService(comment_product_number, comment_page, model);
		
		return "detail_page/board_detail";
	}
}
