<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="kr.ac.apart.vo.UserVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=Edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>메인</title>
<script src="static/js/bootstrap.js"></script>
<script src="static/js/jquery-1.11.1.js"></script>
<script src="static/js/bootstrap.min.js"></script>
<link href="static/css/bootstrap.min.css" rel="stylesheet" type="text/css">
<link href="static/css/style.css" rel="stylesheet" type="text/css">
<link href="static/css/stylish-portfolio.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css" href="style.css" media="only and min-width: 560px) and (max-width: 768px)" id="stylesheet-768" />
<link rel="stylesheet" type="text/css" href="style.css" media="only and (min-width: 768px) and (max-device-width: 1200px)" id="stylesheet-1200" />

</head>
<%
	UserVO user_vo = (UserVO)session.getAttribute("UserFlag");
	List<UserVO> user_id = (List<UserVO>)request.getAttribute("user_id");
%>
<body>
	<header id="top" class="header">
	<div class="text-vertical-center">
		<h1>BETWEEN APARTMENT</h1>
		
		<div class="alert alert-danger alert-dismissible" id="id_alert" role="alert">
			<button type="button" class="close" data-dismiss="alert">
				<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
			</button>
		</div>
		<input type="hidden" id="List_user_id" value="<%=user_id%>" />

		<form action="login.do" onsubmit="return UserIdCheck()" class="navbar-form navbar-left">
			<div class="col-xs-12 col-md-offset-12 col-md-11" align="center">
				<input type="text" class="form-control" placeholder="아이디" id="user_id" name="user_id"> 
				<input type="password" class="form-control" placeholder="비밀번호" id="user_password" name="user_password"> <br/> 
				<a href="passwordForm.do">비밀번호 찾기</a>&nbsp;&nbsp;

				<div class="btn-group">
					<button type="submit" class="btn btn-default" placeholder="제목">로그인</button>
				</div>
			</div>
		</form>
	</div>
	</header>
	
	<section id="about" class="about">
	<div class="container">
		<div class="row">
			<div class="col-xs-12 col-md-12 text-center">
				<h2>Between Apartment System>_<</h2>
				<p class="lead">
					This is Smart Building 
					<a target="_blank" href="http://join.deathtothestockphoto.com/">Death to the Stock Photo</a>.
				</p>
			</div>
		</div>
		<!-- /.row -->
	</div>
	<!-- /.container --> 
	</section>
</body>

<script type="text/javascript">
	$('#id_alert').hide();

function UserIdCheck(){
	$('#id_alert').hide();
	
	var User_Array = new Array();
	var user_id = $('#user_id').val();
	var db_user_id = $('#List_user_id').val();
	
	db_user_id = db_user_id.replace(/,/g, []);
	db_user_id=db_user_id.replace("[","");
	db_user_id=db_user_id.replace("]","");
	
	User_Array = db_user_id.split(' ');
	
	for(var i=0;i<=User_Array.length;i++){
		
		if(user_id===User_Array[i]){
			$('#id_alert').hide();
			return true;
		}
		else if(user_id!=User_Array[i]){
			$("strong").text("아이디가 존재하지 않습니다.");
			$('#id_alert').show();
		}
	}
	return false;
};
</script>
</html>