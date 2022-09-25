package com.spring.mapper;

import java.util.List;

import com.spring.domain.MemberVO;

public interface MemberMapper {

	public List<MemberVO> getMemberList();
	
	public void insertMember(MemberVO member);
	
	public MemberVO read(String userid);
	
	public void deleteMember(MemberVO member);
	
	public void updateMember(MemberVO member);
	
	//아이디 중복 검사
	public int idCheck(String userid);
	
	//로그인
	public MemberVO memberLogin(MemberVO member);
}
