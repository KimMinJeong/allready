<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="kr.ac.apart.vo.UserVO"%>
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
<% 
	UserVO user_vo = (UserVO)session.getAttribute("UserFlag");
	List<UserVO> user_id = (List<UserVO>)request.getAttribute("user_id");
%>
<body>
	<div class="alert alert-danger alert-dismissible" id="id_alert" role="alert">
		<button type="button" class="close" data-dismiss="alert"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
	  	<strong>아이디가 존재하지 않습니다.</strong>
	</div>
	<form action="login.do" onsubmit="return UserIdCheck()" class="navbar-form navbar-left">
		<div class="container" align="right">
			<div class="center">
				<center><h1>BETWEEN APARTMENT</h1></center>
				
				<div class="col-md-offset-4 col-md-4">
					<div class="input-group">
						<span class="input-group-addon">아이디</span>
						<input type="text" class="form-control" placeholder="아이디" id="user_id" name="user_id">
					</div>

					<div class="input-group">
						<span class="input-group-addon">비밀번호</span> 
						<input type="password" class="form-control" placeholder="비밀번호" id="user_password" name="user_password">
					</div>
					<br> 
					
					<a href="passwordForm.do">비밀번호 찾기</a>&nbsp;&nbsp;

					<div class="btn-group">
						<button type="submit" class="btn btn-default" placeholder="제목">로그인</button>
					</div>
				</div>
			</div>
		</div>
	</form>
</body>

<script type="text/javascript">
$(document).ready(function(){
	$('#id_alert').hide();
});
function UserIdCheck(){
	var i=0;
	var user_id = parseInt($('#user_id').val());
	//alert(user_id);
	var db_user_id = <%=user_id%>;
	db_user_id.toString();
	alert(db_user_id);
	for(i=0;i<db_user_id.length;i++){
		alert(db_user_id[0]);
		if(db_user_id[i]==user_id){
			return true;
		}
		else{
			$('#id_alert').show();
			return false;	
		}
	}		
};
</script>
</html>