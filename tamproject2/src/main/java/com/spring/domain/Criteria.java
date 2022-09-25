package com.spring.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;


@ToString
@Setter
@Getter
public class Criteria {

  private int pageNum;	//페이지 번호 
  private int amount;	//페이지당 게시글 수 
  
  private String type;  //t, tc, tcw, cw
  private String keyword;

  public Criteria() {
    this(1, 10);
  }

  public Criteria(int pageNum, int amount) {
    this.pageNum = pageNum;
    this.amount = amount;
  }
  //roop를 돌리기 위해서 배열이 필요해
  //getTypeArr 검색조건이 각 글자(T, W, C)이므로 검색조건을 배열로 만들어서 한 번에 처리하기 위함  
  //MyBatis의 동적 태그를 활용함
  public String[] getTypeArr() {
    //빈 배열을 하나 만든다 - null이 안나게 하려고 
    return type == null? new String[] {}: type.split("");
  }
}
