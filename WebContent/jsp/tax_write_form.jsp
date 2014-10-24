<<<<<<< HEAD
<%@page import="kr.ac.apart.vo.Manager_DongVO"%>
<%@page import="kr.ac.apart.vo.TaxVO"%>
<%@page import="java.util.List"%>
<%@page import="kr.ac.apart.vo.UserVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=Edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<script src="static/js/bootstrap.js"></script>
<script src="static/js/bootstrap.min.js"></script>
<script src="static/js/jquery-1.11.1.js"></script>
<script src="static/js/jquery-ui-1.10.4.js"></script>
<link href="static/css/jquery-ui-1.10.4.css" rel="stylesheet" type="text/css">
<link href="static/css/bootstrap.min.css" rel="stylesheet" type="text/css">
<link href="static/css/style.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css" href="style.css" media="only and min-width: 560px) and (max-width: 768px)" id="stylesheet-768" />
<link rel="stylesheet" type="text/css" href="style.css" media="only and (min-width: 768px) and (max-device-width: 1200px)" id="stylesheet-1200" />

</head>

<body>
	<div class="container font-style">
		<div class="col-md-offset-3 col-md-6">
			<form action="TaxWriteForm.do" method="post">
				<label class="label-style">세대주</label> 
				<input type="text" class="form-control input-text-style" name="user_id"> <br>

				<label class="label-style">YEAR(년도)</label> <br> 
				<select name="year" class="form-control input-text-style">
					<option value="2014">2014</option>
					<option value="2013">2013</option>
				</select> <br> 
				
				<label class="label-style">MONTH(월)</label> <br> 
				<select name="month" class="form-control input-text-style">
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
				</select> <br> 
				
				<label class="label-style">기본관리비</label> 
				<input type="text" class="form-control input-text-style" id="basic_tax" name="basic_tax"> <br/> 
				
				<label class="label-style">전기세</label> <br> 
				<input type="text" class="form-control input-text-style" id="electric_tax" name="electric_tax"> <br> 
				
				<label class="label-style">수도세</label> <br> 
				<input type="text" class="form-control input-text-style" id="water_tax" name="water_tax"> <br> 
				
				<label class="label-style">난방비</label> <br> 
				<input type="text" class="form-control input-text-style" id="heating_tax" name="heating_tax"> <br> 
				
				<label class="label-style">인터넷비</label> <br> 
				<input type="text" class="form-control input-text-style" id="internet_tax" name="internet_tax"> <br>

				<div align="center">
					<input type="submit" class="btn button-style" value="확인">
				</div>
			</form>
		</div>
	</div>
</body>
</html>