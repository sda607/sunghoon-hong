<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@include file="../includes/header.jsp"%>


<div class="row">
  <div class="col-lg-12">
    <h1 class="page-header">member Modify/Delete</h1>
  </div>
  <!-- /.col-lg-12 -->
</div>
<!-- /.row -->

<div class="row">
  <div class="col-lg-12">
    <div class="panel panel-default">

      <div class="panel-heading">Board Modify/Delete</div>
      <!-- /.panel-heading -->
      <div class="panel-body">
      
		<form id="modifyForm" action="/member/modify" method="post">
          <div class="form-group">
          <label>userid</label> <input class="form-control" name='userid'
            value='<c:out value="${member.userid}"/>' readonly="readonly">
        </div>

        <div class="form-group">
          <label>username</label> <input class="form-control" name='username'
            value='<c:out value="${member.username}"/>' >
        </div>
        
        <div class="form-group">
          <label>userpw</label> <input class="form-control" name='userpw'
            value='<c:out value="${member.userpw}"/>' >
        </div>
        
        <div class="form-group">
          <label>email</label> <input class="form-control" name='email'
            value='<c:out value="${member.email}"/>' >
        </div>
        
    	<div class="form-group">
          <label>birth</label> <input class="form-control" name='birth'
            value='<c:out value="${member.birth}"/>' >
        </div>
        
        <div class="form-group">
          <label>gender</label> <input class="form-control" name='gender'
            value='<c:out value="${member.gender}"/>' >
        </div>

        

        <div class="form-group">
          <label>Writer</label> <input class="form-control" name='writer'
            value='<c:out value="${board.writer }"/>'>
        </div>
	
<%-- 		<button data-oper='modify' class="btn btn-default">
        <a href="/board/modify?bno=<c:out value="${board.bno}"/>">Modify</a></button>
        <button data-oper='list' class="btn btn-info">
        <a href="/board/list">List</a></button> --%>


		<button data-oper='modify' class="btn btn-default">Modify</button>
		<button data-oper='remove' class="btn btn-danger">remove</button>
		<button data-oper='list' class="btn btn-info">List</button>

<%-- <form id='operForm' action="/boad/modify" method="get">
  <input type='hidden' id='bno' name='bno' value='<c:out value="${board.bno}"/>'>
</form> --%>


<%-- <form id='operForm' action="/member/modify" method="get">
  <input type='hidden' id='bno' name='bno' value='<c:out value="${board.bno}"/>'>
  <input type='hidden' name='pageNum' value='<c:out value="${cri.pageNum}"/>'>
  <input type='hidden' name='amount' value='<c:out value="${cri.amount}"/>'>
  <input type='hidden' name='keyword' value='<c:out value="${cri.keyword}"/>'>
  <input type='hidden' name='type' value='<c:out value="${cri.type}"/>'>  
 
</form> --%>

 		<!-- <a class="btn" id="list_btn">list</a> 
        <a class="btn" id="modify_btn">modify</a>
        <a class="btn" id="remove_btn">remove</a>
		 -->
	</form>
	<!-- <form id ="infoForm" action="/member/modify" method="get">
		<input type="hidden" id="userid" name="userid" value='<c:out value="pageInfo.userid" />'>
	</form> -->
      </div>
      <!--  end panel-body -->

    </div>
    <!--  end panel-body -->
  </div>
  <!-- end panel -->
</div>
<!-- /.row -->

<script type="text/javascript">
$(document).ready(function() {

	var formObj = $("form");
	
	
	$('.btn').click(function(e){
		
		e.preventDefault();
		
		var operation = $(this).data("oper");
		
		console.log(operation);
		
	if(operation === 'list'){
		self.location="/member/list";
		}else if(operation === 'remove'){
			formObj.attr("action", "/member/remove")
			.attr("method", "post");
			formObj.submit();
		}
	})
	
	})
	

</script>


<%@include file="../includes/footer.jsp"%>