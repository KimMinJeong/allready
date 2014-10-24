<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=Edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />

<title>비밀번호 찾기</title>
<script src="static/js/jquery-1.11.1.js"></script>
<script src="static/js/bootstrap.js"></script>
<link href="static/css/bootstrap.css" rel="stylesheet" type="text/css">
<link href="static/css/style.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css" href="style.css" media="only and min-width: 560px) and (max-width: 768px)" id="stylesheet-768" />
<link rel="stylesheet" type="text/css" href="style.css" media="only and (min-width: 768px) and (max-device-width: 1200px)" id="stylesheet-1200" />
</head>

<body>
	<br> &nbsp;&nbsp;
	<a href="loginForm.do">메인으로 돌아가기</a>
	<div class="container font-style" align="right">
		<div class="center">
			<div class="col-xs-6 col-md-12">
				<div class="input-group">
					<span class="input-group-addon input-style">아이디</span> 
					<input type="text" class="form-control input-text-style" id="user_id">
				</div>

				<div class="input-group col-xs-6 col-md-offset-4 col-md-4">
					<span class="input-group-addon input-style">이&nbsp;&nbsp;름</span> 
					<input type="text" class="form-control input-text-style" id="user_name">
				</div>

				<div class="input-group col-xs-6 col-md-offset-4 col-md-4">
					<span class="input-group-addon input-style">이메일</span>
					<input type="text" class="form-control input-text-style" id="user_email">
				</div>  <br>
				
				<div class="col-xs-6 col-md-offset-4 col-md-4" id="passwordHere" align="left">
				</div>
				
				<div class="btn-group">
					<button type="button" class="btn button-style" id="submitButton">확인</button>
				</div>
			</div>
		</div>
	</div>
</body>

<script type="text/javascript">
	$("#submitButton").on('click', function(){
		if($("#user_id").val()==""){
			alert("ID를 입력해주세요");
			$("#user_id").focus();
			return false;
		}
		if($("#user_name").val()==""){
			alert("이름을 입력해주세요");
			$("#user_name").focus();
			return false;
		}
		if($("#user_email").val()==""){
			alert("E-mail을 입력해주세요");
			$("#user_email").focus();
			return false; 
		}else if($("#user_email").val().match(/^(\w+)@(\w+)[.](\w+)$/ig)==null){
			alert("E-mail 형식으로 입력해주세요.");
			$("#user_email").focus();
			return false;
		}
		
		
		$.ajax({
			url : "findPassword.do",
			type : "get",
			dataType : "json",
			data : {
				userId : $("#user_id").val(),
				userName : $("#user_name").val(),
				userEmail : $("#user_email").val(),
			},
			contentType : "application/json; charset=utf-8",
			success : function(data) {
				if(!data.userCheck){
					alert("일치하는 정보가 없습니다.");
				}
				else if(data.userCheck){
					if(data.getUser.role == "NORMAL"){
						$("#passwordHere").append(
							"비밀번호는 " + data.getUser.password + "입니다."	
						);
					}
					else  if(data.getUser.role == "MANAGER"){
						$("#passwordHere").append(
								"관리자는 별도의 비밀번호 찾기 서비스를 제공하지 않습니다."	
							);
					}
				}
			},
			error : function(e) {
				alert("error!");
			}
		});
	});
</script>
</html>