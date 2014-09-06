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
					<input type="text" class="form-control" placeholder="동/호수"
						size="19" id="user_id"> &nbsp;&nbsp;&nbsp;&nbsp; <input
						type="text" class="form-control" placeholder="방문자 신분" size="19"
						id="visitor_name"> &nbsp;&nbsp;&nbsp;&nbsp; <input
						type="text" class="form-control inline" placeholder="용무" size="48"
						id="business">&nbsp;
					<button type="button" class="btn btn-default inline"
						id="addVisitorManagerButton">입력</button>
				</div>
			</div>
		</div>
		<br> <br> <br>

		<form class="navbar-form navbar-right" role="search">
			<div class="form-group">
				<input type="text" class="form-control" placeholder="방문자 신분"
					size="20%" align="center" name="user_id" id="searchUserId">
			</div>
			<button type="button" class="btn btn-default" id="searching">검색</button>
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
							<th><center>입력</center></th>
						</tr>
					</thead>

					<tbody id = "searchVisitor">
					
						<%-- <%
							int i=0;    //버튼과 td마다 다른 class명을 주기위해 +i를 해줄 예정
								List<VisitorVO> visitorList = (List<VisitorVO>) request.getAttribute("VisitorManagerFlag");
								if (visitorList != null) {
									if (visitorList.size() == 0) {
						%>
						<tr>
							<td colspan="5"><center>일치하는 검색결과가 없습니다.</center></td>
						</tr>
						<%
						}
						else {
					 		
							for (VisitorVO vo : visitorList) {
								i++;
						%>
						<tr>
							<td class = "userId<%=i%>"><center><%=vo.getUser_id()%></center></td>
							<td class = "visitorName<%=i%>"><center><%=vo.getVisitor_name()%></center></td>
							<td class = "business<%=i%>"><center><%=vo.getBusiness()%></center></td>
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
									<button type="button"
										class="btn btn-default insertVisitButton[<%=i%>]">입력</button>
								</center></td>
						</tr>
						<%
								}
							 }
									}
								 else if (visitorList == null) {
						%>
						<tr>
							<td colspan="5"><center>검색어를 입력해주세요.</center></td>
						</tr>
						<%
								}
						%>
					</tbody> --%>

				</table>
			</div>
			<br>

			<!-- 방문 기록 리스트 테이블 -->
			<div class="panel panel-default">
				<!-- Default panel contents -->
				<div class="panel-heading">
					<center>방문 기록 리스트</center>
				</div>

				<!-- Table -->
				<table class="table" id="test">
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
<script type="text/javascript" src="springboard/js/jquery-1.8.0.js" charset="utf-8"></script>
<script type="text/javascript">
	
$("#addVisitorManagerButton").on('click',    //동,호수 , 이름, 용무 입력 후 추가 버튼 클릭시
			function() { //직접 입력
				$.ajax({
					url : "addVisitorManager.do",
					type : "get",
					dataType : "json",
					data : {
						user_id : $("#user_id").val(),
						visitor_name : $("#visitor_name").val(),
						business : $("#business").val()
					},
					contentType : "application/json; charset=utf-8",
					success : function(data) {
						var reg = data.add2;
						$("#add").after(
								//append는 선택자의 자식한테 붙고 after는 같은 레벨의 형제.
								"<tr><td><center>" + data.add.user_id
										+ "</center></td><td><center>"
										+ data.add.visitor_name
										+ "</center></td><td><center>"
										+ data.add.business
										+ "</center></td><td><center>" + reg
										+ "</center></td></tr>");
					},
					error : function(e) {
						alert(e.responseText);
					}

				});
			});

	$("#searching").on('click', function() {
		$.ajax({
			url : "getVisitor.do",
			type : "get",
			dataType : "json",
			data : {
				userId3 : $("#searchUserId").val(),
			},
			contentType : "application/json; charset=utf-8",
			success : function(data) {
			var content = "";		
			var i=0;
				$.each(data.visitorListModel, function(key,visitor) {			
						i++;
						content += "<tr>";
						content += "<td id='userId" + i + "'><center>" + visitor.user_id + "</center></td>";
						content += "<td id='visitorName" + i + "'><center>" + visitor.visitor_name + "</center></td>";
						content += "<td id='business" + i + "'><center>" +visitor.business + "</center></td>";
						if(visitor.fixed == "UNFIXED"){
							content += "<td id='fixed" + i + "'><center>" + '일시' + "</center></td>";
						}
						else if(visitor.fixed == "FIXED"){
							content += "<td id='fixed" + i + "'><center>" + '고정' + "</center></td>";
						}
						content += "<td><center><button type='button' class='btn btn-default insertButton' >" + '입력' + "</button></center></td></tr>";
				});
				$("#searchVisitor").append(content);
			},
			error:function(request,status,error){
                alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			}
		});
	});

	
	
	$(".insertButton").onClick(function() {
		  alert( "Handler for .click() called." );
		});
	//githubnnnn
	/* $("#insertbutton1").click(function() { //검색된 방문객 방문객리스트에 추가
		alert("a");
	
		 $.ajax({
			url : "insertVisit.do",
			type : "get",
			dataType : "json",
			data : {
				insertUserId : $("#userId1").val(),
				insertVisitorName : $("#visitorName1").val(),
				insertBusiness : $("#business1").val()
			},
			contentType : "application/json; charset=utf-8",
			success : function(data) {
				alert("success!");
				  var reg = data.add2;
				$("#add").after(
						//append는 선택자의 자식한테 붙고 after는 같은 레벨의 형제.
						"<tr><td><center>" + data.add.user_id
								+ "</center></td><td><center>"
								+ data.add.visitor_name
								+ "</center></td><td><center>"
								+ data.add.business
								+ "</center></td><td><center>" + reg
								+ "</center></td></tr>");  
			},
			error : function(e) {
				alert(e.responseText);
			}
		}); 
	}); */
</script>
</html>