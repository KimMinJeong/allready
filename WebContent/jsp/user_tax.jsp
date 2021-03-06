<%@page import="java.util.List"%>
<%@page import="kr.ac.apart.vo.UserVO"%>
<%@page import="kr.ac.apart.vo.TaxVO"%>
<%@page import="org.jsoup.nodes.Element"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=Edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<script type="text/javascript" src="https://www.google.com/jsapi"></script>
<script src="static/js/jquery-1.11.1.js"></script>
<script src="static/js/bootstrap.js"></script>
<script type="text/javascript" src="https://www.google.com/jsapi"></script>
<link href="static/css/bootstrap.css" rel="stylesheet" type="text/css">
<link href="static/css/style.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css" href="style.css" media="only and (min-width: 300px) and (max-width: 768px)" id="stylesheet-768" />
<link rel="stylesheet" type="text/css" href="style.css" media="only and (min-width: 768px)" id="stylesheet-1200" />
</head>
	<%
		Element korea_tax = (Element) request.getAttribute("korea_tax");
		String dangi_tax = (String) request.getAttribute("dangi_tax");
		List<TaxVO> OneTax = (List<TaxVO>)request.getAttribute("OneTax");
		UserVO user = (UserVO)session.getAttribute("UserFlag");
	%>
<body>
	<input type="hidden" id="userId" value="<%=user.getUser_id()%>">
	<div class="container font-style">
	<div class="col-xs-12 col-md-12">
		<button class="btn btn-warning btn-sm" data-toggle="modal" data-target="#myModal">
        	전국 평균 관리비
		</button>
		<% if(user.getRole().equals("MANAGER")){ %>
		<a class="btn btn-default btn-sm" href="AddTaxForm.do">
			관리비 설정
		</a>
		<%} %>
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
			<%=dangi_tax%>
		</div><br><br>
	
	<% if(user.getRole().equals("NORMAL")){ %>
	
	<table class="table table-bordered table-style" id="table">
		<tr class="head">
			<th><center>년도</center></th>
			<th><center>월</center></th>
			<th><center>일반 관리비</center></th>
			<th><center>전기 사용료</center></th>
			<th><center>수도 사용료</center></th>
			<th><center>난방 사용료</center></th>
			<th><center>인터넷 사용료</center></th>
		</tr>
		<br><br>
		<%for (TaxVO vo : OneTax){%>
			<tr>
 				<td><center><%=vo.getYear()%></center></td> 
 				<td><center><%=vo.getMonth()%></center></td>
 				<td><center><%=vo.getBasic_tax()%></center></td>
 				<td><center><%=vo.getElectric_tax()%></center></td>
 				<td><center><%=vo.getWater_tax()%></center></td> 
				<td><center><%=vo.getHeating_tax()%></center></td>
 				<td><center><%=vo.getInternet_tax()%></center></td>
			</tr>
		<%}%>
	</table>
</div>
<div class="col-xs-12 col-md-12" id="chart_div" style="width: 800px; height:200px;"></div>
<% }%>
<%if("MANAGER".equals(user.getRole())){ 
List<TaxVO> taxList=(List<TaxVO>) request.getAttribute("taxList");%>
<table class="table" id="table">
	<tr>
		<th>동</th>
		<th>호수</th>
		<th>년</th>
		<th>월</th>
	</tr>
	<br>
	<h3>등록 완료 된 세대</h3>
	<%for(TaxVO tax : taxList){ 
	if(tax.getUser_id().length()>3){%>
	<tr>
		<td><%=tax.getUser_id().substring(0, 3)%> 동</td>
		<td><%=tax.getUser_id().substring(3)%> 호</td>
		<td><%=tax.getYear() %></td>
		<td><%=tax.getMonth() %></td>
	</tr>
	<%}
	}%>
</table>
<%} %>

<hr>
</body>

<script>

google.load("visualization", "1", {packages:["corechart"]});
google.setOnLoadCallback(drawChart);
function drawChart() {
	var data = google.visualization.arrayToDataTable([                                       
	  ['Genre', '기본료', '전기세', '수도세', '난방비',
	   '인터넷 사용료', { role: 'annotation' } ],
	   <%for (TaxVO vo : OneTax){
			%>
			['<%=vo.getYear()%>년<%=vo.getMonth()%>월',<%=vo.getBasic_tax()%>, <%=vo.getElectric_tax()%>, <%=vo.getWater_tax()%>, <%=vo.getHeating_tax()%>
			, <%=vo.getInternet_tax()%>, ''],
			<%
		}
		%>
	]);
	
	var options = {
	  width: 800,
	  height: 200,
	  legend: { position: 'top', maxLines: 3 },
	  bar: { groupWidth: '75%' },
	  isStacked: true,
	};
	var chart = new google.visualization.ColumnChart(document.getElementById('chart_div'));
	chart.draw(data, options);
}
	  
</script>

</html>