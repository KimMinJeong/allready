<%@page import="java.util.List"%>
<%@page import="kr.ac.apart.vo.UserVO"%>
<%@page import="kr.ac.apart.vo.TaxVO"%>
<%@page import="org.jsoup.nodes.Element"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="static/js/bootstrap.js"></script>
<script src="static/js/jquery-1.11.1.js"></script>
<script src="static/js/bootstrap.min.js"></script>
<script type="text/javascript" src="https://www.google.com/jsapi"></script>

<link  href="static/css/bootstrap.css" rel="stylesheet" type="text/css">
<link href="static/css/style.css" rel="stylesheet" type="text/css">
</head>

<body>
	<%
		Element korea_tax = (Element) request.getAttribute("korea_tax");
		String dangi_tax = (String) request.getAttribute("dangi_tax");
		List<TaxVO> OneTax = (List<TaxVO>)request.getAttribute("OneTax");
		UserVO user = (UserVO)session.getAttribute("UserFlag");
	%>
	<div class="container">
	<div>
		<button class="btn btn-warning btn-sm" data-toggle="modal" data-target="#myModal">
        	전국 평균 관리비
		</button>
		<a class="btn btn-default btn-sm" href="AddTaxForm.do">
			관리비 설정
		</a>

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
	</div> 
	<br/>
	<%=dangi_tax%>
	
	<% if(user.getRole().equals("NORMAL")){ %>
	<h2>관리비</h2>
	<table class="table" id="table">
		<tr>
			<th>년도</th>
			<th>월</th>
			<th>일반 관리비</th>
			<th>전기 사용료</th>
			<th>수도 사용료</th>
			<th>난방 사용료</th>
			<th>인터넷 사용료</th>
		</tr>
		<br><br>
		<%for (TaxVO vo : OneTax){
			%>
			<tr>
 				<td><%=vo.getYear()%></td> 
 				<td><%=vo.getMonth()%></td>
 				<td><%=vo.getBasic_tax()%></td>
 				<td><%=vo.getElectric_tax()%></td>
 				<td><%=vo.getWater_tax()%></td> 
				<td><%=vo.getHeating_tax()%></td>
 				<td><%=vo.getInternet_tax()%></td>
			</tr>
		<%}%>
	</table>
	<% }%>
	
	<!-- <h2>월별 통계</h2>
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
	</table> -->
</div>
</body>


</html>