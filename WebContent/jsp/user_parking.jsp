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
<link rel="stylesheet" type="text/css" href="style.css" media="only and (min-width: 360px) and (max-width: 768px)" id="stylesheet-768" />
<link rel="stylesheet" type="text/css" href="style.css" media="only and (min-width: 768px)" id="stylesheet-1200" />
</head>

<body>
	<div class="container">
		<div class="row row-offcanvas row-offcanvas-left">
			<div class="col-xs-4 col-md-3 sidebar-offcanvas" id="sidebar" role="navigation"> <br><br>
				<ul class="nav">
					<li class="active"><a href="#"><font size="8">B1</font><br><font size="3"><%=request.getAttribute("B1") %></font></a></li>
					<li><a href="#"><font size="8">B2</font><br><font size="3"><%=request.getAttribute("B2") %></font></a></li>
					<li><a href="#"><font size="8">B3</font><br><font size="3"><%=request.getAttribute("B3") %></font></a></li>
				</ul>
			</div> <br>

			<div class="col-xs-8 col-md-4" id="parking_section">
				<a href="parking.do?floor='B1'&section='A'">
				<img src="static/images/A.png" id="parking_img" class="img-rounded"></a>	
				<a href="#">
				<img src="static/images/C.png" id="parking_img" class="img-rounded" onclick="#"></a> 
			</div>
			<div class="col-xs-8 col-md-4" id="parking_section">
				<a href="#">
				<img src="static/images/B.png" id="parking_img" class="img-rounded" onclick="#"></a> 
				
				<a href="#">
				<img src="static/images/D.PNG" id="parking_img" class="img-rounded" onclick="#"></a>
			</div>
			</div>
		</div>
	</div>
	<hr>
</body>
</html>