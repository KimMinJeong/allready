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
				<ul class="nav">
					<li class="active"><a href="noticeBoard.do">공지사항 게시판</a></li>
					<li><a href="complainBoard.do">민원 게시판</a></li>
					<li><a href="freeBoard.do">자유 게시판</a></li>
				</ul>
			</div>

			<!-- main area -->
			<div class="col-sm-9">
				<form action="updateBoard.do">
					<input type="hidden" name="board_no" value=<%=vo.getBoard_no()%>>
					<select disabled class="form-control">
						<option value="<%=vo.getCategory()%>"><%=vo.getCategory()%></option>
					</select><br><br><input type="text" class="form-control title"
						id="board_title" name="title" value="<%=vo.getTitle()%>">
					<br>
					<script type="text/javascript"
						src="http://js.nicedit.com/nicEdit-latest.js"></script>
					<script type="text/javascript">
						//<![CDATA[
						bkLib.onDomLoaded(function() {
							nicEditors.allTextAreas()
						});
						//]]>
					</script>
					<textarea name="contents" rows="15%" id="board_textarea"><%=vo.getContents()%></textarea>
					<br> <br>

					<div class="col-md-4 col-md-offset-8" id="board_modify_btn">
						<input type="checkbox" name="anonymous" class="checkbox inline" />
						<span class="text inline" id="anonymous_select">익명</span> <input
							type="checkbox" name="closed" class="checkbox inline" /> <span
							class="text inline" id="secret_select">비밀글</span>
						<button type="submit" class="btn btn-primary inline">등록</button>
					</div>
				</form>
			</div>
			<!--/.row-->
		</div>
		<!--/.container-->
		<hr>
</body>

<script type="text/javascript">
	var select_var=$('select option').val();
	if(select_var=='free'){
		alert($('select option').val());
		select_var ='자유';
	}
</script>
</html>