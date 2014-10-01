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
					<input type="text" class="form-control" placeholder="이메일" name="e_mail" id="e_mail">
				</div> <br>
<%-- 						<button id="<%=vo.getExpress_id()%>" class="btn btn-primary btn-lg getButton" data-toggle="modal" data-target="#myModal2">확인</button> --%>
					<button class = "btn btn-primary btn-lg getButton">입력</button>
					<button class="btn btn-primary btn-lg" data-toggle="modal" data-target="#myModal" >확인</button>
				
				
	
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
	var user_id;
	var user_name;
	var e_mail;
	
	$(document).on("click", ".getButton", function(){
		user_id = $("#user_id").val();
		user_name = $("#user_name").val();
		e_mail = $("#e_mail").val();
		
		window.location = "passwordFind.do?user_id=" + user_id + "&user_name=" + user_name+"&e_mail=" + e_mail;

	});		
	

</script>
</html>