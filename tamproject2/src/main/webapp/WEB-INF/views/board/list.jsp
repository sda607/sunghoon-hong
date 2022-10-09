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
                                        <td><c:out value="${board.bno}" /></td>
                                        <td><a class='move' href='<c:out value="${board.bno}"/>'>
											<c:out value="${board.title}" />
										</a></td>
										
                                        <td><c:out value="${board.writer}"/></td>
                                        <td><fmt:formatDate pattern="yyyy-MM-dd" value="${board.regdate}"/></td>
                                        <td><fmt:formatDate pattern="yyyy-MM-dd" value="${board.updateDate}"/></td>
                                    </tr>
                                 </c:forEach>
                                </tbody>
                            </table>
                           <!--   <td><a class='move' href='<c:out value="${board.bno}" />'><c:out value="${board.title}" /></a></td>-->
                                	<!--  <button type="button" class="close" data-dismiss="modal" aria-label="Close"> -->
                            <!-- /.table-responsive -->
                       		<form id="searchForm" action="/board/list" method="get">
                       			<select name="type">		<!-- 검색조건과 키워드 보여주는 부분  -->
                       			  <option value="" ${pageMaker.cri.type == null?"selected":"" } >---</option> 
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
											<a href="${num}">${num}</a>
										</li>
									</c:forEach>
			
									<c:if test="${pageMaker.next}">
										<li class="paginate_button next"><a
											href="${pageMaker.endPage +1 }">Next</a></li>
									</c:if>
                       			
                       			
                       			</ul>
                       		</div> 
                       		
                       		
                       		<!-- 페이지 처리와 검색 전송  -->
                       		<form id="actionForm" action="/board/list" method="get">
                       			<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}">
                       			<input type="hidden" name="amount" value="${pageMaker.cri.amount}">
                       			<input type="hidden" name="type" value="${pageMaker.cri.type}">
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
			
			
			var actionForm = $("#actionForm");
			
			//페이지 이동  
			$(".paginate_button a").on(
								"click",
								function(e) {

									e.preventDefault();

									console.log('click');

									actionForm.find("input[name='pageNum']")
											.val($(this).attr("href"));
									actionForm.submit();
								});
			
			//게시물 조회를 위한 이벤트 처리 추 
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
			
			$("#searchForm button").on("click", function(e){
				
				e.preventDefault();
				console.log("click......");
				
				searchForm.find("input[name='pageNum']").val(1);	//1	페이지부터 검색  
				
				searchForm.submit();
				
			});
			
		});
</script>
 
<%@ include file="../includes/footer.jsp" %>