package com.spring.mapper;

import java.util.ArrayList;

import com.spring.alltion.login.MemberVO;

public interface MemberMapper {

	public int insertMember(MemberVO membervo);
	public int userCheck(MemberVO membervo);
	public ArrayList<MemberVO> getMemberlist();
	public int deleteMember(MemberVO membervo);
	public int updateEmail(MemberVO membervo);
	public int updatePassword(MemberVO membervo);
	int idCheckService(String member_id);
	public MemberVO selectMember(String userId);

}
