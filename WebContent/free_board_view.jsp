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
        <div class="col-md-3 sidebar-offcanvas" id="sidebar" role="navigation">
            <ul class="nav">
              <li class="active"><a href="#">공지사항 게시판</a></li>
              <li><a href="#">민원 게시판</a></li>
              <li><a href="#">자유 게시판</a></li>           
            </ul>
        </div>
     
        <!-- main area -->
        <div class="col-md-9">
       		<div class="col-md-4">
				<small>글쓴이 : 103동 1401호 </small>			 	
			</div>
			<div class="col-md-4 col-md-offset-4">
				<small>2014.08.08 15:00 </small>			 	
			</div>
			
			<br>
			  <h1>제목 : 아랫집이 너무 시끄럽습니다.</h1>
			<br>
			<div class="contents" name="contents">
			  Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus in nisi eu arcu tempus vehicula. 
	            Nulla faucibus cursus metus in sagittis. Nunc elit leo, imperdiet in ligula in, euismod varius est. 
	            Aenean pellentesque lorem a porttitor placerat. Vestibulum placerat nunc ac rutrum fringilla. Donec 
	            arcu leo, tempus adipiscing volutpat id, congue in purus. Pellentesque scelerisque mattis nibh vel 
	            semper. Sed a risus purus. Fusce pulvinar, velit eget rhoncus facilisis, enim elit vulputate nisl, a 
	            euismod diam metus eu enim. Nullam congue justo vitae justo accumsan, sit amet malesuada nulla sagittis. 
	            Nam neque tellus, tristique in est vel, sagittis congue turpis. Aliquam nulla lacus, laoreet dapibus 
	            odio vitae, posuere volutpat magna. Nam pulvinar lacus in sapien feugiat, sit amet vestibulum enim 
	            eleifend. Integer sit amet ante auctor, lacinia sem quis, consectetur nulla.
	        </div>
	      	<br>
    </div><!--/.row-->
    <div class="col-md-offset-10 col-md-2">
		<button type="button" class="btn btn-primary" id="modify_btn">수정</button>
      	<button type="button" class="btn btn-danger" id="delete_btn">삭제</button>
    </div>

	<div class="col-md-8 col-md-offset-3" align="left">
		<textarea class="form-control reply" placeholder="Join the discussion" name="reply"> </textarea>
	</div>
	<div class="col-xs-1 col-md-1 col-sm-1" align="right">
		<input type="submit" class="pull-right btn-small btn-success" id="comment_btn" value="댓글입력">
	</div>
</div><!--/.container-->
</div>
  
  
<script type="text/javascript">
</script>

</body>
</html>