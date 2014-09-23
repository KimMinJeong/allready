<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="static/js/bootstrap.js"></script>
<script src="static/js/jquery-1.11.1.js"></script>
<script src="static/js/bootstrap.min.js"></script>
<link href="static/css/bootstrap.css" rel="stylesheet" type="text/css">
<script src="static/js/jquery-1.11.1.js"></script>
<title>Insert title here</title>
</head>
<body>
	<div class="container">
		<div class="row row-offcanvas row-offcanvas-left">
			<!-- sidebar -->
			<div class="col-xs-6 col-sm-3 sidebar-offcanvas" id="sidebar"
				role="navigation">
				<font size="4">
					<ul class="nav">
						<li class="active"><a href="#">공지사항 게시판</a></li>
						<li><a href="#">민원 게시판</a></li>
						<li><a href="#">자유 게시판</a></li>
						<li><a href="#">Link 3</a></li>
					</ul>
				</font>
			</div>

			<!-- main area -->

			<div class="col-xs-12 col-sm-9">
				<br>
				<div class="btn-group">
					<button type="button" class="btn btn-default dropdown-toggle"
						data-toggle="dropdown">
						Action <span class="caret"></span>
					</button>
					<ul class="dropdown-menu" role="menu">
						<li><a href="#">Action</a></li>
						<li><a href="#">Another action</a></li>
						<li><a href="#">Something else here</a></li>
						<li class="divider"></li>
						<li><a href="#">Separated link</a></li>
					</ul>
				</div>

				<textarea rows="20" cols="135">
			Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus in nisi eu arcu tempus vehicula. 
            Nulla faucibus cursus metus in sagittis. Nunc elit leo, imperdiet in ligula in, euismod varius est. 
            Aenean pellentesque lorem a porttitor placerat. Vestibulum placerat nunc ac rutrum fringilla. Donec 
            arcu leo, tempus adipiscing volutpat id, congue in purus. Pellentesque scelerisque mattis nibh vel 
            semper. Sed a risus purus. Fusce pulvinar, velit eget rhoncus facilisis, enim elit vulputate nisl, a 
            euismod diam metus eu enim. Nullam congue justo vitae justo accumsan, sit amet malesuada nulla sagittis. 
            Nam neque tellus, tristique in est vel, sagittis congue turpis. Aliquam nulla lacus, laoreet dapibus 
            odio vitae, posuere volutpat magna. Nam pulvinar lacus in sapien feugiat, sit amet vestibulum enim 
            eleifend. Integer sit amet ante auctor, lacinia sem quis, consectetur nulla.
		</textarea>
				<br>
				<div align="right">
					<button type="button" class="btn btn-default navbar-btn">수정</button>
					<button type="button" class="btn btn-default navbar-btn">삭제</button>
				</div>

			</div>
			<!-- /.col-xs-12 main -->
		</div>
		<!--/.row-->
	</div>
	<!--/.container-->
	</div>
	<!--/.page-container-->


</body>
</html>