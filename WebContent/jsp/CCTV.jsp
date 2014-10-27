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
<link rel="stylesheet" type="text/css" href="style.css" media="only and (min-width: 300px) and (max-width: 768px)" id="stylesheet-768" />
<link rel="stylesheet" type="text/css" href="style.css" media="only and (min-width: 768px)" id="stylesheet-1200" />
</head>

<body>
	<br>
	<div class="container">
		<div class="row row-offcanvas row-offcanvas-left">

			<!-- sidebar -->
			<div class="col-xs-4 col-md-3 sidebar-offcanvas cctv_sidebar" id="sidebar" role="navigation">
				<ul class="nav">
					<li class="active"><a href="#">입구</a></li>
					<li><a href="#">놀이터</a></li>
					<li><a href="#">정문</a></li>
					<li><a href="#">후문</a></li>
				</ul>
			</div>
			<div class="col-xs-12 col-md-3" id="mobile_bar">
				<div class="navbar-form navbar-left" role="search">
				  <a href="#">입구</a>&nbsp;&nbsp;
				  <a href="#">놀이터</a>&nbsp;&nbsp;
				  <a href="#">정문</a>&nbsp;&nbsp;
				  <a href="#">후문</a>
				</div>
			</div>
		
			<div class="col-xs-12 col-md-4"> 
				<iframe class="cctv_frame" src="http://192.168.123.129:8000/cctv01" scrolling="no"></iframe>
			</div>
			
			<div class="col-xs-12 col-md-4 col-md-offset-1"> 
				<!-- 자신이 연결한 ip주소를 넣어주셔야 합니다.(cmd창에서 ipconfig ->ip4확인 하여 넣어주세요!)  -->
				<iframe class="cctv_frame" src="http://192.168.123.129:8001/cctv02" scrolling="no"></iframe>
			</div>
		</div>
	</div>
	<hr>
</body>
</html>