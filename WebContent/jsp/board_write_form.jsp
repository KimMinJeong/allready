<%@page import="kr.ac.apart.vo.UserVO"%>
<%@page import="kr.ac.apart.vo.BoardVO"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
<link rel="stylesheet" type="text/css" href="style.css" media="only and min-width: 560px) and (max-width: 768px)" id="stylesheet-768" />
<link rel="stylesheet" type="text/css" href="style.css" media="only and (min-width: 768px) and (max-device-width: 1200px)" id="stylesheet-1200" />


<%
	UserVO LoginInfo = (UserVO) session.getAttribute("UserFlag");
%>
</head>

<body>
	<div class="container font-style">
		<div class="row row-offcanvas row-offcanvas-left">

			<!-- sidebar -->
			<div class="col-xs-6 col-md-3 sidebar-offcanvas" id="sidebar" role="navigation">
				<ul class="nav">
					<li><a href="noticeBoard.do">공지사항 게시판</a></li>
					<li class="active"><a href="complainBoard.do">민원 게시판</a></li>
					<li><a href="freeBoard.do">자유 게시판</a></li>
				</ul>
			</div> <br>

			<!-- main area -->
			<form action="boardAdd.do">
				<div class="col-xs-3 col-md-2">
					<select name="category" id="select" class="form-control input-text-style">
						<%
							if ("MANAGER".equals(LoginInfo.getRole())) {
						%>
							<option name="notice" value="notice" id="notice_option">공지사항</option>
						<%
							} else if ("NORMAL".equals(LoginInfo.getRole())) {
						%>
								<option name="complain" value="complain">민원</option>
								<option name="free" value="free">자유</option>
						<%
							}
						%>
					</select>
				</div>

				<div class="col-xs-12 col-md-10">
					<input type="hidden" name="writer_id" value="<%=LoginInfo.getUser_id()%>"> <br> 
					<input type="text" id="board_title" class="form-control input-text-style title " name="title" placeholder="제목을 입력해주세요"> <br>
				
					<script type="text/javascript" src="http://js.nicedit.com/nicEdit-latest.js"></script>
					<script type="text/javascript">
						//<![CDATA[
						bkLib.onDomLoaded(function() {
							nicEditors.allTextAreas()
						});
						//]]>
					</script>
					<textarea class="textarea" id="board_textarea" name="contents"> </textarea> <br>

					<div class="col-xs-6 col-md-4 col-xs-offset-12 col-md-offset-8">
						<input type="checkbox" name="anonymous" class="checkbox inline" value="ANONYMOUS" /> 
						<span class="text inline">익명</span> 
						
						<input type="checkbox" name="closed" class="checkbox inline" value="CLOSED" /> 
						<span class="text inline">비밀글</span>

						<button type="submit" class="btn btn-default">등록</button>
					</div>
				</div>
			</form>
		</div>
	</div>
	<hr>
</body>

<script type="text/javascript">
	if ($('ul li:nth-child(3)').find('ative')) {
		("#select option:nth-child(3) option:selected");
	}
</script>
</html>