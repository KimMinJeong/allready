<%@page import="kr.ac.apart.vo.UserVO"%>
<%@page import="kr.ac.apart.vo.BoardVO"%>
<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=Edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<script src="static/js/jquery-1.11.1.js"></script>
<script src="static/js/bootstrap.js"></script>
<link href="static/css/bootstrap.css" rel="stylesheet" type="text/css">
<link href="static/css/style.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css" href="style.css" media="only and (min-width: 300px) and (max-width: 768px)" id="stylesheet-768" />
<link rel="stylesheet" type="text/css" href="style.css" media="only and (min-width: 768px)" id="stylesheet-1200" />
<title>Insert title here</title>
</head>

<body>
	<div class="container font-style">
		<div class="row row-offcanvas row-offcanvas-left">

			<!-- sidebar -->
			<div class="col-xs-6 col-md-3 sidebar-offcanvas board_sidebar" id="sidebar" role="navigation">
				<ul class="nav">
					<li><a href="noticeBoard.do">공지사항 게시판</a></li>
					<li><a href="complainBoard.do">민원 게시판</a></li>
					<li class="active"><a href="freeBoard.do">자유 게시판</a></li>
				</ul>
			</div> 
			<div class="col-xs-12 col-md-3" id="mobile_board_bar">
				<div class="navbar-form navbar-left" role="search">
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				  <a href="noticeBoard.do">공지게시판</a>&nbsp;&nbsp;&nbsp;&nbsp;
				  <a href="complainBoard.do">민원게시판</a>&nbsp;&nbsp;&nbsp;&nbsp;
				  <a href="freeBoard.do">자유게시판</a>&nbsp;&nbsp;
				</div>
			</div>
			
			<%
				String condition = (String) request.getAttribute("condition");
				String str = (String) request.getAttribute("str");
				String category = (String) request.getAttribute("category");
			%>
			<!-- main area -->
			<div class="col-xs-12 col-md-9">
				<div class="panel panel-default">

					<!-- Table -->
					<table class="table table-bordered table-style">
						<tr class="head">
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
						<tr id="body">
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
							if(BoardList.size() == 0){ %>
								<tr><td colspan="3"><center>일치하는 검색결과가 없습니다</center></td></tr>
						<%	} %>
					</table>
				</div>
				
				<%
					int currentPage = (Integer) request.getAttribute("page");
					List<BoardVO> allSearchList = (List<BoardVO>) request.getAttribute("allSearchList");
					
					if(allSearchList.size() != 0){
				%>
				<div align="center">
					<ul class="pagination">
						<li><a href="search.do?page=0&condition=<%=condition%>&str=<%=str%>&category=<%=category%>">&laquo;</a></li>
						<%
						int j=1;  //페이지수
						int a=0;  //마지막페이지
						for(int i=0; i<allSearchList.size(); i+=10){%>
							<li><a href="search.do?page=<%=i%>&condition=<%=condition%>&str=<%=str%>&category=<%=category%>"><%=j%></a></li>
						<%
							j++;
							a=i;
						}%>
						<li><a href="search.do?page=<%=a%>&condition=<%=condition%>&str=<%=str%>&category=<%=category%>">&raquo;</a></li>
					</ul>
				</div>
				<% } %>
				
				<form action="search.do">
					<div class="form-group col-xs-12 col-md-2">
						<select class="form-control input-style" name="condition">
							<option value="title">제목</option>
							<option value="contents">내용</option>
							<option value="writer_id">글쓴이</option>
						</select>
					</div>

					<div class="col-xs-12 col-md-8">
						<input type="text" class="form-control input-text-style" name="str">
						<input type="hidden" class="form-control" name="category" value="<%=category%>">
					</div>

					<button type="submit" class="btn button-style" id="board_btn">검색</button>
				</form>	
			</div>
			<!-- /.col-xs-12 main -->
		</div>
		</div>
		<!--/.row-->
		<hr>
</body>
</html>