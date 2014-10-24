<%@page import="kr.ac.apart.vo.UserVO"%>
<%@page import="kr.ac.apart.vo.BoardVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=Edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />

<script src="static/js/bootstrap.js"></script>
<script src="static/js/jquery-1.11.1.js"></script>
<script src="static/js/bootstrap.min.js"></script>
<link href="static/css/bootstrap.min.css" rel="stylesheet" type="text/css">
<link href="static/css/style.css" rel="stylesheet" type="text/css">
<link href="static/css/stylish-portfolio.css" rel="stylesheet" type="text/css">
<script src="js/jquery.prettyPhoto.js"></script>
<script src="js/jquery.isotope.min.js"></script>
<link href="static/css/seulStyle.css" rel="stylesheet" type="text/css">
<title>메인</title>
</head>
<%
	UserVO user = (UserVO) session.getAttribute("UserFlag");
	List<BoardVO> noticeList = (List<BoardVO>) request.getAttribute("getNoticeList");
%>
<body>
	<div class="container font-style">
		<div class="row row-offcanvas row-offcanvas-left">
<<<<<<< HEAD
			<div class="col-xs-10 col-sm-8"> <br>
			 <div class="panel panel-default margin5">
=======
			<div class="col-xs-10 col-sm-7"> <br>

		 <div class="panel panel-default">
               
         
               
>>>>>>> 1e37c7456117a7bed2107b809b36f8437d99e8ce
               <!-- Table -->
               <table class="table table-bordered table-style">
                  <thead class="head">
                  <tr>
                     <th><center>번호</center></th>
                     <th><center>제목</center></th>
                     <th><center>작성자</center></th>
                     <th><center>날짜</center></th>
                  </tr>
                  </thead>
                  <tbody id="body">
                  <%
                     if(noticeList != null){
                        for(BoardVO vo : noticeList){%>
                           <tr>
                              <td><center><%=vo.getBoard_no()%></center></td>
                              <td><a href="boardDetail.do?board_no=<%=vo.getBoard_no()%>"><center><%=vo.getTitle()%></center></a></td>
                              <td><center><%=vo.getWriter_id()%></center></td>
                              <td><center><%=vo.getReg_date()%></center></td>
                           </tr>
                        <%}
                     }
                  	if(noticeList.size()==0){%>
                  		<tr><td colspan="4"><center>공지사항이 없습니다</center></td></tr>
                  	<%}
                  %>
                  </tbody>
               </table>

				
				</div>
			</div>

         <div class="container"> <br>
            <div class="row row-offcanvas row-offcanvas-right">
               <div class="row">
<<<<<<< HEAD
                  <div class="col-xs-6 col-md-4">
=======
                  <div class="col-xs-6 col-md-5">
>>>>>>> 1e37c7456117a7bed2107b809b36f8437d99e8ce
                               <div class="margin">
									<img src="static/images/1413979449_Heart.png" >
									<div class="margin2" style="position: absolute">
									<% if("NORMAL".equals(user.getRole())){
										if("FALSE".equals(user.getExpress())){%>
									<img src="images/MessageOff.jpg" width="50" height="50" alt="...">
									<%}else if("TRUE".equals(user.getExpress())){%>		
									<a href="checkExpress.do?user_id=<%=user.getUser_id()%>"><img src="images/MessageOn.jpg" width="50" height="50" alt="..."></a>
									<%} }%>
									
									</div>
					</div>
                  </div>
					
               </div>
            </div>
         </div>

    
<<<<<<< HEAD
<div class="row font-style">
=======
<div class="row">
>>>>>>> 1e37c7456117a7bed2107b809b36f8437d99e8ce
            <div class="col-lg-12">
                <center><h2 class="text1">Services</h2></center><br>
            </div>
            <div class="col-lg-4 col-sm-6 text-center">        
        
                
<<<<<<< HEAD
         	<input type= "image" class="img-circle img-responsive img-center margin4" src="static/images/1413905006_film.png" onClick="top.location.href='cctv_client.do'">
                  <h3><font face="'Jeju Gothic', serif">CCTV</font>
                    <small>cctv</small>
                </h3>
      
            </div>
            <div class="col-lg-4 col-sm-6 text-center">
                <input type= "image" class="img-circle img-responsive img-center margin4" src="static/images/1413906357_aiga_bus_on_grn_circle-128.png" onClick="top.location.href='user_parking.do'">
                <h3><font face="'Jeju Gothic', serif">주차장</font>
                    <small>parking</small>
                </h3>
            
            </div>
            <div class="col-lg-4 col-sm-6 text-center">
                <input type= "image" class="img-circle img-responsive img-center margin4" src="static/images/1413905591_graph.png" onClick="top.location.href='user_tax.do'">
                <h3><font face="'Jeju Gothic', serif">관리비</font>
                    <small>tax</small>
                </h3>
          
            </div>
            <div class="col-lg-4 col-sm-6 text-center margin6">
                <input type= "image" class="img-circle img-responsive img-center margin4" src="static/images/1413907084_flat_icons-graficheria.it-11.png" onClick="top.location.href='noticeBoard.do'">
                <h3><font face="'Jeju Gothic', serif">게시판</font>
                    <small>board</small>
                </h3>
                <p></p>
            </div>
            <div class="col-lg-4 col-sm-6 text-center margin6">
              <% if(user != null){
               if("NORMAL".equals(user.getRole())){%>
                <input type= "image"class="img-circle img-responsive img-center margin4" src="static/images/1413906531_man.png"  onClick="top.location.href='user_visitor.do'">
                 <%} else if("MANAGER".equals(user.getRole())){ %>
                    <input type= "image" class="img-circle img-responsive img-center margin4" src="static/images/1413906531_man.png"  onClick="top.location.href='manage_visitor.do'">
                  <%}} %>
                <h3><font face="'Jeju Gothic', serif">방문객</font>
                    <small>visitor</small>
                </h3>
                <p></p>
            </div>
            <div class="col-lg-4 col-sm-6 text-center margin6">
             <% if(user != null){
               if("NORMAL".equals(user.getRole())){%>

                <input type= "image" class="img-circle img-responsive img-center margin4" src="static/images/1413905939_Messages-128.png" onClick="top.location.href='chat_server.do'">
                  <h3><font face="'Jeju Gothic', serif">소통의 장</font>
                    <small>chatting</small>
                </h3>
                 <%}else if("MANAGER".equals(user.getRole())){ %>
                     <input type= "image" class="img-circle img-responsive img-center margin4" src="static/images/1413907570_open-box.png" onClick="top.location.href='expressList.do'">
                    
                <h3><font face="'Jeju Gothic', serif">택배</font>
                    <small>express</small>
                </h3>
               <%}} %>
=======
                <img class="img-circle img-responsive img-center" src="static/images/1413905006_film.png" onClick="top.location.href='cctv_client.do'">
                  <h3>CCTV
                    <small>Job Title</small>
                </h3>
                <p>What does this team member to? Keep it short! This is also a great spot for social links!</p>
            </div>
            <div class="col-lg-4 col-sm-6 text-center">
                <img class="img-circle img-responsive img-center" src="static/images/1413906357_aiga_bus_on_grn_circle-128.png" onClick="top.location.href='user_parking.do'">
                <h3>주차장
                    <small>Job Title</small>
                </h3>
                <p>What does this team member to? Keep it short! This is also a great spot for social links!</p>
            </div>
            <div class="col-lg-4 col-sm-6 text-center">
                <img class="img-circle img-responsive img-center" src="static/images/1413905591_graph.png" onClick="top.location.href='user_tax.do'">
                <h3>관리세
                    <small>Job Title</small>
                </h3>
                <p>What does this team member to? Keep it short! This is also a great spot for social links!</p>
            </div>
            <div class="col-lg-4 col-sm-6 text-center">
                <img class="img-circle img-responsive img-center" src="static/images/1413907084_flat_icons-graficheria.it-11.png" onClick="top.location.href='noticeBoard.do'">
                <h3>게시판
                    <small>Job Title</small>
                </h3>
                <p>What does this team member to? Keep it short! This is also a great spot for social links!</p>
            </div>
            <div class="col-lg-4 col-sm-6 text-center">
              <% if(user != null){
               if("NORMAL".equals(user.getRole())){%>
                <img class="img-circle img-responsive img-center" src="static/images/1413906531_man.png"  onClick="top.location.href='user_visitor.do'">
                 <%} else if("MANAGER".equals(user.getRole())){ %>
                    <img class="img-circle img-responsive img-center" src="static/images/1413906531_man.png"  onClick="top.location.href='manage_visitor.do'">
                  <%}} %>
                <h3>방문객
                    <small>Job Title</small>
                </h3>
                <p>What does this team member to? Keep it short! This is also a great spot for social links!</p>
            </div>
            <div class="col-lg-4 col-sm-6 text-center">
             <% if(user != null){
               if("NORMAL".equals(user.getRole())){%>

                <img class="img-circle img-responsive img-center" src="static/images/1413905939_Messages-128.png" onClick="top.location.href='chat_server.do'">
                 <%}else if("MANAGER".equals(user.getRole())){ %>
                     <img class="img-circle img-responsive img-center" src="static/images/1413907570_open-box.png" onClick="top.location.href='expressList.do'">
                     <%}} %>
                <h3>소통의 장
                    <small>Job Title</small>
                </h3>
                <p>What does this team member to? Keep it short! This is also a great spot for social links!</p>
>>>>>>> 1e37c7456117a7bed2107b809b36f8437d99e8ce
            </div>
        </div><br><br>
        
     </div>
     </div>
     
        
    
	
	<div class="navbar-fixed-bottom"><center>
			<h2>Between Apartment System</h2>
             <p class="lead">This is Smart Building <a target="_blank" href="http://join.deathtothestockphoto.com/">Death to the Stock Photo</a>.</p></center>
		</div>

   <!--/.row-->
 
</body>
</html>