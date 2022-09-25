package com.spring.service;

import java.util.List;

import com.spring.domain.BoardVO;
import com.spring.domain.Criteria;

public interface BoardService {

	public void register(BoardVO board);

	public BoardVO get(Long bno);

	public boolean modify(BoardVO board);

	public boolean remove(Long bno);

	//public List<BoardVO> getList();

	public List<BoardVO> getList(Criteria cri); //목록 페이지 

	//추가
	public int getTotal(Criteria cri);

}
