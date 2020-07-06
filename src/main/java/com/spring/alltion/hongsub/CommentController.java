package com.spring.alltion.hongsub;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class CommentController {
	
	@Autowired
	private CommentServiceImpl commentService;
	
	@RequestMapping(value="commentlist.hs",produces="application/json;charset=UTF-8")
	public List<CommentVO> commentlist(@RequestParam int comment_product_number)throws Exception{
		List<CommentVO> comment_list = commentService.commentListService(comment_product_number);
		
		return comment_list;
	}
	
	@RequestMapping(value="commentinsert.hs",produces="application/json;charset=UTF-8")
	public int commentinsert(CommentVO commentvo)throws Exception{
		int res = commentService.commentInsertService(commentvo);
		
		return res;
	}
}
