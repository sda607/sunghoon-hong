package com.spring.mapper;

import java.util.List;

import com.spring.domain.BoardVO;
import com.spring.domain.Criteria;

public interface BoardMapper {

	public List<BoardVO> getList();// 글 목록 보

	public List<BoardVO> getListWithPaging(Criteria cri); //목록 페이

	public void insert(BoardVO board);

	public Integer insertSelectKey(BoardVO board);

	public BoardVO read(Long bno);

	public int delete(Long bno);

	public int update(BoardVO board);

	public int getTotalCount(Criteria cri);
}
