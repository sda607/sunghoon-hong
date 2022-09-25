<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@include file="../includes/header.jsp"%>


<div class="row">
  <div class="col-lg-12">
    <h1 class="page-header">Board view</h1>
  </div>
  <!-- /.col-lg-12 -->
</div>
<!-- /.row -->

<div class="row">
  <div class="col-lg-12">
    <div class="panel panel-default">

      <div class="panel-heading">member get</div>
      <!-- /.panel-heading -->
      <div class="panel-body">
      
		<form>
          <div class="form-group">
          <label>userid</label> <input class="form-control" name='userid'
            value='<c:out value="${member.userid}"/>' readonly="readonly">
        </div>

        <div class="form-group">
          <label>username</label> <input class="form-control" name='username'
            value='<c:out value="${member.username}"/>' readonly="readonly" >
        </div>
        
        <div class="form-group">
          <label>userpw</label> <input class="form-control" name='userpw'
            value='<c:out value="${member.userpw}"/>' readonly="readonly" >
        </div>
        
        <div class="form-group">
          <label>email</label> <input class="form-control" name='email'
            value='<c:out value="${member.email}"/>' readonly="readonly" >
        </div>
        
        <div class="form-group">
          <label>birth</label> <input class="form-control" name='birth'
            value='<c:out value="${member.birth}"/>' readonly="readonly" >
        </div>
        
        <div class="form-group">
          <label>gender</label> <input class="form-control" name='gender'
            value='<c:out value="${member.gender}"/>' readonly="readonly" >
        </div>
	
		<%-- <button data-oper='modify' class="btn btn-default">
        <a href="/member/modify?userid=<c:out value="${member.userid}"/>">Modify</a></button>
        <button data-oper='list' class="btn btn-info">
        <a href="/member/list">List</a></button> --%>


	
	<%-- 	<form id='operForm' action="/boad/modify" method="get">
		  <input type='hidden' id='bno' name='bno' value='<c:out value="${board.bno}"/>'>
		</form>


		<form id='operForm' action="/boad/modify" method="get">
		  <input type='hidden' id='bno' name='bno' value='<c:out value="${board.bno}"/>'>
		  <input type='hidden' name='pageNum' value='<c:out value="${cri.pageNum}"/>'>
		  <input type='hidden' name='amount' value='<c:out value="${cri.amount}"/>'>
		  <input type='hidden' name='keyword' value='<c:out value="${cri.keyword}"/>'>
		  <input type='hidden' name='type' value='<c:out value="${cri.type}"/>'>  
		 
		</form>  --%>


	</form>
      </div>
      <!--  end panel-body -->

    </div>
    <!--  end panel-body -->
  </div>
  <!-- end panel -->
</div>
<!-- /.row -->

<script type="text/javascript">
/* $(document).ready(function() {
  	
	var formObj = $("form");
	
	$('.btn').click(function(e){
		
		e.preventDefault();
		
		var operation = $(this).data("oper");
		
		console.log(operation);
		
		if(operation == 'list'){
			
			self.location = "/member/list";
			
		}else if(operation == 'modify'){
			formObj.attr("action", "/member/modify")
				   .attr("method", "post");
			formObj.submit();
		} 
	})
	
  
}); */
</script>


<%@include file="../includes/footer.jsp"%>