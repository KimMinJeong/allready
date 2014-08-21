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

<link href="static/css/bootstrap.min.css" rel="stylesheet" type="text/css">
<link href="static/css/style.css" rel="stylesheet" type="text/css">
</head>
<body>
	<div class="container">
	  <font size="4">
<ul class="nav nav-tabs" role="tablist" >

<li class="active"><a href="#home" role="tab" data-toggle="tab">Home</a></li>
 <li><a href="#profile" role="tab" data-toggle="tab">cctv</a></li>
  <li><a href="#messages" role="tab" data-toggle="tab">주차장</a></li>
  <li><a href="#settings" role="tab" data-toggle="tab">관리세</a></li>
  <li><a href="#settings" role="tab" data-toggle="tab">게시판</a></li>
  <li><a href="#settings" role="tab" data-toggle="tab">방문객</a></li>
  <li><a href="#settings" role="tab" data-toggle="tab">소통의 장</a></li>
</ul>
</font>
    
    <br>
	<div class="col-md-5 col-md-offset-7">
		<input type="checkbox" class="checkbox inline">&nbsp;&nbsp;
		<h4 class="text inline">고정방문객</h4>
	
	</div>
	
	<div class="col-md-4 col-md-offset-7 ">
	<br>
		<div class="input-group">
		  <span class="input-group-addon">이름</span>
		  <input type="text" class="form-control" placeholder="Username">
		</div>
		<div class="input-group">
		  <span class="input-group-addon">용무</span>
		  <input type="text" class="form-control" placeholder="Username">
		</div>
	</div>

	
	
	<div class=".col-md-1">
		<br><br><br>
		<button type="button" class="btn btn-primary" id="visitor_submit_btn" data-toggle="button" >등록</button>

	</div>
	<br><br><br>

		
	<div class="table-responsive">
            <table class="table table-striped">
              <thead>
                <tr>
                  <th>#</th>
                  <th>Header</th>
                  <th>Header</th>
                  <th>Header</th>
                  <th>Header</th>
                </tr>
              </thead>
              <tbody>
                <tr>
                  <td>1,001</td>
                  <td>Lorem</td>
                  <td>ipsum</td>
                  <td>dolor</td>
                  <td>sit</td>
                </tr>
                <tr>
                  <td>1,002</td>
                  <td>amet</td>
                  <td>consectetur</td>
                  <td>adipiscing</td>
                  <td>elit</td>
                </tr>
                <tr>
                  <td>1,003</td>
                  <td>Integer</td>
                  <td>nec</td>
                  <td>odio</td>
                  <td>Praesent</td>
                </tr>
                <tr>
                  <td>1,003</td>
                  <td>libero</td>
                  <td>Sed</td>
                  <td>cursus</td>
                  <td>ante</td>
                </tr>
                <tr>
                  <td>1,004</td>
                  <td>dapibus</td>
                  <td>diam</td>
                  <td>Sed</td>
                  <td>nisi</td>
                </tr>
              </tbody>
            </table>
          </div>
      </div>
	 
</body>
</html>