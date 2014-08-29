<%@page import="kr.ac.apart.vo.UserVO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="static/css/bootstrap.min.css" rel="stylesheet"
	media="screen">
<title>WebTemplate</title>
<!-- Bootstrap core CSS -->
<link href="static/css/bootstrap.css" rel="stylesheet">

<!-- Custom styles for this template -->
<link href="justified-nav.css" rel="stylesheet">
<link href="static/css/style.css" rel="stylesheet" type="text/css">

<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!--[if lt IE 9]>
      <script src="../../assets/js/html5shiv.js"></script>
      <script src="../../assets/js/respond.min.js"></script>
    <![endif]-->
</head>
</head>
<body>
	<div class="container">
		<div class="masthead">
			<h3 class="text-muted">
				<font size="4">
					<div class="tabbable">
						<ul class="nav nav-tabs" role="tablist" id="tabs">
							<li><a class="active" href="main.do">Home</a></li>
							<li><a href="#profile" data-toggle="tab">cctv</a></li>
							<li><a href="#messages" data-toggle="tab">������</a></li>
							<li><a href="#settings" data-toggle="tab">������</a></li>
							<li><a href="noticeBoard.do">�Խ���</a></li>
							<li><a href="user_visitor.do">�湮��</a></li>
							<li><a href="#settings" data-toggle="tab">������ ��</a></li>
						</ul>
				</font>
			</h3>
		</div>
	</div>

	<jsp:include page="${param.nextPage}"></jsp:include>

	<!-- jQuery (��Ʈ��Ʈ���� �ڹٽ�ũ��Ʈ �÷������� ���� �ʿ���) -->
	<script src="//code.jquery.com/jquery.js"></script>
	<!-- ��� ������ �÷������� �����ϰų� (�Ʒ�) �ʿ��� ������ ���ϵ��� �����ϼ��� -->
	<script src="static/js/bootstrap.min.js"></script>
	<!-- Respond.js ���� IE8 ���� ������ ����� Ȱ��ȭ�ϼ��� (https://github.com/scottjehl/Respond) -->
	<script src="static/js/respond.js"></script>

	</script>
	<script type="text/javascript">
jQuery(document).ready(function ($) {
    $('#tabs').tab();
});
</script>
</body>
</html>