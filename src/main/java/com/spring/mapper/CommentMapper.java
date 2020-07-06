package com.spring.mapper;

import java.util.List;

import com.spring.alltion.hongsub.CommentVO;

public interface CommentMapper {

	List<CommentVO> commentlist(int comment_product_number);

	int commentinsert(CommentVO commentvo);

	int countcommentList(int comment_product_number);

}
