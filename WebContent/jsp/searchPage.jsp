<%@page import="kr.ac.apart.vo.UserVO"%>
<%@page import="kr.ac.apart.vo.BoardVO"%>
<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<script src="static/js/bootstrap.js"></script>
<script src="static/js/jquery-1.11.1.js"></script>
<script src="static/js/bootstrap.min.js"></script>
<link href="static/css/bootstrap.min.css" rel="stylesheet" type="text/css">
<link href="static/css/Style.css" rel="stylesheet" type="text/css">
<script src="static/js/jquery-1.11.1.js"></script>
<title>Insert title here</title>
</head>

<body>
	<div class="container">
		<div class="row row-offcanvas row-offcanvas-left">

			<!-- sidebar -->
			<div class="col-xs-6 col-sm-3 sidebar-offcanvas" id="sidebar" role="navigation">
				<font size="4">
					<ul class="nav">
						<li><a href="noticeBoard.do">공지사항 게시판</a></li>
						<li class="active"><a href="complainBoard.do">민원 게시판</a></li>
						<li><a href="freeBoard.do">자유 게시판</a></li>
					</ul>
				</font>
			</div> <br><br>

			<!-- main area -->
			<div class="col-xs-12 col-sm-9">
				<div class="panel panel-default">

					<!-- Default panel contents -->
					<div class="panel-heading">
						<center>공지사항 게시판</center>
					</div>

					<!-- Table -->
					<table class="table">
						<tr>
							<th><center>제목</center></th>
							<th><center>작성자</center></th>
							<th><center>날짜</center></th>
						</tr>
						<%
							List<BoardVO> BoardList = (List<BoardVO>) request.getAttribute("searchList");
							UserVO user_id = (UserVO) session.getAttribute("UserFlag");

							if (BoardList != null) {
								for (BoardVO vo : BoardList) {
									if ("CLOSED".equals(vo.getClosed())) {
										if (user_id.getUser_id().equals(vo.getWriter_id())) {
						%>
						<tr>
							<td><center><span class="glyphicon glyphicon-lock"></span><a href="boardDetail.do?board_no=<%=vo.getBoard_no()%>"><%=vo.getTitle()%></a></center></td>
							<%
								if ("ANONYMOUS".equals(vo.getAnonymous())) {
							%>
							<td><center>익명<center></td>
							<%
								} else {
							%>
							<td><center><%=vo.getWriter_id()%></center></td>
							<%
								}
							%>
							<td><center><%=vo.getReg_date()%></center></td>
						</tr>
						<%
							} else {
						%>
						<tr>
							<td colspan="3"><center>비밀글 입니다^3^</center></td>
						</tr>
						<%
							}
						} else {
						%>
						<tr>
							<td><center><a href="boardDetail.do?board_no=<%=vo.getBoard_no()%>"><%=vo.getTitle()%></a></center></td>
							<%
								if ("ANONYMOUS".equals(vo.getAnonymous())) {
							%>
							<td><center>익명</center></td>
							<%
								} else {
							%>
							<td><center><%=vo.getWriter_id()%></center></td>
							<%
								}
							%>
							<td><center><%=vo.getReg_date()%></center></td>
						</tr>
						<%
							}
								}
							}
						%>
					</table>
				</div>

				<div align="center">
					<ul class="pagination">
						<li><a href="#">&laquo;</a></li>
						<li><a href="#">1</a></li>
						<li><a href="#">2</a></li>
						<li><a href="#">3</a></li>
						<li><a href="#">4</a></li>
						<li><a href="#">5</a></li>
						<li><a href="#">&raquo;</a></li>
					</ul>
				</div>
				<%
					String category = (String)request.getAttribute("currentCategory");	
				%>
				<form action="search.do">
					<div class="form-group col-sm-2">
						<select class="form-control" name="condition">
							<option value="title">제목</option>
							<option value="contents">내용</option>
							<option value="writer_id">글쓴이</option>
						</select>
					</div>

					<div class="col-sm-8">
						<input type="text" class="form-control" name="str">
						<input type="text" class="form-control" name="category" value="<%=category%>">
					</div>

					<button type="submit" class="btn btn-default">검색</button>
				</form>	
			</div>
			<!-- /.col-xs-12 main -->
		</div>
		<!--/.row-->
</body>
</html>