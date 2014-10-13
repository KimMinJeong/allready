<%@page import="org.jsoup.nodes.Element"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="static/js/bootstrap.js"></script>
<script src="static/js/jquery-1.11.1.js"></script>
<script src="static/js/bootstrap.min.js"></script>
<link  href="static/css/bootstrap.css" rel="stylesheet" type="text/css">
<link href="static/css/style.css" rel="stylesheet" type="text/css">
</head>

<body>
	<%
		Element korea_tax = (Element) request.getAttribute("korea_tax");
		String dangi_tax = (String) request.getAttribute("dangi_tax");
	%>
	<div class="container">
	<div>
		<button class="btn btn-warning btn-sm" data-toggle="modal" data-target="#myModal">
        	전국 평균 관리비
		</button>

			<div class="modal fade" id="myModal">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal">
								<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
							</button>
							
							<h4 class="modal-title">전국 평균 관리비</h4>
						</div>
						
						<div class="modal-body">
							<div><%=korea_tax%></div>
						</div>
						
						<div class="modal-footer">
							<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
						</div>
					</div><!-- /.modal-content -->
				</div><!-- /.modal-dialog -->
			</div><!-- /.modal -->
		</div> <br>
	<div class="col-md-offset-2 col-md-10">
<!-- 		<img src="..." alt="그래프" height="200" width="300" class="img-rounded">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; -->
<!-- 		<img src="..." alt="그래프" height="200" width="300" class="img-rounded"> -->
	</div> <br/>
	
	<%=dangi_tax%>
	
	<h2>관리비</h2>
	
	<table class="table" id="table">
		<tr>
			<th>시/도</th>
			<th>단지 수</th>
			<th>공용 관리비</th>
			<th>공용 사용료</th>
			<th>전용 사용료</th>
			<th>장기수선 충당금</th>
			<th>소계</th>
			<th>상세보기</th>
		</tr>
		
		<tr>
			<td>서울 마포구 상암동 평균</td>
			<td>13</td>
			<td>587</td>
			<td>126</td>
			<td>595</td>
			<td>47</td>
			<td>1.355</td>
			<td><button type="button" class="btn btn-default">상세보기</button></td>
		</tr>
		
		<tr>
			<td>상암 월드컵</td>
			<td>1</td>
			<td>527</td>
			<td>82</td>
			<td>816</td>
			<td>0</td>
			<td>1.425</td>
			<td><button type="button" class="btn btn-default">상세보기</button></td>
		</tr>
	</table> <br/><br/><br/>
	
	<h2>월별 통계</h2>
	
	<table class="table">
		<tr>
			<th align="center">분류</th>
			<th align="center">1월</th>
			<th align="center">2월</th>
			<th align="center">3월</th>
			<th align="center">4월</th>
			<th align="center">5월</th>
			<th align="center">6월</th>
			<th align="center">7월</th>
			<th align="center">8월</th>
			<th align="center">9월</th>
			<th align="center">10월</th>
			<th align="center">11월</th>
			<th align="center">12월</th>
		</tr>
		
		<tr>
			<td>X</td>
			<td>X</td>
			<td>X</td>
			<td>X</td>
			<td>X</td>
			<td>X</td>
			<td>X</td>
			<td>X</td>
			<td>X</td>
			<td>X</td>
			<td>X</td>
			<td>X</td>
			<td>X</td>
		</tr>
	</table>
</div>
<hr>
</body>
</html>