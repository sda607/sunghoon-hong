# TomandMay
>데모주소

</br>

## 1.제작 기간 & 참여 인원
* 2022년 9월 1일 ~ 9월16일
* 팀프로젝트 / 2명

</br>

## 2.사용 기술
* Java 8
* Spring 5.2
* Oracle 
* MyBatis

</br>

## 3.ERD 설계




## 4.핵심 기능
* 데이터베이스를 활용해서 기본적인 등록,수정,삭제,조회 기능을 구현
* 웹 화면에서 페이징 처리와 검색 처리
* 다양한 종류의 첨부파일을 웹에 게시
* Ajax를 이용하는 데이터 처리
* 스프링 시큐리티를 이용해서 웹의 로그인/로그아웃 처리 
<details>
<summary>핵심 기능 설명 펼치기</summary>
<div markdown="1">       

### 4.1 전체 흐름

### 4.2 사용자 요청

### 4.3 Controller

![BoardController의 분석](./controller%EA%B3%84%EC%B8%B5%EA%B5%AC%EC%A1%B0.jpeg)
- **CRUD 처리** :pushpin: [코드 확인](https://github.com/sda607/sunghoon-hong/blob/3967e8742641962dd29ff88e7516fcecf15f32a1/tamproject2/src/main/java/com/spring/controller/BoardController.java)

- **목록 화면 처리** :pushpin: [코드 확인]()

</div>
</details>




## 5.핵심 트러블 슈팅
- **목록 페이지와 뒤로 가기 문제** :pushpin: [코드 확인]()

### 5.1 페이징 처리 문제


## 6.그 외 이슈사항
<details>
<summary>한글 문제와 UTF-8 필터 처리</summary>
<div markdown="1">
1.브라우저에서 한글이 꺠져서 전송되는지 확인

2.문제가 없다면 스프링 MVC 쪽에서 한글을 처리하는 필터를 등록
![web.xml을 이용할 때의 UTF-8 필터](./UTF-8.png)



</div>
</details>
