package com.spring.alltion.login;

import java.util.ArrayList;

public interface MemberService {

		public int insertMember(MemberVO membervo);
		public int userCheck(MemberVO membervo);
		public ArrayList<MemberVO> getMemberlist();
		public MemberVO selectMember(String userId);
		public int deleteMember(MemberVO membervo);
		public int updateEmail(MemberVO membervo);
		public int updatePassword(MemberVO membervo);
		int idCheckService(String member_id);
		
}
