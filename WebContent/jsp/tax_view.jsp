<%@page import="java.util.List"%>
<%@page import="kr.ac.apart.vo.TaxVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=Edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />

<script src="static/js/bootstrap.js"></script>
<script src="static/js/bootstrap.min.js"></script>
<script src="static/js/jquery-1.11.1.js"></script>

<link href="static/css/bootstrap.min.css" rel="stylesheet" type="text/css">
<link href="static/css/style.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css" href="style.css" media="only and (min-width: 360px) and (max-width: 768px)" id="stylesheet-768" />
<link rel="stylesheet" type="text/css" href="style.css" media="only and (min-width: 768px)" id="stylesheet-1200" />
</head>
<%
	TaxVO tax_vo = (TaxVO)request.getAttribute("tax_vo");
	List<TaxVO> taxList = (List<TaxVO>)request.getAttribute("taxList");
%>
<body>
<div class="container font-style">
	<p>사용자</p>
	<div><%=tax_vo.getUser_id() %></div>
	<p>년도</p>
	<div><%=tax_vo.getYear() %></div>
	<p>월</p>
	<div><%=tax_vo.getMonth() %></div>
	<p>기본료</p>
	<div><%=tax_vo.getBasic_tax() %></div>
	<p>전기세</p>
	<div><%=tax_vo.getElectric_tax() %></div>
	<p>수도세</p>
	<div><%=tax_vo.getWater_tax() %></div>
	<p>난방비</p>
	<div><%=tax_vo.getHeating_tax() %></div>
	<p>인터넷비용</p>
	<div><%=tax_vo.getInternet_tax() %></div>
</div>
	<table id="table-custom-sort" data-height="299" data-sort-order="desc">
    <thead>
	    <tr>
	    	<th data-field="user" data-align="right" data-sortable="true">사용자</th>
	        <th data-field="year" data-align="right" data-sortable="true">년도</th>
	        <th data-field="month" data-align="center" data-sortable="true">월</th>
	        <th data-field="basic_tax" data-sortable="true" data-sorter="priceSorter">기본료</th>
	        <th data-field="electric_tax" data-sortable="true" data-sorter="priceSorter">전기세</th>
	        <th data-field="water_tax" data-sortable="true" data-sorter="priceSorter">수도세</th>
	        <th data-field="heating_tax" data-sortable="true" data-sorter="priceSorter">난방비</th>
	        <th data-field="internet_tax" data-sortable="true" data-sorter="priceSorter">인터넷료</th>
	    </tr>
	    <%
		if (taxList != null){
			for (TaxVO vo : taxList){
			%>
			<tr>
				<td><%=vo.getUser_id()%></td>
				<td><%=vo.getYear()%></td>
				<td><%=vo.getMonth()%></td>
				<td><%=vo.getBasic_tax()%></td>
				<td><%=vo.getElectric_tax()%></td>
				<td><%=vo.getWater_tax()%></td>
				<td><%=vo.getHeating_tax()%></td>
				<td><%=vo.getInternet_tax() %></td>
			</tr>
			<%
			}
		}
		%>
    </thead>
	</table>
	
</body>
</html>