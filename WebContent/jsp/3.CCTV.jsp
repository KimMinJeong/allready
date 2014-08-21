<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="static/js/bootstrap.js"></script>
<script src="static/js/jquery-1.11.1.js"></script>
<script src="static/js/bootstrap.min.js"></script>
<link  href="static/css/bootstrap.min.css" rel="stylesheet" type="text/css">
<link  href="static/css/Style.css" rel="stylesheet" type="text/css">
</head>
<body>
<br>
	<div class="container">
	
	<font size="4">
	<ul class="nav nav-tabs" role="tablist">

<li class="active"><a href="#home" role="tab" data-toggle="tab">Home</a></li>
 <li><a href="#profile" role="tab" data-toggle="tab">cctv</a></li>
  <li><a href="#messages" role="tab" data-toggle="tab">주차장</a></li>
  <li><a href="#settings" role="tab" data-toggle="tab">관리세</a></li>
  <li><a href="#settings" role="tab" data-toggle="tab">게시판</a></li>
  <li><a href="#settings" role="tab" data-toggle="tab">방문객</a></li>
  <li><a href="#settings" role="tab" data-toggle="tab">소통의 장</a></li>
</ul>
  </font>  
	
	 <div class="row row-offcanvas row-offcanvas-left">
        
        <!-- sidebar -->
        <div class="col-xs-6 col-sm-3 sidebar-offcanvas" id="sidebar" role="navigation">
        	<font size="4">
            <ul class="nav">
              <li class="active"><a href="#">입구</a></li>
              <li><a href="#">놀이터</a></li>
              <li><a href="#">정문</a></li>
              <li><a href="#">후문</a></li>              
            </ul>
            </font>
        </div> 
	<!--  <ul class="nav nav-pills nav-stacked" style="max-width: 260px;">
			<li class="active"><a href="#"> 입구 </a></li>
			<li><a href="#">놀이터</a></li>
			<li class="active"><a href="#"> 정문 </a></li>
			<li><a href="#"> 후문 </a></li>
		</ul>  -->
		<div class="col-xs-12 col-sm-8">
		
		<br>

		<div class="table-responsive">
            <table class="table table-striped" border="2">
                <tr height="250px">
                  <td width="50%"><span class="glyphicon glyphicon-facetime-video"></span>입구</td>
                  <td width="50%"><span class="glyphicon glyphicon-facetime-video"></span>놀이터</td>
                </tr>
                <tr height="250px">
                  <td width="50%"><span class="glyphicon glyphicon-facetime-video"></span>정문</td>
                  <td width="50%"><span class="glyphicon glyphicon-facetime-video"></span>후문</td>

                </tr>
            </table>
	</div>
</body>
</html>