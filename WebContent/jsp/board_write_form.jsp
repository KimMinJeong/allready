<%@page import="kr.ac.apart.vo.UserVO"%>
<%@page import="kr.ac.apart.vo.BoardVO"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="static/js/jquery-1.11.1.js"></script>
<script src="static/js/bootstrap.js"></script>
<link href="static/css/bootstrap.css" rel="stylesheet" type="text/css">
<link href="static/css/style.css" rel="stylesheet" type="text/css">
<%
	UserVO LoginInfo = (UserVO) session.getAttribute("UserFlag");
%>
</head>

<body>
	<div class="container">
		<div class="row row-offcanvas row-offcanvas-left">
		
			<!-- sidebar -->
			<div class="col-sm-3 sidebar-offcanvas" id="sidebar" role="navigation">
				<ul class="nav">
					<li><a href="noticeBoard.do">공지사항 게시판</a></li>
					<li class="active"><a href="complainBoard.do">민원 게시판</a></li>
					<li><a href="freeBoard.do">자유 게시판</a></li>
				</ul>
			</div>

			<!-- main area -->
			<div class="col-sm-9"> <br>
				<form action="boardAdd.do">
					<select name="category" id="select" class="form-control">
						<%
							if ("MANAGER".equals(LoginInfo.getRole())){
						%>
							<option name="notice" value="notice" id="notice_option">공지사항</option>
						<%
							} else if ("NORMAL".equals(LoginInfo.getRole())){
						%>
							<option name="complain" value="complain" >민원</option>
							<option name="free" value="free" >자유</option>
						<%
							}
						%>
					</select>
					 
					<input type="hidden" name="writer_id" value="<%=LoginInfo.getUser_id()%>"> <br><br> 
					<input type="text" id="board_title" class="form-control title" name="title"> <br>
					 <script type="text/javascript" src="http://js.nicedit.com/nicEdit-latest.js"></script>
					 <script type="text/javascript">
					//<![CDATA[
					        bkLib.onDomLoaded(function() { nicEditors.allTextAreas() });
					  //]]>
					  </script>
					<textarea class="textarea" id="board_textarea" name="contents"> </textarea> <br><br> 

					<div class="col-md-3 col-md-offset-9 ">
						<input type="checkbox" name="anonymous" class="checkbox inline" value="ANONYMOUS" /> 
						<span class="text inline">익명</span> 
						
						<input type="checkbox" name="closed" class="checkbox inline" value="CLOSED" /> 
						<span class="text inline">비밀글</span>
						
						<button type="submit" class="btn btn-default inline">등록</button>
				</form>
			</div>
		</div>
	</div>
	<!--/.row-->
	</div>
	<hr>
	<!--/.container-->
</body>

<script type="text/javascript">
if($('ul li:nth-child(3)').find('ative')){
	("#select option:nth-child(3) option:selected");
}
</script>
</html>