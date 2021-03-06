<%@page import="kr.ac.apart.vo.FlagVO"%>
<%@page import="kr.ac.apart.vo.UserVO"%>
<%@page import="kr.ac.apart.vo.CommentsVO"%>
<%@page import="java.util.*"%>
<%@page import="kr.ac.apart.vo.BoardVO"%>
<%@page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<meta http-equiv="X-UA-Compatible" content="IE=Edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<script src="static/js/jquery-1.11.1.js"></script>
<script src="static/js/bootstrap.js"></script>
<link href="static/css/bootstrap.css" rel="stylesheet" type="text/css">
<link href="static/css/style.css" rel="stylesheet" type="text/css">
<<link rel="stylesheet" type="text/css" href="style.css" media="only and (min-width: 300px) and (max-width: 768px)" id="stylesheet-768" />
<link rel="stylesheet" type="text/css" href="style.css" media="only and (min-width: 768px)" id="stylesheet-1200" />

<title>Insert title here</title>
<%
	BoardVO board_vo = (BoardVO)request.getAttribute("vo");
	UserVO user_vo = (UserVO)session.getAttribute("UserFlag");
%>
</head>

<body>
	<div class="container font-style">
		<div class="row row-offcanvas row-offcanvas-left">
			<!-- sidebar -->
			<div class="col-xs-6 col-md-3 sidebar-offcanvas board_sidebar" id="sidebar" role="navigation">
				<ul class="nav">
					<li><a href="noticeBoard.do">공지 게시판</a></li>
					<li><a href="complainBoard.do">민원 게시판</a></li>
					<li><a href="freeBoard.do">자유 게시판</a></li>
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

			<!-- main area -->
			<div class="col-xs-12 col-md-9">
				
			
				<%
					if("notice".equals(board_vo.getCategory())){
						if("MANAGER".equals(user_vo.getRole())){
							
				%>
				<input type="button" class="btn btn-info btn-sm button-delete-style" id="board_write_btn" value="글쓰기" onClick="location.href='boardWriteForm.do?category=<%=board_vo.getCategory()%>'">
						
				<%
						}
				%>
						<input type="button" class="btn btn-info btn-sm button-style" id="board_list_btn2" value="글목록" onClick="location.href='noticeBoard.do'">
				<%
					}else if("complain".equals(board_vo.getCategory())){
				%>		<input type="button" class="btn btn-info btn-sm button-delete-style" id="board_write_btn" value="글쓰기" onClick="location.href='boardWriteForm.do?category=<%=board_vo.getCategory()%>'">
						<input type="button" class="btn btn-info btn-sm button-style" id="board_list_btn" value="글목록" onClick="location.href='complainBoard.do'">
				<%
					}else if("free".equals(board_vo.getCategory())){
				%>
						<input type="button" class="btn btn-info btn-sm button-delete-style" id="board_write_btn" value="글쓰기" onClick="location.href='boardWriteForm.do?category=<%=board_vo.getCategory()%>'">
						<input type="button" class="btn btn-info btn-sm button-style" id="board_list_btn" value="글목록" onClick="location.href='freeBoard.do'">
				<%
					}
				%>
				<hr id="hr_1">
				<p id="board_title"><%=board_vo.getTitle()%>
				<p>
				<hr id="hr_2">
				<span id="board_span">글쓴이: <%=board_vo.getWriter_id()%></span> 
				<span id="board_span">조회수: <%=board_vo.getView_count()%></span>
				<%if("complain".equals(board_vo.getCategory())){ %> 
				<span id="board_span">추천수: <%=board_vo.getGood()%></span>
				<%} %> 
				<span id="board_span">마지막 수정날짜: <%=board_vo.getReg_date()%></span> <br><br>
				
				<p id="board"><%=board_vo.getContents()%></p> <br>
				<%
					if(user_vo.getUser_id().equals(board_vo.getWriter_id())) {
				%>
				<div id="board_view_btn" align="right">
					<a href="UpdateForm.do?board_no=<%=board_vo.getBoard_no()%>">
						<button type="button" class="btn navbar-btn button-style">수정</button>
					</a> 
					
					<a href="deleteBoard.do?board_no=<%=board_vo.getBoard_no()%>&board_category=<%=board_vo.getCategory()%>">
						<button type="button" class="btn navbar-btn button-delete-style" id="deleteButton">삭제</button>
					</a> 
				</div>
				<%
					}
					if("complain".equals(board_vo.getCategory())){
				%>
		<div align="center">
               <div class="col-xs-12 col-sm-9">
                  <div class="col-xs-4 col-sm-2 margin7">
                        <a href="addGood.do?board_no=<%=board_vo.getBoard_no()%>&good_id=<%=user_vo.getUser_id() %>">
                        <image class="img-circle img-responsive img-center margin4" src="static/images/1414167353_699566-icon-4-thumb-up-64.png"></image>
                        <input type="button" class="btn btn-default" value="<%=board_vo.getGood()%>"> 
                        </a>
                  </div>

                  <div class="col-xs-4 col-sm-2">
                        <a href="addBad.do?board_no=<%=board_vo.getBoard_no()%>&bad_id=<%=user_vo.getUser_id() %>">
                        <image class="img-circle img-responsive img-center margin4" src="static/images/1414167589_699991-icon-5-thumb-down-64.png"></image>
                        <input type="submit" class="btn btn-default " value="<%=board_vo.getBad()%>"> 
                        </a>
                  </div>
               </div>
            </div>
				<%
					}
				%>
				<!-- Default panel contents -->
				<%
					if("free".equals(board_vo.getCategory())){
				%>
				<div class="container">
				
					<!-- main area -->
					<div class=" col-xs-12 col-md-9">
						<div class="navbar-form navbar-center" role="search">
							<div class="form-group">
								<input type="hidden" class="form-control" placeholder="게시판넘버" size="5" id="comments_no"> &nbsp;&nbsp;&nbsp;&nbsp; 
									<input type="text" disabled="disabled" class="form-control" placeholder="작성이" size="5" id="writer_id" value="<%=user_vo.getUser_id()%>"> 
									<input type="text" class="form-control inline" placeholder="댓글을 입력해주세요." size="80" id="contents">
								
								<button type="button" class="btn button-style inline" id="addComments" value=<%=board_vo.getBoard_no()%>>입력</button> <br><br>

								<!-- Table -->
								<div>
									<table class="table" id="visitRecordTable">
										<tr class="head">
											<th><center>작성이</center></th>
											<th><center>댓글</center></th>
											<th><center>날짜</center></th>
											<th><center>수정/삭제</center></th>
										</tr>
										
										<tr id="commentsTable">
											<%
												List<CommentsVO> comments = (List<CommentsVO>) request.getAttribute("commentsList");

												if (comments != null) {
													for (CommentsVO vc : comments) {
														if (vc.getBoard_no() == board_vo.getBoard_no()) {
											%>
										</tr>
										
										<tr>
											<td><center><%=vc.getWriter_id()%></center></td>
											<td><center><%=vc.getContents()%></center></td>
											<td><center><%=vc.getReg_date()%></center></td>
											<td>
												<%
													if(user_vo.getUser_id().equals(vc.getWriter_id())) {
												%>
												<center>
													<button type="button" class="btn button-delete-style deleteComments" value="<%=vc.getComments_no()%>">삭제</button>
												</center> 
												<%
													}
 												%>
											</td>
										</tr>
										<%
												}
											}
										}
										%>
									</table>
								</div>
								<%
									}
								%>
							</div>
						</div>
					</div>
					<!-- /.col-xs-12 main -->
				</div>
				<!--/.row-->
			</div>
			<!--/.container-->
			<br> <br>
		</div>
	</div>
</body>

<script type="text/javascript">
	$("#addComments").click(function() {
		$.ajax({
			url : "addComments.do",
			type : "get",
			dataType : "json",
			data : {
				board_no : $("#addComments").val(),
				writer_id : $("#writer_id").val(),
				contents : $("#contents").val()
			},
			contentType : "application/json; charset=utf-8",
			success : function(data) {
				$("#commentsTable").after(
					"<tr><td><center>" + data.writerId
					+ "</center></td><td><center>"+ data.contents
					+ "</center></td><td><center>"/* + data.commentsRegDate + "</center></td><td><center><button type='button' class='btn btn-default'  value='" + data.recordNo +"'>" + '수정' + "</button></center></td></tr>" */
					+ data.commentsRegDate
					+ "</center></td><td><center><button type='button' class='btn btn-default deleteComments'  value='" + data.maxCommentNo +"'>"
					+ '삭제'
					+ "</button></center></td></tr>");
			},
			error : function(e) {
				alert("error");
			}
		});
	});

	$(document).on('click', '.deleteComments', function() { //삭제버튼 클릭시
		var clickedRow = $(this).closest('tr'); //클릭한 tr 가져오기
		$.ajax({
			url : "deleteComments.do",
			type : "get",
			dataType : "json",
			data : {
				commentsNo : $(this).closest('button').attr('value'),
			},
			contentType : "application/json; charset=utf-8",
			success : function(data) {
				clickedRow.remove();
			},
			error : function(e) {
				alert("error!");
			}
		});
	});
	

	$("#deleteButton").on('click', function(){
		againCheck = confirm("정말 삭제하시겠습니까?");
		if(againCheck == true)
		{
			document.form.submit();
		}else
			return false;
	});
</script>
</html>