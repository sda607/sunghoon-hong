package com.spring.service;

import java.util.List;

import com.spring.domain.BoardVO;
import com.spring.domain.Criteria;

public interface BoardService {
	
	//글 등록  
	public void register(BoardVO board);

	//글 조회 
	public BoardVO get(Long bno);
	
	//글 수정 
	public boolean modify(BoardVO board);

	//글 삭제 
	public boolean remove(Long bno);

	//public List<BoardVO> getList();

	//목록 페이지 
	public List<BoardVO> getList(Criteria cri); 

	//글 추가
	public int getTotal(Criteria cri);

}
