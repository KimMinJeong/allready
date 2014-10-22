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
<script src="static/js/jquery-1.11.1.js"></script>
<script src="static/js/bootstrap.js"></script>
<link href="static/css/bootstrap.css" rel="stylesheet" type="text/css">
<link href="static/css/style.css" rel="stylesheet" type="text/css">
<meta http-equiv="X-UA-Compatible" content="IE=Edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />

<title>Insert title here</title>
<%
	BoardVO board_vo = (BoardVO)request.getAttribute("vo");
	UserVO user_vo = (UserVO)session.getAttribute("UserFlag");
%>
</head>

<body>
	<div class="container">
		<div class="row row-offcanvas row-offcanvas-left">
			<!-- sidebar -->
			<div class="col-xs-6 col-sm-3 sidebar-offcanvas" id="sidebar" role="navigation">
				<ul class="nav">
					<li><a href="noticeBoard.do">공지사항 게시판</a></li>
					<li><a href="complainBoard.do">민원 게시판</a></li>
					<li><a href="freeBoard.do">자유 게시판</a></li>
				</ul>
			</div>

			<!-- main area -->
			<div class="col-xs-12 col-sm-9">
<%-- 				<% if(user_vo.getRole().equals("NORMAL") && "")  %> --%>
				<input type="button" class="btn btn-info btn-sm" value="글쓰기" onClick="location.href='boardWriteForm.do'">
				<% if("notice".equals(board_vo.getCategory())){%>
				<input type="button" class="btn btn-info btn-sm" id="board_list_btn" value="글목록" onClick="location.href='noticeBoard.do'">
				<%}else if("complain".equals(board_vo.getCategory())){ %>
					<input type="button" class="btn btn-info btn-sm" id="board_list_btn" value="글목록" onClick="location.href='complainBoard.do'">
				<%}else if("free".equals(board_vo.getCategory())){  %>
					<input type="button" class="btn btn-info btn-sm" id="board_list_btn" value="글목록" onClick="location.href='freeBoard.do'">
				<%} %>
				<hr id="hr_1">
				<p id="board_title"><%=board_vo.getTitle()%><p>
				<hr id="hr_2">
				<span id="board_span">글쓴이: <%=board_vo.getWriter_id()%></span>
				<span id="board_span">조회수: <%=board_vo.getView_count()%></span>
				<span id="board_span">추천수: <%=board_vo.getGood()%></span>
				<span id="board_span">마지막 수정날짜: <%=board_vo.getReg_date()%></span>
				<br>
				<br>
				<p id="board"><%=board_vo.getContents() %></p> <br>
						
				<%if(user_vo.getUser_id().equals(board_vo.getWriter_id())) {%>
				<div id="board_view_btn" align="right">
					<a href="UpdateForm.do?board_no=<%=board_vo.getBoard_no()%>">
					<button type="submit" class="btn btn-default navbar-btn">
						수정
					</button>
					</a>
					
					<a href="Delete.do?board_no=<%=board_vo.getBoard_no()%>">
					<button type="submit" class="btn btn-default navbar-btn">
						삭제
					</button>
					</a>
				</div>
				<%} %>
				<%
			if("complain".equals(board_vo.getCategory())){%>
				
					<div align="center">
					<div class="col-xs-12 col-sm-4">			
					<div class="col-xs-2 col-sm-2">
					<form action="addGood.do?board_no=<%=board_vo.getBoard_no()%>" >				
					<input type="hidden" name="good_id" value=<%=user_vo.getUser_id() %>>
					<input type="hidden" name="board_no" value=<%=board_vo.getBoard_no() %>>
					<input type="submit"  class="btn btn-default " value="<%=board_vo.getGood() %>">
					<span class="glyphicon glyphicon-thumbs-up"></span>
					</form>
					</div>
					
				
					
					<div class="col-xs-2 col-sm-2">							
					<form action="addBad.do?board_no=<%=board_vo.getBoard_no()%>" >				
					<input type="hidden" name="bad_id" value=<%=user_vo.getUser_id() %>>
					<input type="hidden" name="board_no" value=<%=board_vo.getBoard_no() %>>
					<input type="submit"  class="btn btn-default " value="<%=board_vo.getBad() %>">
					<span class="glyphicon glyphicon-thumbs-down"></span>
					</form>		
					</div></div></div>
				<%}%>
				<!-- Default panel contents -->
				<%
				
			if("free".equals(board_vo.getCategory())){%>
				<div class="container">
					<!-- main area -->
					<div class=" col-xs-3 col-sm-9">
						<div class="navbar-form navbar-center" role="search">
							<div class="form-group">
								<input type="hidden" class="form-control" placeholder="게시판넘버" size="5" id="comments_no"> &nbsp;&nbsp;&nbsp;&nbsp; 
								<input type="text" disabled="disabled" class="form-control" placeholder="작성이" size="5" id="writer_id" value="<%=user_vo.getUser_id()%>"> 
								<input type="text" class="form-control inline" placeholder="댓글을 입력해주세요." size="80" id="contents">
								<button type="button" class="btn btn-default inline" id="addComments" value=<%=board_vo.getBoard_no() %>>입력</button> <br><br>
								
								<!-- Table -->
								<div>
									<table class="table" id="visitRecordTable">
										<tr>
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
											<td><center><%=vc.getContents() %></center></td>
											<td><center><%=vc.getReg_date() %></center></td>

											<td>
											<%
												if(user_vo.getUser_id().equals(vc.getWriter_id())) {
											%>
											<center>
												<button type="button" class="btn btn-default deleteComments" value="<%=vc.getComments_no()%>">삭제</button>
											</center>
											<%} %>
											</td>
										</tr>
										<%}}}%>
									</table>
								</div>
								<%}%>
							</div>
						</div>
					</div>
					<!-- /.col-xs-12 main -->
				</div>
				<!--/.row-->
			</div>
			<!--/.container-->
			<br><br>
		</div>
	</div>
	<hr>
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
           			"<tr><td><center>" + data.writerId + "</center></td><td><center>" 
           			+ data.contents + "</center></td><td><center>"
           			/* + data.commentsRegDate + "</center></td><td><center><button type='button' class='btn btn-default'  value='" + data.recordNo +"'>" + '수정' + "</button></center></td></tr>" */
           			+ data.commentsRegDate + "</center></td><td><center><button type='button' class='btn btn-default deleteComments'  value='" + data.maxCommentNo +"'>" + '삭제' + "</button></center></td></tr>"
           	   ); 

              },
              error : function(e) {
                 alert("error");
        
              }

           }); 
        });  
     
$(document).on('click','.deleteComments', function(){         //삭제버튼 클릭시
    var clickedRow = $(this).closest('tr');              //클릭한 tr 가져오기
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

</script>
</html>