package com.spring.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.spring.domain.Criteria;
import com.spring.domain.ReplyVO;

public interface ReplyMapper {

	//외래키 사용하는 등록 작업 
	public int insert(ReplyVO vo);
	
	//특정 댓글 읽기
	public ReplyVO read(Long rno);
	
	//삭제(댓글의 번호)
	public int delete(Long rno);
	
	//수정(update)
	public int update(ReplyVO reply);
	
	//댓글 목록 
	public List<ReplyVO> getListwithPaging(
			@Param("cri") Criteria cri,
			@Param("bno") Long bno);
			
	
	
}
