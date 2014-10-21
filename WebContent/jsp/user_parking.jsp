<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=Edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />

<title>Insert title here</title>
<script src="static/js/bootstrap.js"></script>
<script src="static/js/jquery-1.11.1.js"></script>
<script src="static/js/bootstrap.min.js"></script>
<link href="static/css/bootstrap.min.css" rel="stylesheet" type="text/css">
</head>

<body>
	<div class="container">
		<div class="row row-offcanvas row-offcanvas-left">
			<div class="col-xs-6 col-sm-3 sidebar-offcanvas" id="sidebar" role="navigation"> <br><br>
				<ul class="nav">
					<li class="active"><a href="#"><font size="4">B1</font></a></li>
					<li><a href="#"><font size="4">B2</font></a></li>
					<li><a href="#"><font size="4">B3</font></a></li>
				</ul>
			</div> <br>

			<div class="col-xs-12 col-sm-9">
				<a href="parking.do?floor='B1'&section='A'">
				<img src="images/A.png" height="300" width="300" class="img-rounded"></a>
				
				<a href="#">
				<img src="images/B.jpg" height="300" width="300"class="img-rounded" onclick="#"></a><br> 
				
				<a href="#">
				<img src="images/C.jpg" height="300" width="300" class="img-rounded" onclick="#"></a> 
				
				<a href="#">
				<img src="images/D.jpg" height="300" width="300" class="img-rounded" onclick="#"></a><br>
			</div>
		</div>
	</div>
	<hr>
</body>
</html>