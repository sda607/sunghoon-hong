<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%@ include file="../includes/header.jsp" %>
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">Tables</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            DataTables Advanced Tables
                            <button type="button" id="regBtn" class="btn btn-xs pull-right">register new board</button>
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                            <table width="100%" class="table table-striped table-bordered table-hover">
                                <thead>
                                    <tr>
                                        <th>BNO</th>
                                        <th>Title</th>
                                        <th>Writer</th>
                                        <th>RegDate</th>
                                        <th>UpdateDate</th>
                                    </tr>
                                </thead>
                                <tbody>
                                <c:forEach items="${list}" var="board">
                                    <tr class="odd gradeX">
                                        <td><c:out value="${board.bno}" /></td><!-- 조회 페이지로 이동한 후 다시 목록으로 돌아가면 다시 1페이지의 상태로 돌아가는 문제
										현재 목록페이지의 pageNum과 amount를 같이 전달
										<form>태그에 추가로 게시물의 번호를 같이 전송하고, action 값을 조정
										<a>태그에는 이동하려는 게시물의 번호만을 가지게 수정
										(이벤트 처리하기 위해서 <a>태그 class 속성 부여 ) -->
                                        <td><a class='move' href='<c:out value="${board.bno}"/>'>
					<c:out value="${board.title}" /></a></td>
                                        <td><c:out value="${board.writer}"/></td>
                                        <td><fmt:formatDate pattern="yyyy-MM-dd" value="${board.regdate}"/></td>
                                        <td><fmt:formatDate pattern="yyyy-MM-dd" value="${board.updateDate}"/></td>
                                    </tr>
                                 </c:forEach>
                                </tbody>
                            </table>
                         	<!--페이지 번호가 파라미터로 유지되었던 것처럼 검색 조건과 키워드 역시 항상 화면 이동 시 같이 전송 되어야 함-->
                       		<form id="searchForm" action="/board/list" method="get">
                       			<select name="type">		<!-- 검색조건과 키워드 보여주는 부분  -->
                       			  <option value="" ${pageMaker.cri.type == null?"selected":"" } >---</option> <!--<select> 태그의 내부는 삼항 연산자를 이용해서 해당 조건으로 검색되었다면 ‘selected’라는 문자열을 출력하게 해서 화면에서 선택된 항목으로 보이도록 함-->
                       			  <option value="T" ${pageMaker.cri.type eq 'T'?"selected":"" } >제목</option>
                       			  <option value="C" ${pageMaker.cri.type eq 'C'?"selected":"" } >내용</option>
                       			  <option value="W" ${pageMaker.cri.type eq 'W'?"selected":"" } >작성자</option>
                       			  <option value="TC" ${pageMaker.cri.type eq 'TC'?"selected":"" } >제목+내용</option>
                       			  <option value="TCW" ${pageMaker.cri.type eq 'TCW'?"selected":"" } >제목+내용+작성자</option>
                       			</select>
                       			<input type="text" name='keyword' class="keyword" value="${pageMaker.cri.keyword}">
                       			<input type='hidden' name='pageNum' value='${pageMaker.cri.pageNum}'>
                       			<input type='hidden' name='amount' value='${pageMaker.cri.amount}'>
                       			<button class="btn btn-default">Search</button>
                       		</form>
                       		
                       		<!-- 페이징 처리  -->
                       		<div class='pull-right'>
                       			<ul class="pagination">
						<c:if test="${pageMaker.prev}">
							<li class="paginate_button previous"><a
									href="${pageMaker.startPage -1}">Previous</a></li>
							</c:if>

							<c:forEach var="num" begin="${pageMaker.startPage}"
								end="${pageMaker.endPage}">
								<li class="paginate_button  ${pageMaker.cri.pageNum == num ? "active":""} ">
									<a href="${num}">${num}</a><!--<a>태그의 href 속성값으로 페이지 번호를 가지도록 수정 (번호의 출력은 가독성의 문제로 EL 이용)-->
								</li>
							</c:forEach>

							<c:if test="${pageMaker.next}">
								<li class="paginate_button next"><a
									href="${pageMaker.endPage +1 }">Next</a></li>
							</c:if>

                       			</ul>
                       		</div> 
                       		
                       		
                       		<!-- 페이지 처리(get 방식)와 검색 전송  -->
				<!--실제 페이지를 클릭하면 <form>태그를 이용해서 처리-->
                       		<form id="actionForm" action="/board/list" method="get">
                       			<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}">
                       			<input type="hidden" name="amount" value="${pageMaker.cri.amount}">
                       			<input type="hidden" name="type" value= "${pageMaker.cri.type}">
                       			<input type="hidden" name="keyword" value="${pageMaker.cri.keyword}">
                       		</form>
                       		
                       		
                        </div>
                        <!-- /.panel-body -->
                    </div>
                    <!-- /.panel -->
                </div>
                <!-- /.col-lg-12 -->
            </div>
          	<!-- row -->
      
          	<!-- 모달창 -->
			<div id="myModal" class="modal" tabindex="-1" role="dialog" >
			  <div class="modal-dialog" role="document">
			    <div class="modal-content">
			      <div class="modal-header">
			        <h5 class="modal-title">Modal title</h5>
			       
			        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
			          <span aria-hidden="true">&times;</span>
			        </button>
			      </div>
			      <div class="modal-body">
			        <p>Modal body text goes here.</p>
			      </div>
			      <div class="modal-footer">
			        <button type="button" class="btn btn-primary" data-dismiss="modal">Save changes</button>
			        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
			      </div>
			    </div>
			  </div>
			</div>
          	
<script>
		$(document).ready(function(){
			//재전송(redirect)처리 
			var result = '<c:out value="${result}"/>';
			
			checkModal(result);
			
			history.replaceState({}, null, null);
			
			//모달(Modal)창 보여주기 - 목록에서 버튼으로 이동하기  
			function checkModal(result){
				
				if(result === '' || history.state){
					return;
				}
				
				if(parseInt(result) > 0){
					$(".modal-body").html(
				"게시글 " + parseInt(result) + " 번이 등록되었습니다.");
				}
				
				$("#myModal").modal("show");
				
			}
			
			$("#regBtn").on("click", function(){
				self.location = "/board/register";
			});
			
			
			var actionForm = $("#actionForm");//actionForm 자체를 submit() 시킴
			
			//페이지 이동  
			//<form>태그를 추가해서 URL의 이동을 처리하도록 변경
			$(".paginate_button a").on(
					"click",
					function(e) {

						e.preventDefault();//<a>태그를 클릭해도 페이지 이동 없도록 **preventDefault()**처리

						console.log('click');

						actionForm.find("input[name='pageNum']")
								.val($(this).attr("href"));//<form> 태그 내 pageNum 값은 href 속성값으로 변경
						actionForm.submit();
					});
			
			//게시물 조회를 위한 이벤트 처리 추가
			//<form> 태그에 추가로 bno 값을 전송하기 위해서 <input> 태그를 만들어 추가하고
			//<form> 태그의 action은 "/board/get"으로 변경
			$(".move").on(
					"click",
					function(e) {

						e.preventDefault();
						actionForm
								.append("<input type='hidden' name='bno' value='"
										+ $(this).attr(
												"href")
										+ "'>");
						actionForm.attr("action",
								"/board/get");
						actionForm.submit();

					});
			
			//검색 폼 처리
			var searchForm = $("#searchForm");
			
			$("#searchForm button").on("click", function(e){//검색 버튼을 클릭하면 검색은 1페이지를 하도록 수정하고
				
				if(!searchForm.find("option:selected").val()){
					alert("검색종류를 선택하세요 ");
					return false;
					
				}
				
				if(!searchForm.find("input[name='keyword']").val()){//화면에 검색 조건과 키워드가 보이게 처리하는 작업 우선
					alert("키워드를 입력하세요 ");
					return false;
					
				}
				
				
				searchForm.find("input[name='pageNum']").val(1);	//1페이지부터 검색  
				e.preventDefault();
				
				searchForm.submit();
				
			});
			
		});
</script>
 
<%@ include file="../includes/footer.jsp" %>
