<%@page import="kr.ac.apart.vo.UserVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="static/js/bootstrap.js"></script>
<script src="static/js/bootstrap.min.js"></script>
<script src="static/js/jquery-1.11.1.js"></script>
<script src="static/js/jquery-ui-1.10.4.js"></script>

<link href="static/css/jquery-ui-1.10.4.css" rel="stylesheet" type="text/css">
<link href="static/css/bootstrap.min.css" rel="stylesheet" type="text/css">
<link href="static/css/style.css" rel="stylesheet" type="text/css">
</head>
<body>
	<form action="TaxWriteForm.do" method="post">
		<p>세대주</p>
		<input type="text" name="user_id">
		<p>년도</p>
		<select name="year">
			<option value="2014">2014</option>
			<option value="2013">2013</option>
		</select>
		<p>월</p>
		<select name="month">
			<option value="1">1</option>
			<option value="2">2</option>
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
</body>


</html>