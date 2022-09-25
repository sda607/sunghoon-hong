package com.spring.mapper;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.spring.domain.BoardVO;
import com.spring.domain.MemberVO;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class MemberMapperTests {
	
	@Autowired
	private MemberMapper memberMapper;
	
	@Test
	public void testGetMemberList() {
		log.info("----------------");
		log.info(memberMapper.getMemberList());
	}

	
	
	
	//회원가입 테스트
	 @Test
	  public void testInsert() {
		  MemberVO vo = new MemberVO();
		  vo.setUserid("may12345");
		  vo.setUsername("윤미혜"); 
		  vo.setUserpw("1234");
		  vo.setEmail("cloud123@naver.com");
		  vo.setBirth("1995-12-30");
		  vo.setGender("남");
	  
	  memberMapper.insertMember(vo); }
		
	//아이디 중복 체크
	 @Test
	 public void memberIdChk() {
		 String id = "sky123";
		 String id2 = "test123";
		 memberMapper.idCheck(id);
		 memberMapper.idCheck(id2);
	 }
	
	//로그인 쿼리 mapper 메서드 테스트
	@Test
	public void memberLogin() {
		MemberVO member = new MemberVO();
		
		//올바른 아이디 비번 입력 경우
		member.setUserid("sky123");
		member.setUserpw("1234");
		
		//옳지 않은 경우
		/*member.setUserid("sky123456");
		member.setUserpw("1234aaaa");*/
		
		memberMapper.memberLogin(member);
		System.out.println("결과값 : " + memberMapper.memberLogin(member));
		
	}
	
	 
	
	@Test
	public void testRead() {
		MemberVO vo = memberMapper.read("sky123");
		log.info(vo);
	}
	
	
	  
	  
	   @Test
	  public void testDelete(){
		  
		  MemberVO vo = new MemberVO();
		  vo.setUserid("test");
		  
		  memberMapper.deleteMember(vo);
	  }
	
	  
	  
	  
	  
	  @Test
	  public void testUpdate() {
		  MemberVO vo = new MemberVO();
			 vo.setUserid("sky123");
			 vo.setUsername("김성훈");
			 vo.setUserpw("1234");
			 vo.setEmail("cloud123@naver.com");
			 vo.setGender("남");
			  
			 memberMapper.updateMember(vo); 
	  }  
}
