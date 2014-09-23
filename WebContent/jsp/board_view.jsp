<%@page import="kr.ac.apart.vo.CommentsVO"%>
<%@page import="java.util.List"%>
<%@page import="kr.ac.apart.vo.BoardVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="static/js/bootstrap.js"></script>
<script src="static/js/jquery-1.11.1.js"></script>
<link href="static/css/bootstrap.css" rel="stylesheet" type="text/css">


<%
	BoardVO vo = (BoardVO)request.getAttribute("vo");
	int board_no = vo.getBoard_no();
%>

</head>
<body>


	<div class="container">

		<div class="row row-offcanvas row-offcanvas-left">

			<!-- sidebar -->
			<div class="col-xs-6 col-sm-3 sidebar-offcanvas" id="sidebar"
				role="navigation">

				<font size="4">

					<ul class="nav">
						<li><a href="noticeBoard.do">공지사항 게시판</a></li>
						<li><a href="complainBoard.do">민원 게시판</a></li>
						<li><a href="freeBoard.do">자유 게시판</a></li>

					</ul>

				</font>
			</div>


			<!-- main area -->

			<div class="col-xs-12 col-sm-9">

				<br>
				<center>
					<h1><%=vo.getTitle() %></h1>
				</center>
				<br>
				<center>
					<h1><%=vo.getWriter_id() %></h1>
				</center>
				<br>
				<textarea rows="20" cols="135">
			<%=vo.getContents() %>
		</textarea>
				<br>
				<div align="right">
					<button type="submit" class="btn btn-default navbar-btn">
						<a href="UpdateForm.do?board_no=<%=vo.getBoard_no()%>">수정</a>
					</button>
					<button type="submit" class="btn btn-default navbar-btn">
						<a href="Delete.do?board_no=<%=vo.getBoard_no()%>">삭제</a>
					</button>
				</div>



				<!-- Default panel contents -->
				<%
			if("free".equals(vo.getCategory())){
				
			
		%>
				<div class="container">
					<!-- main area -->
					<div class=" col-xs-3 col-sm-9">
						<div class="navbar-form navbar-center" role="search">
							<div class="form-group">
								<input type="hidden" class="form-control" placeholder="게시판넘버"
									size="5" id="comments_no"> &nbsp;&nbsp;&nbsp;&nbsp; <input
									type="text" class="form-control" placeholder="작성이" size="5"
									id="writer_id" value="<%=vo.getWriter_id()%>">
								&nbsp;&nbsp;&nbsp;&nbsp; <input type="text"
									class="form-control inline" placeholder="댓글" size="88"
									id="contents">
								<button type="button" class="btn btn-default inline"
									id="addComments" name="addComments">입력</button>
								<br>
								<br>


								<!-- Table -->
								<div>
									<table class="table" id="visitRecordTable">
										<tr>
											<th><center>번호</center></th>
											<th><center>작성이</center></th>
											<th><center>댓글</center></th>
											<th><center>날짜</center></th>
											<th><center>수정/삭제</center></th>
										</tr>
										<tr id="add">

											<% List<CommentsVO> comments = (List<CommentsVO>)request.getAttribute("commentsList");             
           
                  if(comments != null){
                  for(CommentsVO vc : comments){
                 	if(vc.getBoard_no() == vo.getBoard_no()){
                 		
                 
                 %>
										</tr>
										<tr>
											<td><center><%=vc.getComments_no() %></center></td>
											<td><center><%=vc.getWriter_id()%></center></td>
											<td><center><%=vc.getContents() %></center></td>
											<td><center><%=vc.getReg_date() %></center></td>
											<td><center>
													<button type="button"
														class="btn btn-default deleteVisitRecord" value="">삭제</button>
												</center></td>
										</tr>
										<%}}} %>
									</table>
								</div>
								<%} %>
							</div>
						</div>
					</div>
				</div>

			</div>
			<!-- /.col-xs-12 main -->
		</div>
		<!--/.row-->
	</div>
	<!--/.container-->



</body>

<script type="text/javascript">
$(document).ready(function(){
$("#addComments").click(function() {
		alert(board_no);
           $.ajax({
              url : "addComments.do",
              type : "get",
              dataType : "json",
              data : {
            	  board_no : board_no,
            	  writer_id : $("#writer_id").val(),
            	  contents : $("#contents").val()
              },
              contentType : "application/json; charset=utf-8",
              success : function(data) {
           	   alert("success");
             
                 $("#add").after(
                       //append는 선택자의 자식한테 붙고 after는 같은 레벨의 형제.
                       "<tr><td><center>" + data.add.writer_id
                             + "</center></td><td><center>"
                             + data.add.contents
                             + "</center></td><td><center>" + data.add.reg_date
              //             + "</center></td><td><center><button type='button' class='btn btn-default'  value='" + data.recordNo +"'>" + '수정' + "</button>" + '  ' + "<button type='button' class='btn btn-default deleteVisitRecord' value='"+data.recordNo+"'>" + '삭제' + "</button>
                             +"</center></td></tr>");
              },
              error : function(e) {
                 alert("error");
        
              }

           });
        });
});
</script>

</html>