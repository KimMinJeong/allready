<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="static/js/bootstrap.js"></script>
<script src="static/js/jquery-1.11.1.js"></script>
<script src="static/js/bootstrap.min.js"></script>
<link href="static/css/bootstrap.min.css" rel="stylesheet" type="text/css">
<link href="static/css/style.css" rel="stylesheet" type="text/css">
</head>

<body> <br>
	<div class="container">
		<div class="row row-offcanvas row-offcanvas-left">
			<div class="col-xs-6 col-sm-3 sidebar-offcanvas" id="sidebar" role="navigation">
				<ul class="nav">
					<li class="active"><a href="#"><font size="4">B1</font></a></li>
					<li><a href="#"><font size="4">B2</font></a></li>
					<li><a href="#"><font size="4">B3</font></a></li>
				</ul>
			</div>

			<div class="col-xs-12 col-sm-9"> <br>
				<%
					String isfull = (String) request.getAttribute("isfull");
				%>
				<input type="hidden" id="isfull" value="<%=isfull%>" />
				
				<div class="table-responsive" id="table1">
					<table class="table" id="table2" border="1" width="500">
						<tr height="250px">
							<td>A1</td>
							<td>A2</td>
							<td>A3</td>
							<td>A4</td>
							<td></td>
							<td>B1</td>
							<td>B2</td>
							<td>B3</td>
							<td>B4</td>
						</tr>
						
						<tr>
							<td colspan="19"></td>
						</tr>
						
						<tr height="250px">
							<td>C1</td>
							<td>C2</td>
							<td>C3</td>
							<td>C4</td>
							<td></td>
							<td>D1</td>
							<td>D2</td>
							<td>D3</td>
							<td>D4</td>
						</tr>
					</table>
				</div>
			</div>
		</div>
	</div>
</body>

<script type="text/javascript">
	var isfull = $("#isfull").val();

	if(isfull == "FULL"){
		$("#table1 #table2 tr:nth-child(1) td:nth-child(1)").css(
				"background-color", "pink");
	} else if(isfull == "EMPTY"){
		$("#table1 #table2 tr:nth-child(1) td:nth-child(1)").css(
				"background-color", "blue");
	}
</script>
</html>