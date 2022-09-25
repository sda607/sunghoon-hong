package MemberServiceTests;


import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.spring.domain.MemberVO;
import com.spring.service.MemberService;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
// Java Config
// @ContextConfiguration(classes = {org.zerock.config.RootConfig.class} )
@Log4j
public class MemberServiceTests {

	@Setter(onMethod_ = { @Autowired })
	private MemberService service;
	
	/* @Test
	  public void testUpdate() {
		  MemberVO vo = new MemberVO();
			 vo.setUserid("test");
			 vo.setUsername("김현정");
			 vo.setUserpw("1234");
			 vo.setEmail("cloud123@naver.com");
			 vo.setBirth("2012-12-12");
			 vo.setGender("남");
			 vo.setAdminCk(0);
			  
			service.modify(vo); 
	  } */
	 
	  @Test
	  public void testDelete(){
		  
		  MemberVO vo = new MemberVO();
		  vo.setUserid("test1");
		  
		  service.remove(vo);
	  }
	
	
}