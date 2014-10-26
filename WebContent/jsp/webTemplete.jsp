<%@page import="kr.ac.apart.vo.UserVO"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE>
<html >
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Between Apartment</title>
<!-- Bootstrap core CSS -->
<link href="static/css/bootstrap.css" rel="stylesheet">
<link href="static/css/bootstrap.min.css" rel="stylesheet" media="screen">
<link rel="stylesheet" type="text/css" href="style.css" media="only and (min-width: 260px) and (max-width: 768px)" id="stylesheet-768" />
<link rel="stylesheet" type="text/css" href="style.css" media="only and (min-width: 768px)" id="stylesheet-1200" />
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
   <nav class="navbar navbar-default font-style" id="navbar" role="navigation">
      <div class="container">
          <ul class="nav navbar-nav font-style">
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
                     <li><a href="logout.do" target="_blank">logout</a></li>
          </ul>
        </div>
    </nav>
      <jsp:include page="${param.nextPage}"></jsp:include>
</body>
</html>