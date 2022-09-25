package com.spring.service;

import java.util.List;

import com.spring.domain.MemberVO;

public interface MemberService {

	public List<MemberVO> getList();
	
	public void regsiter(MemberVO member);
	
	public MemberVO get(String userid);
	
	public void remove(MemberVO member);
	
	public void modify(MemberVO member);

	//아이디 중복체크
	public int idCheck(String userid);
	
	//로그인
	public MemberVO memberLogin(MemberVO member);
}
