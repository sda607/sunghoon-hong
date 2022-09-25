package com.spring.domain;

import lombok.Getter;
import lombok.ToString;

@Getter
@ToString
public class PageDTO {

  private int startPage;
  private int endPage;
  private boolean prev, next;

  private int total;
  private Criteria cri;

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
    if (realEnd <= this.endPage) {
      this.endPage = realEnd;
    }

    this.prev = this.startPage > 1;	//이전 

    this.next = this.endPage < realEnd; //다음 
  }
  
}

