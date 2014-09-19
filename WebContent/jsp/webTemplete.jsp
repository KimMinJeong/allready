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
                  <%if(vo.getRole().equals("NORMAL")) {%>     <!-- �α��� ����ڰ� normal -->
                     <li><a href="main.do">Home</a></li>
                     <li><a href="#profile">CCTV</a></li>
                     <li><a href="#messages">������</a></li>
                     <li><a href="#settings">������</a></li>
                     <li><a href="noticeBoard.do">�Խ���</a></li>
                     <li><a href="user_visitor.do">�湮��</a></li>
                     <li><a href="#settings">������ ��</a></li>
                     <li><a href="user_detail.do">����</a></li>
                     <%}
                     else if(vo.getRole().equals("MANAGER")) {%>     <!-- �α��� ����ڰ� manager -->
                     <li class="test active"><a href="main.do">Home</a></li>
                     <li class="test"><a href="#profile">CCTV</a></li>
                     <li class="test"><a href="parking.do">������</a></li>
                     <li class="test"><a href="noticeBoard.do">�Խ���</a></li>
                     <li class="test"><a href="manage_visitor.do">�湮����</a></li>
                     <li class="test"><a href="#settings">��ü������</a></li>
                     <li class="test"><a href="#settings">�ù����</a></li>
                     <li class="test"><a href="manage_detail.do">����</a></li>
                     <li><a href="#settings">����</a></li>
                     <%}%>
                  </ul>
            </font>
         </h3>
      </div>
   </div>

   <jsp:include page="${param.nextPage}"></jsp:include>

   <!-- jQuery (��Ʈ��Ʈ���� �ڹٽ�ũ��Ʈ �÷������� ���� �ʿ���) -->
   <script src="//code.jquery.com/jquery.js"></script>
   <!-- ��� ������ �÷������� �����ϰų� (�Ʒ�) �ʿ��� ������ ���ϵ��� �����ϼ��� -->
   <script src="static/js/bootstrap.min.js"></script>
   <!-- Respond.js ���� IE8 ���� ������ ����� Ȱ��ȭ�ϼ��� (https://github.com/scottjehl/Respond) -->
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