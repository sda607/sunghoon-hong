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
                       		 <form id="register_form" method="post">
                       		
                       			<div class="form-group">
                                    <label>userid</label>
                                    <input class="id_input form-control" name="userid">
                                </div>
                                <span class="id_input_re_1" style="color: green; display: none;">사용 가능한 아이디입니다.</span>
							    <span class="id_input_re_2" style="color: red; display: none;">아이디가 이미 존재합니다.</span>
                       			<span class="final_id_ck">아이디를 입력해주세요.</span>
                       			
                       			<div class="form-group">
                                    <label>username</label>
                                    <input name="username" class="user_input form-control">
                                </div>
                                <span class="final_name_ck" style="display: none">이름을 입력해주세요.</span>
                       			
                       			<div class="form-group">
                                    <label>userpw</label>
                                    <input class="pw_input form-control" name="userpw">
                                </div>
                                <span class="final_pw_ck" style="display: none">비밀번호를 입력해주세요.</span>
                       			
                       			<div class="form-group">
                                    <label>userpw_confirm</label>
                                    <input class="pwck_input form-control" name="userpw_confirm">
                                </div>
                                <span class="final_pwck_ck" style="display: none">비밀번호 확인을 입력해주세요.</span>
                                <span class="pwck_input_re_1" style="color: green; display: none;">비밀번호가 일치합니다.</span>
							    <span class="pwck_input_re_2" style="color: red; display: none;">비밀번호가 일치하지 않습니다.</span>
                       			
                       			<div class="form-group">
                                    <label>email</label>
                                    <input type="email" class="mail_input form-control" name="email">
                                </div>    
                                <span class="final_mail_ck" style="display: none">이메일을 입력해주세요.</span>                      
                       			
                       			<div class="form-group">
                                    <label>birth</label>
                                	<input type="date" class="birth_input form-control" name="birth">
                                </div>
                                <span class="final_birth_ck" style="display: none">생일을 입력해주세요.(YYYY-MM-DD)</span>
                       			
                       			<div class="form-group">
                                    <label>gender</label>
                                    <input class="gender_input form-control" name="gender">
                                </div>
                                <span class="final_gender_ck" style="display: none">성별을 입력해주세요.(여/남)</span> 
                               
                                <button type="button" class="register_button btn btn-default">Submit Button</button>
                                <button type="reset" class="btn btn-default">Reset Button</button>
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

/* 유효성 검사 통과유무 변수 */
let idCheck = false; 		//아이디
let idckCheck = false; 		//아이디 중복 검사
let nameCheck = false;		//이름
let pwCheck = false;		//비번
let pwckCheck = false;		//비번 확인
let pwckcorCheck = false;	//비번 확인 일치
let mailCheck = false;		//이메일
let birthCheck = false;		//생일
let genderCheck = false;	//성별
	
	$(document).ready(function(){
		//회원가입 버튼(회원가입 기능 작동)
		$(".register_button").click(function(){
			
			/* 입력값 변수 */
			let id = $(".id_input").val();
			let name = $(".user_input").val();
			let pw = $(".pw_input").val();
			let pwck = $(".pwck_input").val();
			let mail = $(".mail_input").val();
			let birth = $(".birth_input").val();
			let gender = $(".gender_input").val();
			
			/* 아이디 유효성 검사 */
			if(id = ""){
				$(".final_id_ck").css("display", "block");
				idCheck = false;
			}else{
				$(".final_id_ck").css("display", "none");
				idCheck = true;
			}
			
			 /* 이름 유효성 검사 */
	        if(name == ""){
	            $('.final_name_ck').css('display','block');
	            nameCheck = false;
	        }else{
	            $('.final_name_ck').css('display', 'none');
	            nameCheck = true;
	        }
			
			/* 비밀번호 유효성 검사 */
			if(pw == ""){
				$('.final_pw_ck').css("display", "block");
				pwCheck = false;
			}else{
				$('.final_pw_ck').css("display", "none");
				pwCheck = true;
			}
			
			/* 비밀번호 확인 유효성 검사 */
			if(pwck == ""){
				$('.final_pwck_ck').css("display", "block");
				pwckCheck = false;
			}else{
				$('.final_pwck_ck').css("display", "none");
				pwckCheck = true;
			}
			
			 /* 이메일 유효성 검사 */
	        if(mail == ""){
	            $('.final_mail_ck').css('display','block');
	            mailCheck = false;
	        }else{
	            $('.final_mail_ck').css('display', 'none');
	            mailCheck = true;
	        }
			
			 /* 생일 유효성 검사 */
	        if(birth == ""){
	            $('.final_birth_ck').css('display','block');
	            birthCheck = false;
	        }else{
	            $('.final_birth_ck').css('display', 'none');
	            birthCheck = true;
	        }
			
			 /* 성별 유효성 검사 */
	        if(gender == ""){
	            $('.final_gender_ck').css('display','block');
	            genderCheck = false;
	        }else{
	            $('.final_gender_ck').css('display', 'none');
	            genderCheck = true;
	        }
			 
	        if(idCheck&&idckCheck&&nameCheck&&pwCheck&&pwckCheck&&pwckcorCheck&&mailCheck&&birthCheck&&genderCheck ){
	        	$("#register_form").attr("action", "/member/register");
				$("#register_form").submit();
	        }    
			return false;
		}); //register 버튼 종료
		
	});	//document.function 종료
	
	
	//아이디 중복검사
	$(".id_input").on("propertychange change keyup paste input", function(){
		let userid = $(".id_input").val();
		let data = {userid: userid}
		
		$.ajax({
			type : "post",
			url : "/member/memberIdChk",
			data : data,
			success : function(result){
				 //console.log("성공 여부" + result);
				 if(result != 'fail'){
					 $(".id_input_re_1").css("display", "inline-block");
					 $(".id_input_re_2").css("display", "none");
					 idckCheck = true;
				 }else{
					 $(".id_input_re_2").css("display", "inline-block");
					 $(".id_input_re_1").css("display", "none");
					 idckCheck = false;
				 }
			}
		}); //ajax종료
	}); //아이디 종료
	
	/* 비밀번호 확인 일치 유효성 검사 */
	$(".pwck_input").on("propertychange change keyup paste input", function(){
		let pw = $(".pw_input").val();
		let pwck = $(".pwck_input").val();
		$(".final_pwck_ck").css("display", "none");
		
		if(pw == pwck){
			$(".pwck_input_re_1").css("display", "block");
			$(".pwck_input_re_2").css("display", "none");
			pwckcorCheck = true;
		}else{
			$(".pwck_input_re_1").css("display", "none");
			$(".pwck_input_re_2").css("display", "block");
			pwckcorCheck = false;
		}
	}); //비밀번호 종료
	

</script>
           
     <%@ include file="../includes/footer.jsp" %>