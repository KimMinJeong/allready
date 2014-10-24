<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=Edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />

<title>Insert title here</title>
<script src="static/js/jquery-1.11.1.js"></script>
<script src="static/js/bootstrap.js"></script>
<link href="static/css/bootstrap.css" rel="stylesheet" type="text/css">
<link href="static/css/style.css" rel="stylesheet" type="text/css">
</head>

<body>
	<div class="container">
		<div class="row row-offcanvas row-offcanvas-left">
			<div class="col-xs-6 col-sm-3 sidebar-offcanvas" id="sidebar" role="navigation"> <br><br>
				<ul class="nav">
					<li class="active"><a href="#">B1</a></li>
					<li><a href="#">B2</a></li>
					<li><a href="#">B3</a></li>
				</ul>
			</div> <br>

			<div class="col-xs-12 col-sm-9">
			<div class="margin3">
				<a href="parking.do?floor='B1'&section='A'">
				<img src="static/images/A.png" height="300" width="300" class="img-rounded"></a>
				
				<a href="#">
				<img src="static/images/B.png" height="300" width="300"class="img-rounded" onclick="#"></a><br> 
				
				<a href="#">
				<img src="static/images/C.png" height="300" width="300" class="img-rounded" onclick="#"></a> 
				
				<a href="#">
				<img src="static/images/D.png" height="300" width="300" class="img-rounded" onclick="#"></a><br>
			</div>
			</div>
		</div>
	</div>
	<hr>
</body>
</html>