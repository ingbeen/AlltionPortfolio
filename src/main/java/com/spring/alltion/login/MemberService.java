package com.spring.alltion.login;

import java.util.ArrayList;

public interface MemberService {

		public int insertMember(MemberVO membervo);
		public int userCheck(MemberVO membervo);
		public ArrayList<MemberVO> getMemberlist();
		public MemberVO selectMember(String userId);
		int idCheckService(String member_id);
		public int updateEmail(MemberVO membervo);
		public int updatePassword(MemberVO membervo);
		public int updatePhone(MemberVO membervo);
		public int updateAddress(MemberVO membervo);
		public int member_delete(MemberVO membervo);
}
