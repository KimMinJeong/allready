<%@page import="kr.ac.apart.vo.UserVO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
   pageEncoding="EUC-KR"%>
<!DOCTYPE>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="static/css/bootstrap.min.css" rel="stylesheet" media="screen">
<title>WebTemplate</title>
<!-- Bootstrap core CSS -->
<link href="static/css/bootstrap.css" rel="stylesheet">
<link href="justified-nav.css" rel="stylesheet">
<link href="static/css/style.css" rel="stylesheet" type="text/css">

<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!--[if lt IE 9]>
      <script src="../../assets/js/html5shiv.js"></script>
      <script src="../../assets/js/respond.min.js"></script>
    <![endif]-->
</head>
<body>
<%
   UserVO vo = (UserVO)session.getAttribute("UserFlag");
%>
   <div class="container">
      <div class="masthead">
         <h3 class="text-muted">
            <font size="4">
               <div class="tabbable">
                  <ul class="nav nav-tabs nav-justified" role="tablist" id="tabs">
                  <%if(vo.getRole().equals("NORMAL")) {%>     <!-- 로그인 사용자가 normal -->
                     <li><a href="main.do">Home</a></li>
                     <li><a href="#profile">cctv</a></li>
                     <li><a href="#messages">주차장</a></li>
                     <li><a href="#settings">관리세</a></li>
                     <li><a href="noticeBoard.do">게시판</a></li>
                     <li><a href="user_visitor.do">방문객</a></li>
                     <li><a href="#settings">소통의 장</a></li>
                     <%}
                     else if(vo.getRole().equals("MANAGER")) {%>     <!-- 로그인 사용자가 manager -->
                     <li class="active"><a href="main.do">Home</a></li>
                     <li><a href="#profile">cctv</a></li>
                     <li><a href="#">주차장</a></li>
                     <li><a href="#settings">게시판</a></li>
                     <li><a href="manage_visitor.do">방문일지</a></li>
                     <li><a href="#settings">전체관리세</a></li>
                     <li><a href="#settings">택배관리</a></li>
                     <%} %>
                  </ul>
            </font>
         </h3>
      </div>
   </div>

   <jsp:include page="${param.nextPage}"></jsp:include>


<script type="text/javascript">
   $(document).ready(function () {
       $(".container .tabbale #tabs li a").on('click', function (e) {
           e.preventDefault();
           
           $('a').each(function () {
               $('li').removeClass('active');    
           })
           $('li').addClass('active');
         
           });
       });
   });
</script>



</body>
</html>