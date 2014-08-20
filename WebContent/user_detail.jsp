<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="static/js/bootstrap.js"></script>
<script src="static/js/jquery-1.11.1.js"></script>
<script src="static/js/bootstrap.min.js"></script>
<link  href="static/css/bootstrap.min.css" rel="stylesheet" type="text/css">
</head>
<body>
<div class="container" style="margin-top:10%">
<div class="col-md-offset-3 col-md-6">

	<h1 align="center">상세정보 기입란</h1>
	<br/><br/>
	<form class="form-horizontal" role="form" action="#">
		<table>
			<tr>
				<th align="left">세대주ID</th>
				<td colspan="2">&nbsp;&nbsp;&nbsp;<input type="text" ></td>
			</tr>
			
			<tr>
				<th align="left">세대주 이름</th>
				<td colspan="2">&nbsp;&nbsp;&nbsp;<input type="text" ></td>
			</tr>
			<tr>
				<th align="left">비밀번호</th>
				<td colspan="2">&nbsp;&nbsp;&nbsp;<input type="text" ></td>
			</tr>
			<tr>
				<th align="left">E-mail</th>
				<td colspan="2">&nbsp;&nbsp;&nbsp;<input type="text" ></td>
			</tr>
			<tr>
				<th align="left">전화번호</th>
				<td colspan="2">&nbsp;&nbsp;&nbsp;<input type="text" ></td>
			</tr>
			<tr>
				<th align="left">부양가족 수</th>
				<td colspan="2">&nbsp;&nbsp;&nbsp;
				<select>
					<option>1</option>
					<option>2</option>
					<option>3</option>
					<option>4</option>
					<option>5</option>
					<option>6</option>
					<option>7</option>
					<option>8</option>
					<option>9</option>
					<option>10</option>
				</select>
				</td>
			</tr>
			<tr>
				<th></th>
				<td colspan="2"><input type="text" size="3" placeholder="이름">&nbsp;&nbsp;&nbsp;<input type="text" size="15" placeholder="전화번호"></td>
			</tr>
		</table>
		<br/>
		<p align="center"><input type="submit" value="설정"></p>
	</form>
</div>
</div>

</body>
</html>