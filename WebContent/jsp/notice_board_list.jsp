<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<script src="static/js/bootstrap.js"></script>
<script src="static/js/jquery-1.11.1.js"></script>
<script src="static/js/bootstrap.min.js"></script>
<link  href="static/css/bootstrap.min.css" rel="stylesheet" type="text/css">
<link  href="static/css/Style.css" rel="stylesheet" type="text/css">
<script src="static/js/jquery-1.11.1.js"></script>
<title>Insert title here</title>

</head>
<body>

    <div class="container">
      <div class="row row-offcanvas row-offcanvas-left">
        
        <!-- sidebar -->
        <div class="col-xs-6 col-sm-3 sidebar-offcanvas" id="sidebar" role="navigation">

        	<font size="4">
            <ul class="nav">
              <li class="active"><a href="noticeBoard.do">공지사항 게시판</a></li>
              <li><a href="complainBoard.do">민원 게시판</a></li>
              <li><a href="freeBoard.do">자유 게시판</a></li>           
            </ul>
            </font>
        </div>
     
        <!-- main area -->
        <br><br>

        <div class="col-xs-12 col-sm-9">
       <div class="panel panel-default">
       

      
        <!-- Default panel contents -->
        <div class="panel-heading"><center>공지사항 게시판</center></div>
      
        <!-- Table -->
        <table class="table">
          <tr>
             <th>번호</th>
                <th>제목</th>
                  <th>작성자</th>
                <th>날짜</th>
          </tr>
          <tr>
             <td>3</td>
             <a href="#"><td>필독</td></a>
             <td>관리자</td>
             <td>2014-8-18</td>
          </tr>
            <tr>
             <td>2</td>
             <a href="#"><td>공지사항</td></a>
             <td>관리자</td>
             <td>2014-8-18</td>
          </tr>
            <tr>
             <td>1</td>
             <a href="#"><td>보석바는 제발 제발 제발....좀..</td></a>
             <td>관리자</td>
             <td>2014-8-18</td>
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
      <div align="center">
      <form class="navbar-form navbar-left" role="search">
        <div class="form-group">
        <input type="text" class="form-control" placeholder="Search" size="100%" align="center" >
        </div>
        <button type="submit" class="btn btn-default" placeholder="제목">검색</button>
      </form></div>
   
   
          
        </div><!-- /.col-xs-12 main -->
    </div><!--/.row-->




  
<script type="text/javascript">

</script>

</body>
</html>