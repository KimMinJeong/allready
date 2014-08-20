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
  	
        <!-- main area -->
        <div class="col-xs-12 col-sm-9">
        		 <div align="right">
	
<button class="btn btn-primary btn-lg" data-toggle="modal" data-target="#myModal">
  등록
</button>

<!-- Modal -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
        <h4 class="modal-title" id="myModalLabel">Modal title</h4>
      </div>
      <div class="modal-body">
     
     
      <div align="left">
		<button type="button" class="btn btn-default navbar-btn" >102동</button>
		
	
		<button type="button" class="btn btn-default navbar-btn" >202동</button>
</div>
	<br>
	<br>
	
  <div class="row">
  <div class="col-xs-7">
    <input type="text" class="form-control" placeholder=".col-xs-2" value="호수를 입력하세요"> 
  </div></div>
   <br>
   
  
   <div class="row">
   <div class="col-xs-7">
    <input type="text" class="form-control" placeholder=".col-xs-2" value="이름을 입력하세요">
    </div></div>
    <br>
    <br>
   
    
<div class="btn-group" >
 <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown">
    Action <span class="caret"></span>
  </button>
  <ul class="dropdown-menu" role="menu">
    <li><a href="#">CJ</a></li>
    <li><a href="#">한진</a></li>
    <li><a href="#">로젠</a></li>
    <li><a href="#">Yellow Cap</a></li>
    <li><a href="#">우체국</a></li>
    <li><a href="#">편의점</a></li>
    <li class="divider"></li>
    <li><a href="#">Separated link</a></li>
  </ul>
 </div>


 
     
     
     
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary">Save changes</button>
      </div>
    </div>
  </div>
</div>
	

</div>
<br><br><br>
		 <div class="panel panel-default">
		 

		
		  <!-- Default panel contents -->
		  <div class="panel-heading"><center>Express List</center></div>
		
		  <!-- Table -->
		  <table class="table">
		    <tr>
		    	<th>날짜</th>
		       	<th>동호수</th>
		   	   	<th>이름</th>
		       	<th>택배회사</th>
		       	<th>수령확인</th>
		    </tr>
		    <tr>
		    	<td>2014-8-18</td>
		    	<td>202동 2502호</td>
		    	<td>김은지</td>
		    	<td>한진</td>
		    	<td> <input type="checkbox"></td>
		    </tr>
		     <tr>
		    	<td>2014-8-18</td>
		    	<td>203동 2502호</td>
		    	<td>한성구</td>
		    	<td>우체국</td>
		    	<td> <input type="checkbox" align="middle"></td>
		    </tr>
		       <tr>
		    	<td>2014-8-18</td>
		    	<td>204동 2502호</td>
		    	<td>김은지</td>
		    	<td>편의점</td>
		    	<td> <input type="checkbox" align="middle"></td>
		    </tr>
		  </table>
		</div>
		
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