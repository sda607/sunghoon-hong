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
                           <button type="button" id="m_regBtn" class="btn btn-xs pull-right">join</button>
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                            <table width="100%" class="table table-striped table-bordered table-hover">
                                <thead>
                                    <tr>
                                        <th>UserId</th>
                                        <th>UserName</th>
                                        <th>UserPw</th>
                                        <th>Email</th>
                                        <th>Birth</th>
                                        <th>Gender</th>
                                    </tr>
                                </thead>
                                <tbody>
                                <c:forEach items="${m_list}" var="member">
                                    <tr class="odd gradeX">
                                        <td><a href="/member/modify?userid=<c:out value="${member.userid}" />"><c:out value="${member.userid}" /></a></td>
                                        <td>${member.username}</td>
                                        <td>${member.userpw}</td>
                                        <td>${member.email}</td>
                                        <td>${member.birth}</td>
                                        <td>${member.gender}</td>
                                    </tr>
                                 </c:forEach>
                                </tbody>
                            </table>
                            <!-- /.table-responsive -->
                       
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
          		
          	/* 	var result = '<c:out value="${result}"/>';
          		
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
          			
          		} */
          		
          	$("#m_regBtn").on("click", function(){
          			location.href = "/member/register";
          		});
          		
          	});
          </script>
           
     <%@ include file="../includes/footer.jsp" %>