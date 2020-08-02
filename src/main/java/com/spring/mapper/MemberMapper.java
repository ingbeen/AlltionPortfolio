package com.spring.mapper;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import com.spring.alltion.login.MemberVO;

public interface MemberMapper {

	public int insertMember(MemberVO membervo);
	public int userCheck(MemberVO membervo);
	public ArrayList<MemberVO> getMemberlist();
	int idCheckService(String member_id);
	public MemberVO selectMember(String userId);
	public int updateEmail(MemberVO membervo);
	public int updatePassword(MemberVO membervo);
	public int updatePhone(MemberVO membervo);
	public int updateAddress(MemberVO membervo);
	public int member_delete(MemberVO membervo);
	public int getMember_manager(@Param(value="userId")String userId); // 매니저 체크
}
