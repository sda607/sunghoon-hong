<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<%@ include file="../includes/header.jsp" %>
	  <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">member Register</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                          	member Register
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                          <h1></h1>
                       		 <div class="container">	
								<h2>로그인폼</h2>
								<form id="login_form" method="post">
								    <div class="form-group">
								        <label for="userid">ID</label>
								        <input type="text" class="id_input form-control" name="userid" placeholder="ID">
								    </div>
								    
								    <div class="form-group">
								        <label for="userpw">Password</label>
								        <input type="password" class="pw_input form-control" name="userpw" placeholder="Password">
								    </div>
								    
								    <c:if test="${result == 0}">
								    	<div class = "login_warn" style="margin-top: 30px; text-align:center; color:red;">사용자 ID 또는 비밀번호를 잘못 입력하셨습니다.</div>
								    </c:if>
								    
								    <div class="form-group">
								        <label class="form-check-label"><input type="checkbox"> Remember me</label>
								    </div>
								    <button type="button" class="login_button btn btn-primary">Sign in</button>
								</form>
                        </div>
                        <!-- /.panel-body -->
                    </div>
                    <!-- /.panel -->
                </div>
                <!-- /.col-lg-12 -->
            </div>
          	<!-- row -->
<script type="text/javascript">
	/* 로그인 버튼 클릭 메서드 */
	$(".login_button").click(function(){
		//alert("로그인 버튼 작동");
		
		/* 로그인 메서드 서버 요청 */
		
		$("#login_form").attr("action", "/member/login");
		$("#login_form").submit();
		
	});
</script>
<%@ include file="../includes/footer.jsp" %>
