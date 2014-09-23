<%@page import="kr.ac.apart.vo.UserVO"%>
<%@page import="kr.ac.apart.vo.BoardVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="static/js/bootstrap.js"></script>
<script src="static/js/jquery-1.11.1.js"></script>
<script src="static/js/bootstrap.min.js"></script>
<link href="static/css/bootstrap.min.css" rel="stylesheet"
	type="text/css">
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
						<li class="active"><a href="noticeBoard.do">공지사항 게시판</a></li>
						<li><a href="complainBoard.do">민원 게시판</a></li>
						<li><a href="freeBoard.do">자유 게시판</a></li>
					</ul>
				</font>
			</div>

			<%
				UserVO userVO = (UserVO) session.getAttribute("UserFlag");
			%>
			<!-- main area -->
			<br><br>
			
			<div align="right">
					<%if("MANAGER".equals(userVO.getRole())){ %>
					<button type="button" class="btn btn-default navbar-btn" onClick="top.location.href='boardWriteForm.do'">글작성</button>
					<%} %>
				</div>

			<div class="col-xs-12 col-sm-9">
				<div class="panel panel-default">

					<!-- Default panel contents -->
					<div class="panel-heading">
						<center>공지사항 게시판</center>
					</div>

					<!-- Table -->
					<table class="table">
						<tr>
							<th>번호</th>
							<th>제목</th>
							<th>작성자</th>
							<th>날짜</th>
						</tr>
						<%
							List<BoardVO> BoardList = (List<BoardVO>) request.getAttribute("list");
							UserVO user_id = (UserVO) session.getAttribute("UserFlag");

							if (BoardList != null) {
								for (BoardVO vo : BoardList) {
									String anonymous = vo.getAnonymous();
									int board_no = vo.getBoard_no();
						%>
						<% if("CLOSED".equals(vo.getClosed())){ %>
						<% if(user_id.getUser_id().equals(vo.getWriter_id())){ %>
						<tr>
							<td><%=vo.getBoard_no() %></td>
							<td><span class="glyphicon glyphicon-lock"></span><a href="boardDetail.do?board_no=<%=board_no%>"><%=vo.getTitle() %></a></td>
							<%if("ANONYMOUS".equals(anonymous)){%>
							<td>익명</td>
							<%}else{ %>
							<td><%=vo.getWriter_id() %></td>
							<%}%>
							<td><%=vo.getReg_date() %></td>
						</tr>
						<%}else{%>
						<tr>
							<td colspan="4"><center>비밀글 입니다^3^</center></td>
						</tr>
						<%
							}
									} else {
						%>
						<tr>
							<td><%=vo.getBoard_no() %></td>
							<td></span><a href="boardDetail.do?board_no=<%=board_no%>"><%=vo.getTitle() %></a></td>
							<%if("ANONYMOUS".equals(anonymous)){%>
							<td>익명</td>
							<%}else{ %>
							<td><%=vo.getWriter_id() %></td>
							<%}%>
							<td><%=vo.getReg_date() %></td>
						</tr>
						<%}}}%>
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
				
				<div align="center">
					<form action="search.do">
						<div class="form-group">
							<select name="condition">
								<option value="title">title</option>
								<option value="contents">contents</option>
								<option value="writer_id">글쓴이</option>
							</select> <input type="text" class="form-control" name="str">
						</div>
						<button type="submit" class="btn btn-default">검색</button>
					</form>
				</div>
			</div>
			<!-- /.col-xs-12 main -->
		</div>
		<!--/.row-->
</body>
</html>