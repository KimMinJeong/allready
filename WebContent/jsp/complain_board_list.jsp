<%@page import="kr.ac.apart.vo.UserVO"%>
<%@page import="kr.ac.apart.vo.BoardVO"%>
<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
<link rel="stylesheet" type="text/css" href="style.css" media="only and (min-width: 360px) and (max-width: 768px)" id="stylesheet-768" />
<link rel="stylesheet" type="text/css" href="style.css" media="only and (min-width: 768px)" id="stylesheet-1200" />

<title>민원 게시판</title>
</head>
<body>
	<div class="container font-style">
		<div class="row row-offcanvas row-offcanvas-left">
			<!-- sidebar -->
			<div class="col-xs-6 col-md-3 sidebar-offcanvas" id="sidebar" role="navigation">
				<ul class="nav">
					<li class="active"><a href="noticeBoard.do"><font face="'Jeju Gothic', serif" size="4">공지사항</font></a></li>
					<li><a href="complainBoard.do"><font face="'Jeju Gothic', serif" size="4">민원사항</font></a></li>
					<li><a href="freeBoard.do"><font face="'Jeju Gothic', serif" size="4">자유자유</font></a></li>
				</ul>
			</div>
			<%
				UserVO userVO = (UserVO) session.getAttribute("UserFlag");
			%>

			<!-- main area -->
			<div class="col-xs-12 col-md-10"> <br>
				<div align="right">
					<%
						if ("NORMAL".equals(userVO.getRole())) {   //로그인한 사용자의 role이 normal일경우
					%>
					<button type="button" class="btn button-style navbar-btn" onClick="top.location.href='boardWriteForm.do?category=complain'">글작성</button>
					<%
						}
					%>
				</div>

				<div class="panel panel-default">
					

					<!-- Table -->
					
					<table class="table table-bordered table-style">
						<thead class="head">
						<tr>
							<th><center>번호</center></th>
							<th><center>제목</center></th>
							<th><center>작성자</center></th>
							<th><center>날짜</center></th>
							<th><center>조회수</center></th>
						</tr>
						</thead>
						<%
							int currentPage = (Integer) request.getAttribute("page");  //현재page, 기본값은 0
							int countComplainBoard = (Integer) request.getAttribute("rowNum");  //현재 complainboard의 row수
							
							List<BoardVO> BoardList = (List<BoardVO>) request.getAttribute("list");
							UserVO user_id = (UserVO) session.getAttribute("UserFlag");
							int rowNum = (Integer) request.getAttribute("rowNum") + 1 - currentPage;
							
							for (BoardVO vo : BoardList) {
								rowNum--;
								if ("CLOSED".equals(vo.getClosed())) {
									if (user_id.getUser_id().equals(vo.getWriter_id())) {
						%>
						<tbody id="tbody">
						<tr>
							<td><center><%=rowNum%></center></td>
							<td><center><span class="glyphicon glyphicon-lock"></span> 
							<a href="boardDetail.do?board_no=<%=vo.getBoard_no()%>&count_id=<%=userVO.getUser_id()%>"><%=vo.getTitle()%></a></center></td>
							<%
								if ("ANONUMOUS".equals(vo.getAnonymous())) {
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
							<td><center><%=vo.getView_count()%></center></td>
						</tr>
						<%
							} else {
						%>
						<tr>
							<td><center><%=rowNum%></center></td>
							<td><center>비밀글 입니다^3^</center></td>
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
							<td><center><%=vo.getView_count()%></center></td>
						</tr>
						<%
							}
								} else {
						%>
						<tr>
							<td><center><%=rowNum%></center></td>
							<td><center><a href="boardDetail.do?board_no=<%=vo.getBoard_no()%>&count_id=<%=userVO.getUser_id()%>"><%=vo.getTitle()%></a></center></td>
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
							<td><center><%=vo.getView_count()%></center></td>
						</tr>
						<%
							}
							}
							if(countComplainBoard == 0){%>
								<tbody id="tbody"><tr><td colspan="5"><center>게시글이 없습니다.</center></td></tr></tbody>
							<%}
						%>
						</tbody>
					</table>
				</div>
				
				<%if(countComplainBoard != 0){ %>
				<div align="center">
					<ul class="pagination">
						<li><a href="noticeBoard.do">&laquo;</a></li>
						<%
							int j = 1; //페이지수
							int a = 0; //마지막페이지
							for (int i = 0; i < countComplainBoard; i += 10) {
						%>
						<li><a href="complainBoard.do?page=<%=i%>"><%=j%></a></li>
						<%
							j++;
								a = i;
							}
						%>
						<li><a href="complainBoard.do?page=<%=a%>">&raquo;</a></li>
					</ul>
				</div>
				<%} %>

				<form action="search.do">
					<div class="form-group col-sm-2">
						<select class="form-control input-style" name="condition">
							<option value="title">제목</option>
							<option value="contents">내용</option>
							<option value="writer_id">글쓴이</option>
						</select>
					</div>

					<div class="col-xs-12 col-md-8">
						<input type="text" class="form-control input-text-style" name="str">
						<input type="hidden" class="form-control" name="category" value="complain">
					</div>

					<button type="submit" class="btn button-style">검색</button>
				</form>
			</div>
			<!-- /.col-xs-12 main -->
		</div>
		<!--/.row-->
	</div>
	<!--/.container-->
	</div>
	<!--/.page-container-->
	<hr>
</body>
</html>