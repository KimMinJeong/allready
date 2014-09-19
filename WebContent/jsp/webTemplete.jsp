<%@page import="kr.ac.apart.vo.UserVO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
   pageEncoding="EUC-KR"%>
<!DOCTYPE>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="static/css/bootstrap.min.css" rel="stylesheet"
   media="screen">
<title>Between Apartment</title>
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
                     <li><a href="#profile">CCTV</a></li>
                     <li><a href="#messages">주차장</a></li>
                     <li><a href="#settings">관리세</a></li>
                     <li><a href="noticeBoard.do">게시판</a></li>
                     <li><a href="user_visitor.do">방문객</a></li>
                     <li><a href="#settings">소통의 장</a></li>
                     <li><a href="user_detail.do">설정</a></li>
                     <%}
                     else if(vo.getRole().equals("MANAGER")) {%>     <!-- 로그인 사용자가 manager -->
                     <li class="test active"><a href="main.do">Home</a></li>
                     <li class="test"><a href="#profile">CCTV</a></li>
                     <li class="test"><a href="parking.do">주차장</a></li>
                     <li class="test"><a href="noticeBoard.do">게시판</a></li>
                     <li class="test"><a href="manage_visitor.do">방문일지</a></li>
                     <li class="test"><a href="#settings">전체관리세</a></li>
                     <li class="test"><a href="#settings">택배관리</a></li>
                     <li class="test"><a href="manage_detail.do">설정</a></li>
                     <li><a href="#settings">설정</a></li>
                     <%}%>
                  </ul>
            </font>
         </h3>
      </div>
   </div>

   <jsp:include page="${param.nextPage}"></jsp:include>

   <!-- jQuery (부트스트랩의 자바스크립트 플러그인을 위해 필요한) -->
   <script src="//code.jquery.com/jquery.js"></script>
   <!-- 모든 합쳐진 플러그인을 포함하거나 (아래) 필요한 각각의 파일들을 포함하세요 -->
   <script src="static/js/bootstrap.min.js"></script>
   <!-- Respond.js 으로 IE8 에서 반응형 기능을 활성화하세요 (https://github.com/scottjehl/Respond) -->
   <script src="static/js/respond.js"></script>

   <!-- <script type="text/javascript">
     $(document).on('click', '.test', function(){
    	 alert("click");
    	 $('.test').each(function () {
             $('li').removeClass('active');    
         })
         $(this).closest('li').addClass('active');
     });
   </script> -->
</body>
</html>