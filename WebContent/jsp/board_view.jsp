<%@page import="kr.ac.apart.vo.BoardVO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<script src="static/js/bootstrap.js"></script>
<script src="static/js/jquery-1.11.1.js"></script>
<script src="static/js/bootstrap.min.js"></script>
<link  href="static/css/bootstrap.min.css" rel="stylesheet" type="text/css">
<script src="static/js/jquery-1.11.1.js"></script>
<title>Insert title here</title>

<%
	BoardVO vo = (BoardVO)request.getAttribute("vo");
%>

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
  	

        <!-- main area -->

        <div class="col-xs-12 col-sm-9">
        <form action = "#">
        <br>
        <center><h1><%=vo.getTitle() %></h1></center><br>
        <center><h1><%=vo.getWriter_id() %></h1></center><br>
        <textarea rows="20" cols="135">
			<%=vo.getContents() %>
		</textarea>
		<br><div align="right">
		<button type="submit" class="btn btn-default navbar-btn" ><a href="UpdateForm.do?board_no=<%=vo.getBoard_no()%>">수정</a></button></form>
		<button type="submit" class="btn btn-default navbar-btn" ><a href="Delete.do?board_no=<%=vo.getBoard_no()%>">삭제</a></button>
		</div>
          
        </div><!-- /.col-xs-12 main -->
    </div><!--/.row-->
  </div><!--/.container-->
</div><!--/.page-container-->


</body>

</html>