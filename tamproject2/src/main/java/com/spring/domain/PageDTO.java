package com.spring.domain;

import lombok.Getter;
import lombok.ToString;

@Getter
@ToString
public class PageDTO {

  private int startPage;		//시작 페이지 
  private int endPage;			//마지막 페이지 
  private boolean prev, next;	//이전, 다음 

  private int total;			//전체 페이지 
  private Criteria cri;

  //생성자 
  public PageDTO(Criteria cri, int total) {
    this.cri = cri;
    this.total = total;
    
    //마지막 페이지
    this.endPage = (int) (Math.ceil(cri.getPageNum() / 10.0)) * 10;
    //시작페이지
    this.startPage = this.endPage - 9;
    //실제 끝페이지
    int realEnd = (int) (Math.ceil((total * 1.0) / cri.getAmount()));
    //끝 페이지 조건
    //삼항 연산자 
    //this.endPage = realEnd <= endPage? realEnd : endPage;
    
    if (realEnd <= this.endPage) {
      this.endPage = realEnd;
    }

    this.prev = this.startPage > 1;	//이전 

    this.next = this.endPage < realEnd; //다음 
  }
  
}

