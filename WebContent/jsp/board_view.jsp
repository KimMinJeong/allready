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
<script src="static/js/bootstrap.js"></script>
<script src="static/js/jquery-1.11.1.js"></script>
<script src="static/js/bootstrap.min.js"></script>
<link href="static/css/bootstrap.min.css" rel="stylesheet" type="text/css">
<script src="static/js/jquery-1.11.1.js"></script>
<title>Insert title here</title>
<%
	BoardVO vo = (BoardVO)request.getAttribute("vo");
	UserVO vo2 = (UserVO)session.getAttribute("UserFlag");
 
	
%>
</head>

<body>
	<div class="container">
		<div class="row row-offcanvas row-offcanvas-left">

			<!-- sidebar -->
			<div class="col-xs-6 col-sm-3 sidebar-offcanvas" id="sidebar" role="navigation">
				<font size="4">
					<ul class="nav">
						<li><a href="noticeBoard.do">공지사항 게시판</a></li>
						<li><a href="complainBoard.do">민원 게시판</a></li>
						<li><a href="freeBoard.do">자유 게시판</a></li>
					</ul>
				</font>
			</div>

			<!-- main area -->
			<div class="col-xs-12 col-sm-9"> <br>
				<center><h1><%=vo.getTitle() %></h1></center> <br>
				<center><h1>글쓴이:<%=vo.getWriter_id() %></h1></center> <br>
				<% if("notice".equals(vo.getCategory())){%>
				<div align="right">
					<input type="button" class="btn btn-default navbar-btn" value="글목록" onClick="location.href='noticeBoard.do'">
				</div>
				<%}else if("complain".equals(vo.getCategory())){ %>
				<div align="right">
					<input type="button" class="btn btn-default navbar-btn" value="글목록" onClick="location.href='complainBoard.do'">
				</div>
				<%}else if("free".equals(vo.getCategory())){  %>
				<div align="right">
					<input type="button" class="btn btn-default navbar-btn" value="글목록" onClick="location.href='freeBoard.do'">
				</div><%} %>
				<textarea rows="20" cols="120"><%=vo.getContents() %></textarea> <br>
						
				<%if(vo2.getUser_id().equals(vo.getWriter_id())) {%>
				<div align="right">
					<a href="UpdateForm.do?board_no=<%=vo.getBoard_no()%>">
					<button type="submit" class="btn btn-default navbar-btn">
						수정
					</button>
					</a>
					
					<a href="Delete.do?board_no=<%=vo.getBoard_no()%>">
					<button type="submit" class="btn btn-default navbar-btn">
						삭제
					</button>
					</a>
				</div>
				<%} %>
				<%
			if("complain".equals(vo.getCategory())){%>
				
					<div align="center">
					<div class="col-xs-12 col-sm-4">			
					<div class="col-xs-2 col-sm-2">
					<form action="addGood.do?board_no=<%=vo.getBoard_no()%>" >				
					<input type="hidden" name="good_id" value=<%=vo2.getUser_id() %>>
					<input type="hidden" name="board_no" value=<%=vo.getBoard_no() %>>
					<input type="submit"  class="btn btn-default " value="<%=vo.getGood() %>">
					<span class="glyphicon glyphicon-thumbs-up"></span>
					</form>
					</div>
					
				
					
					<div class="col-xs-2 col-sm-2">							
					<form action="addBad.do?board_no=<%=vo.getBoard_no()%>" >				
					<input type="hidden" name="bad_id" value=<%=vo2.getUser_id() %>>
					<input type="hidden" name="board_no" value=<%=vo.getBoard_no() %>>
					<input type="submit"  class="btn btn-default " value="<%=vo.getBad() %>">
					<span class="glyphicon glyphicon-thumbs-down"></span>
					</form>		
					</div></div></div>
				
				
		
				<%}%>

				<!-- Default panel contents -->
				<%
			if("free".equals(vo.getCategory())){%>
				<div class="container">
					<!-- main area -->
					<div class=" col-xs-3 col-sm-9">
						<div class="navbar-form navbar-center" role="search">
							<div class="form-group">
								<input type="hidden" class="form-control" placeholder="게시판넘버" size="5" id="comments_no"> &nbsp;&nbsp;&nbsp;&nbsp; 
								<input type="text" class="form-control" placeholder="작성이" size="5" id="writer_id" value="<%=vo2.getUser_id()%>"> 
								<input type="text" class="form-control inline" placeholder="댓글을 입력해주세요." size="80" id="contents">
								<button type="button" class="btn btn-default inline" id="addComments" value=<%=vo.getBoard_no() %>>입력</button> <br><br>
								
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
															if (vc.getBoard_no() == vo.getBoard_no()) {
											%>
										</tr>
										<tr>
											<td><center><%=vc.getWriter_id()%></center></td>
											<td><center><%=vc.getContents() %></center></td>
											<td><center><%=vc.getReg_date() %></center></td>

											<td><%
												if(vo2.getUser_id().equals(vc.getWriter_id())) {
											%>
												<center>
													<button type="button" class="btn btn-default deleteComments" value="<%=vc.getComments_no()%>">삭제</button>
												</center> <%} %>
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