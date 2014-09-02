<%@page import="java.util.List"%>
<%@page import="kr.ac.apart.vo.UserVO"%>
<%@page import="kr.ac.apart.vo.VisitorVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>세대주_방문객</title>
<script src="static/js/bootstrap.js"></script>
<script src="static/js/jquery-1.11.1.js"></script>
<script src="static/js/bootstrap.min.js"></script>
<link href="static/css/bootstrap.min.css" rel="stylesheet" type="text/css">
<link href="static/css/style.css" rel="stylesheet" type="text/css">
</head>
<body>
	<div class="container">
		<div class="col-md-5 col-md-offset-7">
		<form action="addVisitor.do" class="navbar-form navbar-left" method="post">
			<input type="checkbox" class="checkbox inline" name="fixed">&nbsp;&nbsp;
			<h4 class="text inline">고정방문객</h4>
		</div>
		
		<div class="col-md-4 col-md-offset-7 "> <br>
			<div class="input-group">
			  <span class="input-group-addon">이름</span>
			  <input type="text" class="form-control" placeholder="이름" name="visitor_name">
			</div>
			<div class="input-group">
			  <span class="input-group-addon">용무</span>
			  <input type="text" class="form-control" placeholder="용무" name="business">
			</div>
		</div>
		<br><br><br><br>
		<div class=".col-md-1">
			<button type="submit" class="btn btn-primary" id="visitor_submit_btn">등록</button>
		</div>
	</form>
	<br>
	
	 <form action="deleteVisitor.do">
	<div class="table-responsive">
            <table class="table table-striped">
              <thead>
                <tr>
                  <th>동/호수</th>
                  <th>방문객이름</th>
                  <th>용무</th>
                  <th>고정/일시</th>
                  <th>삭제</th>
                </tr>
              </thead>
              <tbody>
    <!-- <form action="deleteVisitor.do">    -->     
	<%
	List<VisitorVO> visitorList = (List<VisitorVO>)request.getAttribute("VisitorFlag");
	
	for(VisitorVO vo : visitorList){ %>
                <tr>
                  <td><center><%=vo.getUser_id() %></center></td>
                  <td><center><%=vo.getVisitor_name() %></center></td>
                  <td><center><%=vo.getBusiness() %></center></td>
                  <% if(vo.getFixed().equals("FIXED")){%>
                  	<td><center>고정</center></td>
                  	<%}else if(vo.getFixed().equals("UNFIXED")){ %>
                  	<td><center>일시</center></td>
                  	<%} %>
                  	 <td><button type="submit" class="btn btn-primary" name="name" value="<%=vo.getVisitor_no()%>">삭제</button></td>
                   </tr>
                <%} %>
              </tbody>
            </table>
            </form>
          </div>
      </div>
</body>
</html>