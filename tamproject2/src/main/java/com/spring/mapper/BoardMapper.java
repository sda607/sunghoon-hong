package com.spring.mapper;

import java.util.List;

import com.spring.domain.BoardVO;
import com.spring.domain.Criteria;

public interface BoardMapper {
	//글 목록
	public List<BoardVO> getList();
	
	//목록 페이지 처리 
	public List<BoardVO> getListWithPaging(Criteria cri); 
	
	//글 쓰기 
	public void insert(BoardVO board);
	
	//@SelectKey 자동으로 PK값 확인 
	public Integer insertSelectKey(BoardVO board);

	//글 조회 
	public BoardVO read(Long bno);

	//글 삭제 
	public int delete(Long bno);

	//글 수정 
	public int update(BoardVO board);

	//조회수 
	public int getTotalCount(Criteria cri);
}
