<%@page import="kr.ac.apart.vo.BoardVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="static/js/bootstrap.js"></script>
<script src="static/js/jquery-1.11.1.js"></script>
<script src="static/js/bootstrap.min.js"></script>
<link href="static/css/bootstrap.min.css" rel="stylesheet" type="text/css">
<link href="static/css/style.css" rel="stylesheet" type="text/css">
<%
	BoardVO vo = (BoardVO) request.getAttribute("vo");
%>
</head>

<body>
	<div class="container">
		<div class="row row-offcanvas row-offcanvas-left">
			<!-- sidebar -->
			<div class="col-sm-3 sidebar-offcanvas" id="sidebar" role="navigation">
				<font size="4">
					<ul class="nav">
						<li class="active"><a href="noticeBoard.do">공지사항 게시판</a></li>
						<li><a href="complainBoard.do">민원 게시판</a></li>
						<li><a href="freeBoard.do">자유 게시판</a></li>
					</ul>
				</font>
			</div>

			<!-- main area -->
			<div class="col-sm-9">
				<form action="updateBoard.do">
					<br> 
					<input type="text" name="category" value="<%=vo.getCategory()%>">
					<br> 
					<input
						type="hidden" name="board_no" value=<%=vo.getBoard_no()%>>
					<input type="text" class="form-control title" name="title" value="<%=vo.getTitle()%>"> 
					<br>
					<textarea name="contents" rows="20" cols="135">
	        	<%=vo.getContents()%>
	      		</textarea>
					<br> 
					<br> 
					<input type="file" class="file" /> 
					<br>
					
					<div class="col-md-3 col-md-offset-9 ">
						<input type="checkbox" name="anonymous" class="checkbox inline" />
						<span class="text inline">익명</span> 
						<input type="checkbox"name="closed" class="checkbox inline" /> 
						<span class="text inline">비밀글</span>
						<button type="submit" class="btn btn-default inline">등록</button>
					</div>
				</form>
			</div>
			<!--/.row-->
		</div>
		<!--/.container-->
</body>
</html>