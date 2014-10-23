<%@page import="kr.ac.apart.vo.UserVO"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE>
<html >
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="static/css/bootstrap.min.css" rel="stylesheet" media="screen">
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


      
   <div class="navbar navbar-fixed-top font-style">
      <div class="container">   
        <div class="navbar-collapse collapse" id="navbar-main">
          <ul class="nav navbar-nav">
                 <%
                        if(vo != null){
                           if("NORMAL".equals(vo.getRole())){   //로그인 사용자가 normal
                     %> 
                  
                     <li class="active"><a href="main.do">Home</a></li>
                     <li><a href="cctv_client.do">CCTV</a></li>
                     <li><a href="user_parking.do">주차장</a></li>
                     <li><a href="user_tax.do">관리세</a></li>
                     <li><a href="noticeBoard.do">게시판</a></li>
                     <li><a href="user_visitor.do">방문객</a></li>
                     <li><a href="chat_server.do">소통의 장</a></li>
                     <li><a href="user_detail.do">설정</a></li>
                  
                     
                     <%
                        } else if("MANAGER".equals(vo.getRole())){  //로그인 사용자가 manager
                     %>
                  
                     <li class="active"><a href="main.do">Home</a></li>
                     <li><a href="cctv_client.do">CCTV</a></li>
                     <li><a href="user_parking.do">주차장</a></li>
                     <li><a href="noticeBoard.do">게시판</a></li>
                     <li><a href="manage_visitor.do">방문일지</a></li>
                     <li><a href="user_tax.do">전체관리세</a></li>
                     <li><a href="expressList.do">택배관리</a></li>
                     <li><a href="manage_detail.do">설정</a></li>
                  
                     
                     <%
                        }
                     }
                     %>
          </ul>

          <ul class="nav navbar-nav navbar-right">
            <li><a href="logout.do" target="_blank">logout</a></li>
            <li><a href="https://wrapbootstrap.com/?ref=bsw" target="_blank">WrapBootstrap</a></li>
          </ul>

        </div>
    
      </div>
    </div>
      <jsp:include page="${param.nextPage}"></jsp:include>

   <!-- jQuery (부트스트랩의 자바스크립트 플러그인을 위해 필요한) -->
   <script src="//code.jquery.com/jquery.js"></script>
   <!-- 모든 합쳐진 플러그인을 포함하거나 (아래) 필요한 각각의 파일들을 포함하세요 -->
   <script src="static/js/bootstrap.min.js"></script>
   <!-- Respond.js 으로 IE8 에서 반응형 기능을 활성화하세요 (https://github.com/scottjehl/Respond) -->
   <script src="static/js/respond.js"></script>
   <script src="https://code.jquery.com/jquery-1.10.2.min.js"></script>
   <script src="../bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
   <script src="../assets/js/bootswatch.js"></script>
   <script src="../assets/js/variables.js"></script>
</body>
</html>