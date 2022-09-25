package com.spring.mapper;

import java.util.List;
import java.util.stream.IntStream;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.spring.domain.Criteria;
import com.spring.domain.ReplyVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class ReplyMapperTests {
	//해당 번호의 게시물 존재하는지 확
	private Long[] bnoArr = {10L, 11L, 12L, 13L, 14L};
	
	@Setter(onMethod_ = @Autowired)
	private ReplyMapper mapper;
	
	@Test
	public void testCreat() {
		IntStream.rangeClosed(1, 10).forEach(i -> {
			ReplyVO vo = new ReplyVO();
			
			//게시물 번호
			vo.setBno(bnoArr[i % 5]);
			vo.setReply("댓글 테스트 " +i);
			vo.setReplyer("replayer" + i);
		});
	}
	
	@Test
	public void testRead() {
		Long targetRno = 1L;
		
		ReplyVO vo = mapper.read(targetRno);
		log.info(vo);
		
	}
	
	@Test
	public void testDelete() {
		Long targetRno = 2L;
		
		mapper.delete(targetRno);
		
		 
	}
	
	@Test
	public void testUpdate() {
		
		Long targeRno = 3L;
		
		ReplyVO vo = mapper.read(targeRno);
		vo.setReply("update Reply" );
		int count = mapper.update(vo);
		log.info(count);
		
		
	}
	
	@Test
	public void testList() {
		
		Criteria cri = new Criteria();
		
		List<ReplyVO> replies = mapper.getListwithPaging(cri, bnoArr[0]);
		
		replies.forEach(reply -> log.info(reply));
	}
	
	
	@Test
	public void testMapper() {
		
		log.info(mapper);
	}
	
	
	
}
