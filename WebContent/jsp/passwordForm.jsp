<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>비밀번호 찾기</title>
<script src="static/js/bootstrap.js"></script>
<script src="static/js/jquery-1.11.1.js"></script>
<script src="static/js/bootstrap.min.js"></script>
<link href="static/css/bootstrap.min.css" rel="stylesheet" type="text/css">
<link href="static/css/Style.css" rel="stylesheet" type="text/css">
</head>
	<%
 	String pwd = (String)request.getAttribute("password");
%>
<body>
	<br> &nbsp;&nbsp;
	<a href="loginForm.do">메인으로 돌아가기</a>
	<div class="container" align="right">
		<div class="center">
			<div class="col-md-offset-4 col-md-4">
	
				<div class="input-group">
					<span class="input-group-addon">아이디</span> 
					<input type="text" class="form-control" placeholder="아이디" name="user_id" id="user_id">
				</div>

				<div class="input-group .col-lg-offset-4 .col-lg-4">
					<span class="input-group-addon">이&nbsp;&nbsp;&nbsp;&nbsp;름</span> 
					<input type="text" class="form-control" placeholder="이름" name="user_name" id="user_name">
				</div>

				<div class="input-group .col-lg-offset-4 .col-lg-4">
					<span class="input-group-addon">이메일</span>
					<input type="text" class="form-control" placeholder="이메일" name="user_email" id="user_email">
				</div> <br>

				<div class="btn-group">
					<button type="button" class="btn btn-default dropdown-toggle" id="submitButton">확인</button>
				</div>
			</div>
		</div>
	</div>
	
		
			
				<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal">
									<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
								</button>
								
								<h4 class="modal-title" id="myModalLabel">비밀번호 확인</h4>
							</div>
							
							<div class="modal-body">
								<div align="left">
									<%
										if(pwd!=null){ %>
									
									비밀번호는 <%=pwd%> 입니다^3^
									<%} %>
								</div> <br><br>
							</div>
						</div>
					</div>
				</div>
</body>

<script type="text/javascript">
	$("#submitButton").on('click', function(){
		alert("버튼이 눌렸습니다.");
		
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
					alert("정보가 일치하지 않습니다.");
				}
				else if(data.userCheck){
					alert("정보가 일치합니다.");
				}
			},
			error : function(e) {
				alert("error!");
			}
		});
	});
</script>
</html>