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
                                        <td>${board.bno}</td>
                                        <td><a class='move' href='<c:out value="${board.bno}" />'><c:out value="${board.title}" /></a></td>
                                        <td>${board.writer}</td>
                                        <td><fmt:formatDate pattern="yyyy-MM-dd" value="${board.regdate}" /></td>
                                        <td><fmt:formatDate pattern="yyyy-MM-dd" value="${board.updateDate}" /></td>
                                    </tr>
                                 </c:forEach>
                                </tbody>
                            </table>
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
                       		
                       	
                       		<div class='pull-right'>
                       			<ul class="pagination">
                       				<c:if test="${pageMaker.prev}">
	                       			<li class="page-item">
	                       				<a class="page-link" href="${pageMaker.startPage -1}" tabindex="-1">Previous</a>
									 </li>
									 </c:if>
                       				<c:forEach begin="${pageMaker.startPage}" 
                       							end="${pageMaker.endPage}" var="num">
                       					<li class="page-item ${pageMaker.cri.pageNum == num?"active":""} ">
                       					  <a class="page-link" href="${num}">${num}</a>
                       					</li>	
                       				</c:forEach>	
                       				<c:if test="${pageMaker.next}">
                       				<li class="page-item">
                       				<a class="page-link" href="${pageMaker.endPage +1}" tabindex="-1">NEXT</a>
									</li>
									</c:if>
                       			</ul>
                       		</div> 
                       		
                       		<!--  페이지 번호 클릭하면 form를 submit으로 날려버
                       		why form ? - 검색조건이 많이 붙었을 때 그때마다 관련된 링크들을전부 수정해야함 
                       		이동할때의 케이스 (조회할때, 페이지 번호, 검색할때 ))다양하기 때문에 form태그를 이용
                       		단점은 자바스크립트가동작하지 않으면 정상적으로 동작 할 수 없음   -->
                       		<!-- 페이지ㅣ 처리와 검색 전송  -->
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
          		
          		var result = '<c:out value="${result}"/>';
          		
          		checkModal(result);
          		
          		function checkModal(result){
          			if(result == '' || history.state){
          				return;
          			}
          			
          			if(result == 'success'){
          				$(".modal-body").html("정상적으로 처리되었습니다.");
          			}else if(parseInt(result) > 0){
          				$(".modal-body").html("게시글" + parseInt(result) + " 번이 등록되었습니다.");
          			}
          			
          			$("#myModal").modal("show");
          			
          		}
          		
          		$("#regBtn").on("click", function(){
          			self.location = "/board/register";
          		});
          		
          		
          		var actionForm = $("#actionForm");
          		//페이지 이동  
          	
          		$(".page-link").on("click", function(e){
          			
          			e.preventDefault();
          			
          			var targetPage = $(this).attr("href");
          			
          			console.log(targetPage);
          			
          			actionForm.find("input[name='pageNum']").val(targetPage);
          			actionForm.submit();
          			
          		});
          		//상세 페이지로 전송 
          		$(".move").on("click", function(e){
          			e.preventDefault();
          			
          			var targetBno = $(this).attr("href");
          			
          			console.log(targetBno);
          			
          			actionForm.append("<input type='hidden' name='bno' value='"+targetBno+"'>'");
          			actionForm.attr("action", "/board/get").submit();
          			
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