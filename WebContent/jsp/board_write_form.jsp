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
<link href="static/css/seulStyle.css" rel="stylesheet" type="text/css">
<%
	UserVO LoginInfo = (UserVO) session.getAttribute("UserFlag");
%>
</head>

<body>
	<div class="container font-style">
		<div class="row row-offcanvas row-offcanvas-left">

			<!-- sidebar -->
			<div class="col-sm-3 sidebar-offcanvas" id="sidebar" role="navigation">
				<ul class="nav">
					<li><a href="noticeBoard.do">공지사항</a></li>
					<li class="active"><a href="complainBoard.do">민원 게시판</a></li>
					<li><a href="freeBoard.do">자유 게시판</a></li>
				</ul>
			</div> <br>

			<!-- main area -->
			<form action="boardAdd.do">
				<div class="col-sm-2">
					<select name="category" id="select" class="form-control input-text-style">
						<%
							if ("MANAGER".equals(LoginInfo.getRole())) {
						%>
							<option name="notice" value="notice" id="notice_option">공지사항</option>
						<%
							} else if ("NORMAL".equals(LoginInfo.getRole())) {
								String boardCategory=(String)request.getAttribute("boardCategory");
								if("complain".equals(boardCategory)){%>
								<option value="complain" selected="selected">민원</option>
								<option value="free">자유</option>
								<%}else if("free".equals(boardCategory)){ %>
								<option value="complain">민원</option>
								<option value="free" selected="selected">자유</option>
						<%		}
							}
						%>
					</select>
				</div>

				<div class="col-sm-10">
					<input type="hidden" name="writer_id" value="<%=LoginInfo.getUser_id()%>"> <br> 
					<input type="text" id="board_title" class="form-control input-text-style title " name="title" placeholder="제목을 입력해주세요"> <br>
				
					<script type="text/javascript" src="http://js.nicedit.com/nicEdit-latest.js"></script>
					<script type="text/javascript">
						//<![CDATA[
						bkLib.onDomLoaded(function() {
							nicEditors.allTextAreas();
						});
						//]]>
					</script>
					<textarea class="textarea" id="board_textarea" name="contents"> </textarea> <br>

					<div class="col-md-4 col-md-offset-8">
						<input type="checkbox" name="anonymous" class="checkbox inline" value="ANONYMOUS" /> 
						<span class="text inline">익명</span> 
						
						<input type="checkbox" name="closed" class="checkbox inline" value="CLOSED" /> 
						<span class="text inline">비밀글</span>

						<button type="submit" id="upload" class="btn btn-default">등록</button>
						<button type="button" class="btn btn-default" id="cancleButton">취소</button>
					</div>
				</div>
			</form>
		</div>
	</div>
	<hr>
</body>

<script type="text/javascript">
	$("#upload").on('click', function(){
		if($("#board_title").val()==""){
			alert("제목을 입력해주세요");
			$("#board_title").focus();
			return false;
		}
	});

	if ($('ul li:nth-child(3)').find('ative')) {
		("#select option:nth-child(3) option:selected");
	}
	$("#cancleButton").on('click', function(){
		againCheck = confirm("정말 취소하시겠습니까?");
		if(againCheck == true)
		{
			location.href="javascript:history.back()";
		}else
			return false;
	});
</script>
</html>