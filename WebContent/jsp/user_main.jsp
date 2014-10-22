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
<script src="static/js/jquery-1.11.1.js"></script>
<link href="static/css/seulStyle.css" rel="stylesheet" type="text/css">
<title>메인</title>
</head>
<%
	UserVO user = (UserVO) session.getAttribute("UserFlag");
	List<BoardVO> noticeList = (List<BoardVO>) request.getAttribute("getNoticeList");
%>
<body>
	<div class="container">
		<div class="row row-offcanvas row-offcanvas-left">
			<div class="col-xs-10 col-sm-7"> <br>
				<div class="panel panel-default">
					
			
					
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
						%>
						</tbody>
					</table>
				</div>
			</div>

         <div class="container"> <br>
            <div class="row row-offcanvas row-offcanvas-right">
               <div class="row">
                  <div class="col-xs-6 col-md-3">
                     <div style="position:relative">
									<img src="images/profile.jpg" data-src="holder.js/100%x180" alt="...">
									<div style="position: absolute">
									<% if("NORMAL".equals(user.getRole())){
										if("FALSE".equals(user.getExpress())){%>
									<img src="images/MessageOff.jpg" width="50" height="50" alt="...">
									<%}else if("TRUE".equals(user.getExpress())){%>		
									<a href="checkExpress.do?user_id=<%=user.getUser_id()%>"><img src="images/MessageOn.jpg" width="50" height="50" alt="..."></a>
									<%} }%>
									</div>
					</div>
                  </div>
					<span class="glyphicon glyphicon-off"><a href="logout.do">로그아웃</a></span>
               </div>
            </div>
         </div>

		<!-- main area -->
		<div class="col-xs-12 col-sm-4"> <br>
			<button type="button" class="btn btn-default btn-lg button1" onClick="top.location.href='cctv_client.do'">
				<span class="glyphicon glyphicon-facetime-video"></span> CCTV
			</button> <br>
		</div>

		<div class="col-xs-12 col-sm-4"> <br>
			<button type="button" class="btn btn-default btn-lg button1" onClick="top.location.href='user_parking.do'">
				<span class="glyphicon glyphicon-star"></span> 주차장
			</button>
		</div>

		<div class="col-xs-12 col-sm-4"> <br>
			<button type="button" class="btn btn-default btn-lg button1" onClick="top.location.href='user_tax.do'">
				<span class="glyphicon glyphicon-usd"></span> 관리세
			</button>
		</div>
			
         <div class="col-xs-12 col-sm-4"> <br>
            <button type="button" class="btn btn-default btn-lg button1" onClick="top.location.href='noticeBoard.do'">
               <span class="glyphicon glyphicon-align-justify"></span> 게시판
            </button>
         </div>

         <div class="col-xs-12 col-sm-4"> <br>
            <% if(user != null){
               if("NORMAL".equals(user.getRole())){%>
            <button type="button" class="btn btn-default btn-lg button1" onClick="top.location.href='user_visitor.do'">
               <span class="glyphicon glyphicon-user"></span> 방문객
            </button>
            <%} else if("MANAGER".equals(user.getRole())){ %>
            <button type="button" class="btn btn-default btn-lg button1" onClick="top.location.href='manage_visitor.do'">
               <span class="glyphicon glyphicon-user"></span> 방문객
            </button>
            <%}
            }%>
         </div>

         <div class="col-xs-12 col-sm-4"> <br>
            <% if(user != null){
               if("NORMAL".equals(user.getRole())){%>
            <button type="button" class="btn btn-default btn-lg button1" onClick="top.location.href='noticeBoard.do'">
               <span class="glyphicon glyphicon-heart-empty"></span> 소통의 장
            </button>
            <%}else if("MANAGER".equals(user.getRole())){ %>
            <button type="button" class="btn btn-default btn-lg button1" onClick="top.location.href='expressList.do'">
               <span class="glyphicon glyphicon-heart-empty"></span> 택배관리
            </button>
            <%}
            } %>
         </div>
      </div>
      <br>
      <!-- /.col-xs-12 main -->
		<div class="col-xs-12 col-md-12 col-sm-12">
			<div id="footer">
				<div class="panel panel-default">
			         <div class="panel-body">
			         	콘텐츠에 대한 저작권은 주식회사 Allready, 이하 내용 및 이미지의 무단복제를 금합니다.
				           <br>ⓒAllready Inc. All rights reseved
		            </div>
		       	</div>	
			</div>
		</div>
	</div>
   <!--/.row-->
   <hr>
</body>
</html>