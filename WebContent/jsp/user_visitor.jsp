<%@page import="java.util.*"%>
<%@page import="kr.ac.apart.vo.UserVO"%>
<%@page import="kr.ac.apart.vo.VisitorVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=Edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>세대주_방문객</title>
<script src="static/js/bootstrap.js"></script>
<script src="static/js/jquery-1.11.1.js"></script>
<script src="static/js/bootstrap.min.js"></script>
<link href="static/css/bootstrap.min.css" rel="stylesheet" type="text/css">
<link href="static/css/style.css" rel="stylesheet" type="text/css">
<link href="static/css/seulStyle.css" rel="stylesheet" type="text/css">
</head>

<body>
	<div class="container font-style">
		<form action="addVisitor.do" method="post">
			<div class="col-md-offset-9">
				<input type="checkbox" class="checkbox inline" name="fixed">
				<h4 class="text inline">고정방문객</h4> <br> &nbsp;

				<div class="form-inline">
					<div class="input-group">
						<span class="input-group-addon input-style">이름</span> 
						<input type="text" class="form-control input-text-style" name="visitor_name">
					</div>
				</div>

				<div class="form-inline">
					<div class="input-group">
						<span class="input-group-addon input-style">용무</span> 
						<input type="text" class="form-control input-text-style" name="business">
					</div>

					<button type="submit" class="btn button-style" id="visitor_submit_btn">등록</button>
				</div>
			</div>
		</form><br/>
		
		<div class="table-responsive form-group">
			<table class="table table-bordered table-style">
				<thead class="head">
					<tr>
						<th><center>동/호수</center></th>
						<th><center>방문객이름</center></th>
						<th><center>용무</center></th>
						<th><center>고정/일시</center></th>
						<th><center>삭제</center></th>
					</tr>
				</thead>

				<tbody id="tbody">
					<%
						List<VisitorVO> visitorList = (List<VisitorVO>) request.getAttribute("VisitorFlag");
						
						for (VisitorVO vo : visitorList) {
							if ("TRUE".equals(vo.getViewing())) {
					%>
					<tr class="<%=vo.getVisitor_no()%>">
						<td><center><%=vo.getUser_id()%></center></td>
						<td><center><%=vo.getVisitor_name()%></center></td>
						<td><center><%=vo.getBusiness()%></center></td>
						<%
							if("FIXED".equals(vo.getFixed())){
						%>
						<td><center>고정</center></td>
						<%
							} else if ("UNFIXED".equals(vo.getFixed())){
						%>
						<td><center>일시</center></td>
						<%
							}
						%>
						<td><center>
								<button type="button" class="btn button-style deleteVisitor" value="<%=vo.getVisitor_no()%>">삭제</button>
							</center></td>
					</tr>
					<%
						}
					}
					%>
				</tbody>
			</table>
		</div>
	</div>
	<hr>
</body>

<script type="text/javascript">
	$(document).on('click', '.deleteVisitor', function() {
		alert("delete!");
		var clickedRow = $(this).closest('tr');
		$.ajax({
			url : "updateVisitor.do",
			type : "get",
			dataType : "json",
			data : {
				visitordNo : $(this).closest('tr').attr('class')
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
	})
</script>

</html>