<%@page import="kr.ac.apart.vo.UserVO"%>
<%@page import="kr.ac.apart.vo.Visit_RecordVO"%>
<%@page import="java.util.List"%>
<%@page import="kr.ac.apart.vo.VisitorVO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<meta http-equiv="X-UA-Compatible" content="IE=Edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<script src="static/js/jquery-1.11.1.js"></script>
<script src="static/js/bootstrap.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/respond.js/1.4.2/respond.min.js"></script>
<link href="static/css/bootstrap.css" rel="stylesheet" type="text/css">
<link href="static/css/style.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css" href="style.css" media="only and (min-width: 360px) and (max-width: 768px)" id="stylesheet-768" />
<link rel="stylesheet" type="text/css" href="style.css" media="only and (min-width: 768px)" id="stylesheet-1200" />
<title>관리자_방문일지</title>
</head>

<body>
	<div class="container font-style">

		<!-- main area -->
		<div class="navbar-form navbar-center">
			<form action="addVisitorManager.do" class="navbar-form navbar-left" method="post">
				<div class="form-group">
					<input type="text" class="form-control input-text-style" placeholder="동/호수" size="19" id="user_id" name="user_id"> &nbsp;&nbsp;&nbsp;&nbsp; 
					<input type="text"class="form-control input-text-style" placeholder="방문자 신분" size="19" id="visitor_name" name="visitor_name"> &nbsp;&nbsp;&nbsp;&nbsp; 
					<input type="text" class="form-control input-text-style" placeholder="용무" size="48" id="business" name="business">&nbsp;

					<button type="submit" class="btn button-style" id="addVisitorManagerButton">입력</button>
				</div>
			</form>
		</div>
		
		<form class="navbar-form navbar-right">
			<div class="form-group">
				<input type="text" class="form-control input-text-style" placeholder="동/호수" size="20%" align="center" name="user_id" id="searchUserId">
			</div>

			<button type="button" class="btn button-style" id="searching">검색</button>
		</form>

		<div class="col-xs-12 col-md-12">
			<div class="panel panel-default">

				<!-- Default panel contents -->
				<div class="panel-heading" id="panel-style">
					<center>세대주 방문객 리스트</center>
				</div>

				<!-- Table -->
				<table class="table table-bordered table-style" id="visitorTable">
					<thead class="head">
						<tr>
							<th><center>동/호수</center></th>
							<th><center>방문자신분</center></th>
							<th><center>용무</center></th>
							<th><center>고정/일시</center></th>
							<th><center>입력</center></th>
						</tr>
					</thead>

					<tbody id="searchVisitor" class="body">
						<tr>
							<td colspan="5"><center>세대주를 검색해주세요</center></td>
						</tr>
					</tbody>
				</table>
			</div> <br>

			<!-- 방문 기록 리스트 테이블 -->
			<div class="panel panel-default">
				<!-- Default panel contents -->
				<div class="panel-heading" id="panel-style">
					<center>방문 기록 리스트</center>
				</div>

				<!-- Table -->
				<table class="table table-bordered table-style" id="visitRecordTable">
					<thead class="head">
						<tr>
							<th><center>동/호수</center></th>
							<th><center>방문자신분</center></th>
							<th><center>용무</center></th>
							<th><center>날짜</center></th>
							<th><center>수정/삭제</center></th>
						</tr>
					</thead>

					<tbody id="body">
						<tr id="add">
							<%
								List<Visit_RecordVO> visitRecord = (List<Visit_RecordVO>) request.getAttribute("visitRecord");
								List<VisitorVO> visitorListAll = (List<VisitorVO>) request.getAttribute("visitorList");

								if (visitorListAll != null) {
									for (Visit_RecordVO vr : visitRecord) {
										for (VisitorVO v : visitorListAll) {
											if (v.getVisitor_no() == vr.getVisitor_no()) {
							%>
						<tr id="<%=v.getVisitor_no()%>" class="<%=vr.getVisit_record_no()%>">
							<td class="textId"><center><%=v.getUser_id()%></center></td>
							<td class="textName"><center><%=v.getVisitor_name()%></center></td>
							<td class="textBusiness"><center><%=v.getBusiness()%></center></td>
							<td class="textRegDate"><center><%=vr.getReg_date()%></center></td>
							<td class="textButton"><center><button type="button" class="btn button-style modifyVisitRecord" value="<%=vr.getVisit_record_no()%>">수정</button>
														<button type="button" class="btn button-delete-style deleteVisitRecord" value="<%=vr.getVisit_record_no()%>">삭제</button></center></td>
						</tr>
						<%
											}
										}
									}
								}
							if (visitRecord.size() == 0) {
						%>
								<td colspan="5"><center>방문기록이 없습니다</center></td>
						<%
							}
						%>
					</tbody>
				</table>
			</div>
			<%
				int currentPage = (Integer) request.getAttribute("page");
				int countVisitRecord = (Integer) request.getAttribute("countVisitRecord");

				if (countVisitRecord != 0) {
			%>
			<div align="center">
				<ul class="pagination">
					<li><a href="manage_visitor.do">&laquo;</a></li>
					<%
						int j = 1; //페이지수
						int a = 0; //마지막페이지
						for (int i = 0; i < countVisitRecord; i += 5) {
					%>
							<li><a href="manage_visitor.do?page=<%=i%>"><%=j%></a></li>
					<%
							j++;
							a = i;
						}
					%>
					<li><a href="manage_visitor.do?page=<%=a%>">&raquo;</a></li>

					<!--<li><a href="manage_visitor.do?page=${page+5}">3</a></li>-->
				</ul>
			</div>
			<%} %>
		</div>
	</div>

	<script type="text/javascript">

	$("#searching").on('click', function() {
		$("#visitorTable tr:not(:first)").remove(); //테이블의 첫행(여기서는 head)빼고 모두 삭제
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
				var i = 0;
				rowCount = 0;
				var key, count = 0;
				for(key in data.visitorListModel) {    //get size of json object
				  if(data.visitorListModel.hasOwnProperty(key)) {
				    count++;
				  }
				}
				if(count == 0){
					content += "<tr><td colspan='5'><center>일치하는 검색결과가 없습니다.</center></td></tr>";
				}

				$.each(data.visitorListModel, function(key, visitor) {
					i++;
					rowCount++;
					content += "<tr class='"+ visitor.visitor_no + "' id='user_no' name='user_no' value='"+ visitor.visitor_no + "'>";
					//content += "<td id='rowCount" + rowCount + "'><center>"+ rowCount + "</center></td>";
					content += "<td id='userId" + i + "'><center>" + visitor.user_id + "</center></td>";
					content += "<td id='visitorName" + i + "'><center>" + visitor.visitor_name + "</center></td>";
					content += "<td id='business" + i + "'><center>" + visitor.business + "</center></td>";
						
					if (visitor.fixed == "UNFIXED") {
						content += "<td id='fixed" + i + "'><center>" + '일시' + "</center></td>";
					} else if (visitor.fixed == "FIXED") {
						content += "<td id='fixed" + i + "'><center>" + '고정' + "</center></td>";
					}
					content += "<td><center><button type='submit' class='btn button-style' id='insertButton" + i + "' onClick='location.href=\"insertVisit.do?user_no="+visitor.visitor_no+"\"'>" + '입력' + "</button></center></td></tr>";
				});
				$("#searchVisitor").append(content);
			},
			error : function(request, status, error) {
				alert("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
			}
		});
	});

	$(document).on('click', '.deleteVisitRecord', function() { //삭제버튼 클릭시
		var clickedRow = $(this).closest('tr'); //클릭한 tr 가져오기
		$.ajax({
			url : "deleteVisitRecord.do",
			type : "get",
			dataType : "json",
			data : {
				visitRecordNo : $(this).closest('button').attr('value'),
			},
			contentType : "application/json; charset=utf-8",
			success : function(data) {
				clickedRow.remove();
			},
			error : function(e) {
				alert("error!");
			}
		});
	});
	
	$(document).on('click', '.modifyVisitRecord', function(){    //수정버튼 클릭시
		var textNo = $(this).closest("tr").attr("id");
		var textId = $(this).closest("tr").find(".textId").text();             //td값 가져오기
		var textName = $(this).closest("tr").find(".textName").text();
		var textBusiness = $(this).closest("tr").find(".textBusiness").text();
		var textRegDate = $(this).closest("tr").find(".textRegDate").text();
		 
		var idLocation = $(this).closest("tr").find('.textId');               //td 위치
		var nameLocation = $(this).closest("tr").find('.textName');
		var businessLocation = $(this).closest("tr").find('.textBusiness');
		var regDateLocation = $(this).closest("tr").find('.textRegDate');
		var buttonLocation = $(this).closest("tr").find('.textButton');
		
		$(this).closest("tr").find(".textId").empty();                  //td에 있는 데이터 지우기
		$(this).closest("tr").find(".textName").empty();
		$(this).closest("tr").find(".textBusiness").empty();
		$(this).closest("tr").find(".textRegDate").empty();
		$(this).closest("tr").find(".textButton").empty();
		
		$('<center><input type="text" id="textUserId" value='+textId+' style = "text-align:center;"></center>').appendTo(idLocation);    //td 위치에 넣기
		$('<center><input type="text" id="textUserName" value='+textName+' style = "text-align:center;"></center>').appendTo(nameLocation);
		$('<center><input type="text" id="textUserBusiness" value='+textBusiness+' style = "text-align:center;"></center>').appendTo(businessLocation);
		$('<center><input type="text" id="textRegDate" value='+textRegDate+' style = "text-align:center;"></center>').appendTo(regDateLocation);
		$('<center><button type="button" class="btn button-style visitorModify">확인</button></center>').appendTo(buttonLocation);			
	});
	
	$(document).on('click', '.visitorModify', function(){       //수정버튼 누른 후 확인
		var textId = $(this).closest("tr").find(".textId");
		var textName = $(this).closest("tr").find(".textName");
		var textBusiness = $(this).closest("tr").find(".textBusiness");
		var textRegDate = $(this).closest("tr").find(".textRegDate");
		var textButton = $(this).closest("tr").find(".textButton");	
		
		$.ajax({
			url : "visitorModify.do",
			type : "get",
			dataType : "json",
			data : {
				visitRecordNo : $(this).closest("tr").attr("class"),
				visitorNo : $(this).closest("tr").attr("id"),
				visitorId : $(this).closest("tr").find("#textUserId").val(),
				visitorName : $(this).closest("tr").find("#textUserName").val(),
				visitorBusiness : $(this).closest("tr").find("#textUserBusiness").val(),
				visitorRegDate : $(this).closest("tr").find("#textRegDate").val()
			},
			contentType : "application/json; charset=utf-8",
			success : function(data) {
				alert("success!");
				textId.empty();                  //td에 있는 데이터 지우기
				textName.empty();
				textBusiness.empty();
				textRegDate.empty();
				textButton.empty();
				$('<center><td>' + data.visitorId + '</td></center>').appendTo(textId);
				$('<center><td>' + data.visitorName + '</td></center>').appendTo(textName);
				$('<center><td>' + data.visitorBusiness + '</td></center>').appendTo(textBusiness);
				$('<center><td>' + data.visitorRegDate + '</td></center>').appendTo(textRegDate);
				$('<center><td><button type="button" class="btn button-style modifyVisitRecord">수정</button> <button type="button" class="btn button-style deleteVisitRecord">삭제</button></td></center>').appendTo(textButton);
			},
			error : function(e) {
				alert("error!");
			}
		});

	});
	
	function notUserId(){
		alert("일치하는 세대주가 없습니다.");
		location.replace("manage_visitor.do"); 
	}
	
	//==================================================================================
	//var rowCount; //동적으로 생성된 table row 갯수 선언
	//세대주의 동,호수/방문객이름/방문객용무를 직접 입력한 후 ajax로 방문기록 테이블에 붙이기
	/* $("#addVisitorManagerButton").on('click', //동,호수 , 이름, 용무 입력 후 추가 버튼 클릭시
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
				alert("success");
				//countVisitRecord = countVisitRecord + 1;
				var reg = data.add2;
				$("#add").after(//append는 선택자의 자식한테 붙고 after는 같은 레벨의 형제.
					"<tr><td class><center>"
					+ data.add.user_id
					+ "</center></td><td><center>"
					+ data.add.visitor_name
					+ "</center></td><td><center>"
					+ data.add.business
					+ "</center></td><td><center>"
					+ reg
					+ "</center></td><td><center><button type='button' class='btn btn-default visitorModify' value='" + data.recordNo +"'>"
					+ '수정'
					+ "</button>"
					+ '  '
					+ "<button type='button' class='btn btn-default deleteVisitRecord' value='"+data.recordNo+"'>"
					+ '삭제'
					+ "</button></center></td></tr>");
			},
			error : function(e) {
				alert("error");
			}
		});
	}); */
	
	//===============================================================================================
	//검색된 세대주의 방문객을 방문객리스트에 넣기
	/* for ( var i = 1; i < 10; i++) {
	$(document).on('click', '#insertButton' + i, function() { //검색된 방문객 방문객리스트에 추가
		var trid = $(this).closest('tr').attr('id'); //클릭한 행 tr의 id
		$.ajax({
			url : "insertVisit.do",
			type : "get",
			dataType : "json",
			data : {
				insertUserNo : $(this).closest('tr').attr('class'),
				insertUserId : $("#visitorTable #userId"+ trid).text(),
				insertVisitorName : $("#visitorTable #visitorName" + trid).text(),
				insertBusiness : $("#visitorTable #business" + trid).text()
			},
			contentType : "application/json; charset=utf-8",
			success : function(data) {
				alert("success");
				$("#add").after(  //append는 선택자의 자식한테 붙고 after는 같은 레벨의 형제.
					"<tr><td><center>"
					+ data.user_id
					+ "</center></td><td><center>"
					+ data.visitor_name
					+ "</center></td><td><center>"
					+ data.business
					+ "</center></td><td><center>"
					+ data.regdate
					+ "</center></td><td><center><button type='button' class='btn btn-default modifyVisitRecord' value='" + data.recordNo +"'>"
					+ '수정'
					+ "</button>"
					+ '  '
					+ "<button type='button' class='btn btn-default deleteVisitRecord' value='" + data.recordNo +"'>"
					+ '삭제'
					+ "</button></center></td></tr>");
			},
			error : function(e) {
				alert("실패!");
			}
		});
	});
} */
	
</script>
</body>
</html>