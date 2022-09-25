package com.spring.domain;

import java.util.Date;

import lombok.Data;

@Data
public class ReplyVO {

	private Long rno;		//번호 
	private Long bno;		//댓글 읽기 
	
	private String reply;	//댓글 내용 	
	private String replyer;
	private Date replyDate;
	private Date updateDate;//최종수정 시간 
	
}
