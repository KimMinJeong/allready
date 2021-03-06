<%@page import="kr.ac.apart.vo.UserVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=Edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<script src="static/js/jquery-1.11.1.js"></script>
<script src="static/js/bootstrap.js"></script>
<link href="static/css/bootstrap.css" rel="stylesheet" type="text/css">
<link href="static/css/style.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css" href="style.css" media="only and (min-width: 300px) and (max-width: 768px)" id="stylesheet-768" />
<link rel="stylesheet" type="text/css" href="style.css" media="only and (min-width: 768px)" id="stylesheet-1200" />
</head>
<% UserVO user_vo = (UserVO)session.getAttribute("UserFlag"); %>
<body>
	<div class="container font-style">
	<div class="col-xs-12 col-md-10">
		<iframe src="http://localhost:3000?userId=<%=user_vo.getUser_id()%>" id="chatting"></iframe>
		<!-- 자신이 연결한 ip주소를 넣어주셔야 합니다.(cmd창에서 ipconfig ->ip4확인 하여 넣어주세요!)  -->
	</div>
	</div>
</body>
</html>