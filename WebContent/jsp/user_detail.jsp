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
<link  href="static/css/bootstrap.css" rel="stylesheet" type="text/css">
</head>
<body>

<div class="container" style="margin-top:4%">

<div class="col-md-offset-3 col-md-6">

	<h1 align="center">상세정보 기입란</h1>
	<br><br>

	<form role="form" >
  <div class="form-group">
    <label for="exampleInputEmail1">세대주 ID</label>
    <input type="email" class="form-control" id="exampleInputEmail1" placeholder="Enter email">
  </div>
  <div class="form-group">
    <label for="exampleInputPassword1">세대주 이름</label>
    <input type="password" class="form-control" id="exampleInputPassword1" placeholder="Password">
  </div>
   <div class="form-group">
    <label for="exampleInputPassword1">Password</label>
    <input type="password" class="form-control" id="exampleInputPassword1" placeholder="Password">
  </div>
   <div class="form-group">
    <label for="exampleInputPassword1">E-mail</label>
    <input type="password" class="form-control" id="exampleInputPassword1" placeholder="Password">
  </div>
   <div class="form-group">
    <label for="exampleInputPassword1">전화번호</label>
    <input type="password" class="form-control" id="exampleInputPassword1" placeholder="Password">
  </div>
<div class="form-group">
      <label for="disabledSelect">부양 가족 수</label>
      <select id="disabledSelect" class="form-control">
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
    </div>
    
    <div class="row">
  <div class="col-xs-2">
    <input type="text" class="form-control" placeholder=".col-xs-2">
  </div>
  <div class="col-xs-4">
    <input type="text" class="form-control" placeholder=".col-xs-3">
  </div>
  </div><br><br>
    
   <div class="col-md-offset-10 col-md-2">
    <button type="submit" class="btn btn-primary">Submit</button>
    </div>
</form>

</body>
</html>