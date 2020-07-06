package com.spring.alltion.hongsub;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.mapper.CommentMapper;

@Service
public class CommentServiceImpl {

	@Autowired
	private SqlSession sqlSession;
	
	public List<CommentVO> commentListService(int comment_product_number) {
		CommentMapper commentmapper = sqlSession.getMapper(CommentMapper.class);
		
		
		return commentmapper.commentlist(comment_product_number);
	}

	public int commentInsertService(CommentVO commentvo) {
		CommentMapper commentmapper = sqlSession.getMapper(CommentMapper.class);
		int comment_product_number = commentvo.getComment_product_number();
		int count = commentmapper.countcommentList(comment_product_number);
		
		commentvo.setComment_list_no(count);
		
		return commentmapper.commentinsert(commentvo);
	}

	public int getCount_comment(int product_number) {
		CommentMapper commentmapper = sqlSession.getMapper(CommentMapper.class);
		int count = commentmapper.countcommentList(product_number);
		
		return count;
	}

}
