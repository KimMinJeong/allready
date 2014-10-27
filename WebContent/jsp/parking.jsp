<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=Edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />

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
			<div class="col-xs-6 col-sm-3 sidebar-offcanvas" id="sidebar">
				<ul class="nav">
					<li class="active"><a href="#"><font size="8">B1</font><br><font size="3"><%=request.getAttribute("B1") %></font></a></li>
					<li><a href="#"><font size="8">B2</font><br><font size="3"><%=request.getAttribute("B2") %></font></a></li>
					<li><a href="#"><font size="8">B3</font><br><font size="3"><%=request.getAttribute("B3") %></font></a></li>
				</ul>
			</div>

			<div class="col-xs-12 col-sm-9"> <br>
				<%
					String isfull1 = (String) request.getAttribute("isfull1");
					String isfull2 = (String) request.getAttribute("isfull2");
				%>
				<input type="hidden" id="isfull1" value="<%=isfull1%>" />
				<input type="hidden" id="isfull2" value="<%=isfull2%>" />
				
				<div class="table-responsive" id="table1">
					<table class="table" id="table2" border="1" width="500">
						<tr height="250px">
							<td>A1</td>
							<td>A2</td>
							<td>A3</td>
							<td>A4<br><br><img src="static/images/handicap.png" width="60px" height="60px" /></td>
							<td>A5<br><br><img src="static/images/handicap.png" width="60px" height="60px" /></td>
							
						</tr>
						
						<tr>
							<td colspan="19"></td>
						</tr>
						
						<tr height="250px">
							<td>A6</td>
							<td>A7</td>
							<td>A8</td>
							<td>A9</td>
							<td>A10</td>
						</tr>
					</table>
				</div>
			</div>
		</div>
	</div>
	<hr>
</body>
<script type="text/javascript">
   var isfull1 = $("#isfull1").val();
   var isfull2 = $("#isfull2").val();
   
   $("#table1 #table2 tr:nth-child(2) td:nth-child(1)").css(
           "background-color", "white");

   if(isfull1 == "FULL"){
      $("#table1 #table2 tr:nth-child(1) td:nth-child(1)").css(
            "background-color", "#f39192");
   } else if(isfull1 == "EMPTY"){
      $("#table1 #table2 tr:nth-child(1) td:nth-child(1)").css(
            "background-color", "#888888");
   }
   
	if (isfull2 == "FULL") {
		$("#table1 #table2 tr:nth-child(3) td:nth-child(5)").css(
				"background-color", "#f39192");
	} else if (isfull2 == "EMPTY") {
		$("#table1 #table2 tr:nth-child(3) td:nth-child(5)").css(
				"background-color", "#888888");
	}

	function start() {
		setInterval("recall()", 3000);
	}

	function recall() {
		location.reload();
		widow.status = " ";
		return true;
	}

	start();
</script>
</html>