<%@page import="kr.ac.apart.vo.Visit_RecordVO"%>
<%@page import="java.util.List"%>
<%@page import="kr.ac.apart.vo.VisitorVO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<script src="static/js/bootstrap.js"></script>
<script src="static/js/jquery-1.11.1.js"></script>
<script src="static/js/bootstrap.min.js"></script>
<link href="static/css/bootstrap.min.css" rel="stylesheet"
	type="text/css">
<link href="static/css/style.css" rel="stylesheet" type="text/css">
<script src="static/js/jquery-1.11.1.js"></script>
<title>관리자_방문일지</title>
</head>
<body>
	<div class="container">
		<!-- main area -->
		<div class=" col-xs-3 col-sm-9">
			<div class="navbar-form navbar-center" role="search">
				<div class="form-group">
					<input type="text" class="form-control" placeholder="동/호수" size="19" id="user_id">
						&nbsp;&nbsp;&nbsp;&nbsp; 
						<input type="text" class="form-control" placeholder="방문자 신분" size="19" id="visitor_name">
						&nbsp;&nbsp;&nbsp;&nbsp;
						<input type="text" class="form-control inline" placeholder="용무" size="48" id="business">&nbsp;
					<button type="button" class="btn btn-default inline" id="addVisitorManagerButton">입력</button>
				</div>
			</div>
		</div>
		<br> <br> <br>

		<form class="navbar-form navbar-right" role="search"
			action="getVisitor.do">
			<div class="form-group">
				<input type="text" class="form-control" placeholder="방문자 신분"
					size="20%" align="center" name="user_id">
			</div>
			<button type="submit" class="btn btn-default">검색</button>
		</form>
		<br> <br>

		<div class="col-sm-12 col-xs-12">
			<div class="panel panel-default">
				<!-- Default panel contents -->
				<div class="panel-heading">
					<center>세대주 방문객 리스트</center>
				</div>

				<!-- Table -->
				<table class="table">
					<thead>
						<tr>
							<th><center>동/호수</center></th>
							<th><center>방문자신분</center></th>
							<th><center>용무</center></th>
							<th><center>고정/일시</center></th>
							<th><center></center>
						</tr>
					</thead>
						<tbody>
							<%
								List<VisitorVO> visitorList = (List<VisitorVO>) request
										.getAttribute("VisitorManagerFlag");

								if (visitorList != null) {
									if (visitorList.size() == 0) {
							%>
							<tr>
								<td colspan="5"><center>일치하는 검색결과가 없습니다.</center></td>
							</tr>
							<%
								} else {
										for (VisitorVO vo : visitorList) {
							%>
							<tr>
								<td id="user_id2"><center><%=vo.getUser_id()%></center></td>
								<td id="visitor_name2"><center><%=vo.getVisitor_name()%></center></td>
								<td id="business2"><center><%=vo.getBusiness()%></center></td>
								<%
									if (vo.getFixed().equals("FIXED")) {
								%>
								<td><center>고정</center></td>
								<%
									} else if (vo.getFixed().equals("UNFIXED")) {
								%>
								<td><center>일시</center></td>
								<%
									}
								%>
								<td><center>
										<button type="button" class="btn btn-default" id="insertVisit">입력</button>
									</center></td>
							</tr>
							<%
								}
									}
								} else if (visitorList == null) {
							%><tr>
								<td colspan="5"><center>검색어를 입력해주세요.</center></td>
							</tr>
							<%
								}
							%>
						</tbody>
				</table>
			</div>
			<br>

			<div class="panel panel-default">
				<!-- Default panel contents -->
				<div class="panel-heading">
					<center>방문 기록 리스트</center>
				</div>


				<!-- Table -->
				 	<table class="table" >
				 <tr>
					<th><center>동호수</center></th>
					<th><center>방문자신분</center></th>
					<th><center>용무</center></th>
					<th><center>날짜</center></th>
				</tr>
				<tr id="add">

				<% List<Visit_RecordVO> visitRecord = (List<Visit_RecordVO>)request.getAttribute("visitRecord"); 
					List<VisitorVO> visitorListAll = (List<VisitorVO>)request.getAttribute("visitorList");
					
					if(visitorListAll != null){
						for(Visit_RecordVO vr : visitRecord){
							for(VisitorVO v : visitorListAll ){
							
								if(v.getVisitor_no() == vr.getVisitor_no()){%>
									<tr>
										<td><center><%=v.getUser_id() %></center></td>
										<td><center><%=v.getVisitor_name() %></center></td>
										<td><center><%=v.getBusiness() %></center></td>
										<td><center><%=vr.getReg_date() %></center></td>
									</tr>
				
						<%}}}} %>
				
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
					</ul>
				</div>
			</div>
			<!-- /.col-xs-12 main -->
		</div>
		<!--/.row-->
	</div>
	<!--/.container-->
	</div>
	<!--/.page-container-->
</body>

<script type="text/javascript">
	$("#addVisitorManagerButton").on('click',function(){
			var a = $("#user_id").val();
			var b = $("#visitor_name").val();
			var c = $("#business").val();
			
			$.ajax({
				url : "addVisitorManager.do",
				type : "get",
				dataType : "json",
				data : {				
					user_id : a,
					visitor_name : b,
					business : c
				},
				contentType : "application/json; charset=utf-8",
				success : function(data) {
					var reg = data.add2;
					$("#add").after(   //append는 선택자의 자식한테 붙고 after는 같은 레벨의 형제.
							"<tr><td><center>" + data.add.user_id + "</center></td><td><center>"
									+ data.add.visitor_name + "</center></td><td><center>"
									+ data.add.business + "</center></td><td><center>"
									+ reg + "</center></td></tr>"
					);
				},
				 error:function(e){  
			            alert(e.responseText);  
			      }  
				
			});
		});
</script>
</html>