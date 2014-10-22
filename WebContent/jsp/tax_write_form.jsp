<%@page import="kr.ac.apart.vo.Manager_DongVO"%>
<%@page import="kr.ac.apart.vo.TaxVO"%>
<%@page import="java.util.List"%>
<%@page import="kr.ac.apart.vo.UserVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="static/js/jquery-1.11.1.js"></script>
<script src="static/js/bootstrap.js"></script>
<link href="static/css/bootstrap.css" rel="stylesheet" type="text/css">
<meta http-equiv="X-UA-Compatible" content="IE=Edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link href="static/css/style.css" rel="stylesheet" type="text/css">

</head>
	<body>
	<%
		List<Manager_DongVO> managerDongList = (List<Manager_DongVO>) request.getAttribute("managerDongList");
	%>
	<div class="container">
	<form action="TaxWriteForm.do" method="post">
	<%
		for(Manager_DongVO dongList : managerDongList){
	%>
		<input type="checkbox" class="btn btn-default navbar-btn" name="userDong" value="<%=dongList.getDong()%>"><%=dongList.getDong()%></button> &nbsp;
	<%
		}
	%>	
		<p>호수</p>
		<input type="text" class="form-control" name="user_id" id="user_id">
		<p>년도</p>
		<select name="year" id="year">
			<option value="2016">2016</option>
			<option value="2015">2015</option>
			<option value="2014">2014</option>
			<option value="2013">2013</option>
		</select>
		<p>월</p>
		<select name="month" id="month">
			<option value="1">1</option>
			<option value="2">2</option>
			<option value="3">3</option>
			<option value="4">4</option>
			<option value="5">5</option>
			<option value="6">6</option>
			<option value="7">7</option>
			<option value="8">8</option>
			<option value="9">9</option>
			<option value="10">10</option>
			<option value="11">11</option>
			<option value="12">12</option>
		</select>
		<p>기본관리비</p>
		<input type="text" class="form-control" id="basic_tax" name="basic_tax">
		<p>전기세</p>
		<input type="text" class="form-control" id="electric_tax" name="electric_tax">
		<p>수도세</p>
		<input type="text" class="form-control" id="water_tax" name="water_tax">
		<p>난방비</p>
		<input type="text" class="form-control" id="heating_tax" name="heating_tax">
		<p>인터넷비</p>
		<input type="text" class="form-control" id="internet_tax" name="internet_tax">
		
		<input type="submit" value="확인">
	</form>
	</div>
</body>

</html>