<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="static/js/bootstrap.js"></script>
<script src="static/js/jquery-1.11.1.js"></script>
<script src="static/js/bootstrap.min.js"></script>

<link  href="static/css/bootstrap.min.css" rel="stylesheet" type="text/css">
<link href="static/css/Style.css" rel="stylesheet" type="text/css">


</head>
<body>

<br><br><br><br> 
    <div class="container">
      <div class="row row-offcanvas row-offcanvas-left">
        <!-- sidebar -->
        <div class="col-sm-3 sidebar-offcanvas" id="sidebar" role="navigation">
            <ul class="nav">
              <li class="active"><a href="#">공지사항 게시판</a></li>
              <li><a href="#">민원 게시판</a></li>
              <li><a href="#">자유 게시판</a></li>           
            </ul>
        </div>
     
        <!-- main area -->
        <div class="col-sm-9">
	        <div class="btn-group btn-input clearfix">
			  <button type="button" class="btn btn-default dropdown-toggle form-control" data-toggle="dropdown">
			    <span data-bind="label">Select One</span> <span class="caret"></span>
			  </button>
			  <ul class="dropdown-menu" role="menu">
			    <li><a>민원</a></li>
			    <li><a>자유</a></li>
			  </ul>		 
			</div>
			<br>
			  <input type="text" class="form-control title" name="title">
			<br>
	        <textarea rows="20" cols="135">
	         
	      </textarea>
	      <br>
	      <br>
	      	<input type="file" class="file"/>
	      	<br>
			<input type="checkbox" class="checkbox" />
			<span class="text">익명</span>
			<input type="checkbox" class="checkbox" />
			<span class="text">비밀글</span>
	      	<button type="button" class="btn btn-primary" >등록</button>
    </div><!--/.row-->
  </div><!--/.container-->

  
<script type="text/javascript">

</script>

</body>
</html>