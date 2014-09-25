<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>메인</title>
<script src="static/js/bootstrap.js"></script>
<script src="static/js/jquery-1.11.1.js"></script>
<script src="static/js/bootstrap.min.js"></script>
<link href="static/css/bootstrap.min.css" rel="stylesheet" type="text/css">
<link href="static/css/style.css" rel="stylesheet" type="text/css">
</head>

<body>
	<form action="login.do" class="navbar-form navbar-left">
		<div class="container" align="right">
			<div class="center">
				<center><h1>BETWEEN APARTMENT</h1></center>
				
				<div class="col-md-offset-4 col-md-4">
					<div class="input-group">
						<span class="input-group-addon">&nbsp;&nbsp;아이디&nbsp;&nbsp;</span>
						<input type="text" class="form-control" placeholder="아이디" id="user_id" name="user_id">
					</div>

					<div class="input-group .col-lg-offset-4 .col-md-4">
						<span class="input-group-addon">비밀번호</span> 
						<input type="password" class="form-control" placeholder="비밀번호" id="user_password" name="user_password">
					</div> <br> 
					
					<a href="passwordForm.do">비밀번호 찾기</a>&nbsp;&nbsp;

					<div class="btn-group">
						<button type="submit" class="btn btn-default" placeholder="제목">로그인</button>
					</div>
				</div>
			</div>
		</div>
	</form>
</body>
</html>