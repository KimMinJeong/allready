<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<script src="static/js/bootstrap.js"></script>
<script src="static/js/jquery-1.11.1.js"></script>
<script src="static/js/bootstrap.min.js"></script>
<link href="static/css/bootstrap.min.css" rel="stylesheet"
	type="text/css">
<link href="static/css/style.css" rel="stylesheet" type="text/css">
<script src="static/js/jquery-1.11.1.js"></script>
<title>Insert title here</title>
</head>
<body>
	<div class="container">	
		<div class="row row-offcanvas row-offcanvas-left">
			<div class="col-xs-10 col-sm-7">
				<br>
				<div class="panel panel-default">
					<!-- Default panel contents -->
					<div class="panel-heading">
						<center>공지사항 게시판</center>
					</div>
					<!-- Table -->
					<table class="table">
						<tr>
							<th>번호</th>
							<th>제목</th>
							<th>작성자</th>
							<th>날짜</th>
						</tr>
						<tr>
							<td>1</td>
							<td>윗층이 너무 시끄럽습니다</td>
							<td>김은지</td>
							<td>2014-8-18</td>
						</tr>
						<tr>
							<td>2</td>
							<td>윗층이 너무 시끄럽습니다</td>
							<td>김은지</td>
							<td>2014-8-18</td>
						</tr>
						<tr>
							<td>3</td>
							<td>윗층이 너무 시끄럽습니다</td>
							<td>김은지</td>
							<td>2014-8-18</td>
						</tr>
					</table>
				</div>
			</div>
			<div class="container"> <br>
				<div class="row row-offcanvas row-offcanvas-right">
					<div class="row">
						<div class="col-xs-6 col-md-3">
							<a href="#" class="thumbnail"> <img data-src="holder.js/100%x180" alt="..."></a>
						</div>
					</div>
				</div>
			</div>
			<!-- main area -->

			<div class="col-xs-12 col-sm-4">
				<button type="button" class="btn btn-default btn-lg button1">
					<span class="glyphicon glyphicon-facetime-video"></span> CCTV
				</button>
			</div>
			<div class="col-xs-12 col-sm-4">
				<button type="button" class="btn btn-default btn-lg button1">
					<span class="glyphicon glyphicon-star"></span> 주차장
				</button>
			</div>

			<div class="col-xs-12 col-sm-4">
				<button type="button" class="btn btn-default btn-lg button1">
					<span class="glyphicon glyphicon-usd"></span> 관리세
				</button>
			</div>
			
			<div class="col-xs-12 col-sm-4">
				<button type="button" class="btn btn-default btn-lg button1" onClick="top.location.href='noticeBoard.do'">
					<span class="glyphicon glyphicon-align-justify"></span> 게시판
				</button>
			</div>

			<div class="col-xs-12 col-sm-4">
				<button type="button" class="btn btn-default btn-lg button1" onClick="top.location.href='user_visitor.do'">
					<span class="glyphicon glyphicon-user"></span> 방문객
				</button>
			</div>

			<div class="col-xs-12 col-sm-4">
				<button type="button" class="btn btn-default btn-lg button1">
					<span class="glyphicon glyphicon-heart-empty"></span> 소통의 장
				</button>
			</div>
		</div>
		<!-- /.col-xs-12 main -->
	</div>
	<!--/.row-->
</body>

<script type="text/javascript">
$('#tabs .tab4 a[href="noticeBoard.do"]').tab('show'); // Select tab by nam
	
</script>
</html>