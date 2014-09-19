<%@page import="kr.ac.apart.vo.UserVO"%>
<%@page import="kr.ac.apart.vo.BoardVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="static/js/bootstrap.js"></script>
<script src="static/js/jquery-1.11.1.js"></script>
<script src="static/js/bootstrap.min.js"></script>
<script src="static/js/summernote.js"></script>

<link href="static/css/bootstrap.min.css" rel="stylesheet" type="text/css">
<link href="static/css/style.css" rel="stylesheet" type="text/css">
<link href="static/css/summernote.css" rel="stylesheet" type="text/css">
<link href="static/css/summernote-bs2.css" rel="stylesheet" type="text/css">
<link href="static/css/summernote-bs3.css" rel="stylesheet" type="text/css">

<%
	UserVO LoginInfo = (UserVO) session.getAttribute("UserFlag");
%>
</head>

<body>
	<div class="container">
		<div class="row row-offcanvas row-offcanvas-left">
			<!-- sidebar -->
			<div class="col-sm-3 sidebar-offcanvas" id="sidebar" role="navigation">
				<ul class="nav">
					<li><a href="noticeBoard.do">공지사항 게시판</a></li>
					<li class="active"><a href="complainBoard.do">민원 게시판</a></li>
					<li><a href="freeBoard.do">자유 게시판</a></li>
				</ul>
			</div>

			<!-- main area -->
			<form action="boardAdd.do">
				<div class="col-sm-9">
					<select name="category">
						<option value="notice">공지사항</option>
						<option value="complain">민원</option>
						<option value="free">자유</option>
					</select>
					<input type="hidden" name="writer_id" value="<%=LoginInfo.getUser_id()%>"> <br>
					<br>
					<input type="text" class="form-control title" name="title">
					<br>
					<div id="summernote"> </div>
					<br><br>
					<input type="file" class="file" />
					<br>
					<div class="col-md-3 col-md-offset-9">
						<input type="checkbox" name="anonymous" class="checkbox inline" value="ANONYMOUS" /> <span class="text inline">익명</span> 
						<input type="checkbox" name="closed" class="checkbox inline" value="CLOSED" /> <span class="text inline">비밀글</span>
						<button type="submit" class="btn btn-default inline">등록</button>
					</div>
				</div>
			</form>
		</div>
	</div>
	<!--/.row-->
</body>

<script type="text/javascript">
	$(document).ready(function() {
	  $('#summernote').summernote({
		  height :300,
		  focus : true
	  });
	});
</script>

</html>