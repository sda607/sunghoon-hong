package com.spring.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.domain.MemberVO;
import com.spring.mapper.MemberMapper;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class MemberServiceImpl implements MemberService {
	
	@Setter(onMethod_= @Autowired)
	private MemberMapper mapper;

	@Override
	public List<MemberVO> getList() {
		return mapper.getMemberList();
	}

	@Override
	public void regsiter(MemberVO member) {
		mapper.insertMember(member);
		
	}

	@Override
	public MemberVO get(String userid) {
		return mapper.read(userid);
	}

	@Override
	public void remove(MemberVO member) {
		mapper.deleteMember(member);
		
	}

	@Override
	public void modify(MemberVO member) {
		mapper.updateMember(member);
	}

	@Override
	public int idCheck(String userid) {
		return mapper.idCheck(userid);
	}

	//로그인
	@Override
	public MemberVO memberLogin(MemberVO member) {
		
		return mapper.memberLogin(member);
	}

	

}
