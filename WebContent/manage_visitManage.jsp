<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<script src="static/js/bootstrap.js"></script>
<script src="static/js/jquery-1.11.1.js"></script>
<script src="static/js/bootstrap.min.js"></script>
<link  href="static/css/bootstrap.min.css" rel="stylesheet" type="text/css">
<script src="static/js/jquery-1.11.1.js"></script>
<title>Insert title here</title>



</head>
<body>


<br><br><br><br>

<div class="page-container">
  
	<!-- top navbar -->
    <div class="navbar navbar-default navbar-fixed-top" role="navigation">
       <div class="container">
    	<div class="navbar-header">
           <button type="button" class="navbar-toggle" data-toggle="offcanvas" data-target=".sidebar-nav">
             <span class="icon-bar"></span>
             <span class="icon-bar"></span>
             <span class="icon-bar"></span>
           </button>
           <a class="navbar-brand" href="#">Project Name</a>
    	</div>
       </div>
    </div>
      
    <div class="container">
      <div class="row row-offcanvas row-offcanvas-left">
        
        <!-- sidebar -->
        <div class="col-xs-6 col-sm-3 sidebar-offcanvas" id="sidebar" role="navigation">
            <ul class="nav">
              <li class="active"><a href="#">공지사항 게시판</a></li>
              <li><a href="#">민원 게시판</a></li>
              <li><a href="#">자유 게시판</a></li>
              <li><a href="#">Link 3</a></li>              
            </ul>
        </div>
  	
  	<div align="right">
		<div align="right">
		<form class="navbar-form navbar-left" role="search">
  		<div class="form-group">
  		<input type="text" class="form-control" placeholder="Search" size="20" align="center" value="동 호수" >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  		<input type="text" class="form-control" placeholder="Search" size="20" align="center" value="방문자 신분" >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  		<input type="text" class="form-control" placeholder="Search" size="50" align="center" value = "용무">&nbsp;&nbsp;&nbsp;
  		</div>
 		 <button type="submit" class="btn btn-default">입력</button>
		</form></div><br>
		

  		
        <!-- main area -->
        <div class="col-xs-12 col-sm-9">
    
		
		
		
		
		 <div class="panel panel-default">
		  <!-- Default panel contents -->
		  <div class="panel-heading"><center>고정 방문객 리스트</center></div>
		
		  <!-- Table -->
		  <table class="table">
		    <tr>
		    	<th><center>동호수</center></th>
		       	<th><center>방문자신분</center></th>
		   	   	<th><center>용무</center></th>
		       	<th><center>날짜</center></th>
		    </tr>
		    <tr>
		    	<td><center>2502호</center></td>
		    	<td><center>이모</center></td>
		    	<td><center>김은지</center></td>
		    	<td><center>2014-8-18</center></td>
		    </tr>
		      <tr>
		    	<td><center>3002호</center></td>
		    	<td><center>과외쌤</center></td>
		    	<td><center>김은지</center></td>
		    	<td><center>2014-8-18</center></td>
		    </tr>
		      <tr>
		    	<td><center>301호</center></td>
		    	<td><center>할머니</center></td>
		    	<td><center>김은지</center></td>
		    	<td><center>2014-8-18</center></td>
		    </tr>
		  </table>
		</div>
		
		
		 <div class="panel panel-default">
		  <!-- Default panel contents -->
		  <div class="panel-heading"><center>방문 기록 리스트</center></div>
		
		  <!-- Table -->
		  <table class="table">
	    <tr>
		    	<th><center>동호수</center></th>
		       	<th><center>방문자신분</center></th>
		   	   	<th><center>용무</center></th>
		       	<th><center>날짜</center></th>
		    </tr>
		    <tr>
		    	<td><center>2502호</center></td>
		    	<td><center>이모</center></td>
		    	<td><center>김은지</center></td>
		    	<td><center>2014-8-18</center></td>
		    </tr>
		      <tr>
		    	<td><center>3002호</center></td>
		    	<td><center>과외쌤</center></td>
		    	<td><center>김은지</center></td>
		    	<td><center>2014-8-18</center></td>
		    </tr>
		      <tr>
		    	<td><center>301호</center></td>
		    	<td><center>할머니</center></td>
		    	<td><center>김은지</center></td>
		    	<td><center>2014-8-18</center></td>
		    </tr>
		  </table>
		</div>
		
		<center>
		<form class="navbar-form navbar-left" role="search">
  		<div class="form-group">
  		<input type="text" class="form-control" placeholder="Search" size="100%" align="center" >
  		</div>
 		 <button type="submit" class="btn btn-default">검색</button>
		</form></center>
		
		<div align="center">
	<ul class="pagination">
  <li><a href="#">&laquo;</a></li>
  <li><a href="#">1</a></li>
  <li><a href="#">2</a></li>
  <li><a href="#">3</a></li>
  <li><a href="#">4</a></li>
  <li><a href="#">5</a></li>
  <li><a href="#">&raquo;</a></li>
</ul></div>
	
	
	
          
        </div><!-- /.col-xs-12 main -->
    </div><!--/.row-->
  </div><!--/.container-->
</div><!--/.page-container-->



 
</ul>  
</div>  
</div>  
</div> 





  
<script type="text/javascript">

</script>

</body>
</html>