<%@page import="kr.ac.apart.vo.Visit_RecordVO"%>
<%@page import="java.util.List"%>
<%@page import="kr.ac.apart.vo.VisitorVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="static/js/bootstrap.js"></script>
<script src="static/js/jquery-1.11.1.js"></script>
<script src="static/js/bootstrap.min.js"></script>
<link href="static/css/bootstrap.css" rel="stylesheet" type="text/css">
<link href="static/css/style.css" rel="stylesheet" type="text/css">
<script
	src="//cdnjs.cloudflare.com/ajax/libs/respond.js/1.4.2/respond.min.js"></script>
<title>관리자_방문일지</title>
</head>
<body>
	<div class="container">
		<!-- main area -->
		<div class="navbar-form navbar-center" role="search">
			<div class="form-group">
				<input type="text" class="form-control" placeholder="동/호수" size="19"
					id="user_id"> &nbsp;&nbsp;&nbsp;&nbsp; <input type="text"
					class="form-control" placeholder="방문자 신분" size="19"
					id="visitor_name"> &nbsp;&nbsp;&nbsp;&nbsp; <input
					type="text" class="form-control inline" placeholder="용무" size="48"
					id="business">&nbsp;
				<button type="button" class="btn btn-default inline"
					id="addVisitorManagerButton">입력</button>
			</div>
		</div>
		<!--  </div>-->
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
				<table class="table" id="visitorTable">
					<thead>
						<tr>
							<th><center>동/호수</center></th>
							<th><center>방문자신분</center></th>
							<th><center>용무</center></th>
							<th><center>고정/일시</center></th>
							<th><center>입력</center></th>
						</tr>
					</thead>

					<tbody id="searchVisitor">
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
				<table class="table" id="visitRecordTable">
					<tr>
						<th><center>동/호수</center></th>
						<th><center>방문자신분</center></th>
						<th><center>용무</center></th>
						<th><center>날짜</center></th>
						<th><center>수정/삭제</center></th>
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
						<td><center>
								<button type="button" class="btn btn-default" id="#"
									value="<%=vr.getVisit_record_no()%>">수정</button>
								<button type="button" class="btn btn-default deleteVisitRecord"
									value="<%=vr.getVisit_record_no()%>">삭제</button>
							</center></td>
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
            	   alert("success");
                  var reg = data.add2;
                  $("#add").after(
                        //append는 선택자의 자식한테 붙고 after는 같은 레벨의 형제.
                        "<tr><td><center>" + data.add.user_id
                              + "</center></td><td><center>"
                              + data.add.visitor_name
                              + "</center></td><td><center>"
                              + data.add.business
                              + "</center></td><td><center>" + reg
                              + "</center></td><td><center><button type='button' class='btn btn-default'  value='" + data.recordNo +"'>" + '수정' + "</button>" + '  ' + "<button type='button' class='btn btn-default deleteVisitRecord' value='"+data.recordNo+"'>" + '삭제' + "</button></center></td></tr>");
               },
               error : function(e) {
                  alert("error");
         
               }

            });
         });
         
   var rowCount;  //동적으로 생성된 table row 갯수 선언

   $("#searching").on('click', function() {
      $("#visitorTable tr:not(:first)").remove();   //테이블의 첫행빼고 모두 삭제
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
         rowCount = 0;
            $.each(data.visitorListModel, function(key,visitor) {         
                  i++;
                  rowCount++;
                  content += "<tr id='"+ rowCount +"' class='"+ visitor.visitor_no+ "'>";
                  //content += "<td id='rowCount" + rowCount + "'><center>"+ rowCount + "</center></td>";
                  content += "<td id='userId" + i + "'><center>" + visitor.user_id + "</center></td>";
                  content += "<td id='visitorName" + i + "'><center>" + visitor.visitor_name + "</center></td>";
                  content += "<td id='business" + i + "'><center>" +visitor.business + "</center></td>";
                  if(visitor.fixed == "UNFIXED"){
                     content += "<td id='fixed" + i + "'><center>" + '일시' + "</center></td>";
                  }
                  else if(visitor.fixed == "FIXED"){
                     content += "<td id='fixed" + i + "'><center>" + '고정' + "</center></td>";
                  }
                  content += "<td><center><button type='button' class='btn btn-default' id='insertButton" + i + "' >" + '입력' + "</button></center></td></tr>";
            });
            $("#searchVisitor").append(content);
         },
         error:function(request,status,error){
                alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
         }
      });
   });

   for(var i=1; i<5; i++){
   $(document).on('click','#insertButton'+i, function(){  //검색된 방문객 방문객리스트에 추가
      var trid=$(this).closest('tr').attr('id');    //클릭한 행 tr의 id
      alert(typeof rowCount);
      alert("trid : " + trid);
       $.ajax({
            url : "insertVisit.do",
            type : "get",
            dataType : "json",
            data : {
               insertUserNo : $(this).closest('tr').attr('class'),
               insertUserId : $("#visitorTable #userId"+trid).text(),
               insertVisitorName : $("#visitorTable #visitorName"+trid).text(),
               insertBusiness :  $("#visitorTable #business"+trid).text()
            },
            contentType : "application/json; charset=utf-8",
            success : function(data) {
               alert("success");
               $("#add").after(
                     //append는 선택자의 자식한테 붙고 after는 같은 레벨의 형제.
                     "<tr><td><center>" + data.user_id
                           + "</center></td><td><center>"
                           + data.visitor_name
                           + "</center></td><td><center>"
                           + data.business
                           + "</center></td><td><center>" + data.regdate
                           + "</center></td><td><center><button type='button' class='btn btn-default' value='" + data.recordNo +"'>" + '수정' + "</button>" + '  ' + "<button type='button' class='btn btn-default deleteVisitRecord' value='" + data.recordNo +"'>" + '삭제' + "</button></center></td></tr>");    
            },
            error : function(e) {
               alert(e.responseText);
            }
         }); 
   });
   }

   $(document).on('click','.deleteVisitRecord', function(){         //삭제버튼 클릭시
		alert($(this).closest('button').attr('value'));
		var clickedRow = $(this).closest('tr');              //클릭한 tr 가져오기
		$.ajax({
			url : "deleteVisitRecord.do",
			type : "get",
			dataType : "json",
			data : {
			   visitRecordNo : $(this).closest('button').attr('value'),
			},
			contentType : "application/json; charset=utf-8",
			success : function(data) {
			   alert("success!");
			   clickedRow.remove();
			},
			error : function(e) {
			   alert("error!");
			}
		});
   });
</script>
</html>