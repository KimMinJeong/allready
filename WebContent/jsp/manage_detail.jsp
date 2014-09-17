<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>관리자 설정</title>
<script src="static/js/bootstrap.js"></script>
<script src="static/js/jquery-1.11.1.js"></script>
<script src="static/js/bootstrap.min.js"></script>
<link href="static/css/bootstrap.min.css" rel="stylesheet" type="text/css">
<link href="static/css/style.css" rel="stylesheet" type="text/css">
</head>
<body>
	<div class="container" style="margin-top: 4%">
		<div class="col-md-offset-3 col-md-6">
			<h1 align="center">상세정보 기입란</h1>
			<br><br>

			<div class="form-group">
				<label for="exampleInputEmail1">관리자 ID</label> <input type="email" class="form-control" id="userId" placeholder="관리자 ID">
			</div>

			<div class="form-group">
				<label for="exampleInputPassword1">관리자 이름</label> 
				<input type="password" class="form-control" id="userName" placeholder="관리자 이름">
			</div>

			<div class="form-group">
				<label for="exampleInputPassword1">Password</label> 
				<input type="password" class="form-control" id="userPassword" placeholder="Password">
			</div>

			<div class="form-group">
				<label for="exampleInputPassword1">전화번호</label> 
				<input type="password" class="form-control" id="userPhone" placeholder="전화번호">
			</div>

			<table class="table" id="visitorTable">
				<thead>
					<tr>
						<th><center>관리동</center></th>
						<th><center>추가</center></th>
						<th><center>삭제</center></th>
					</tr>
				</thead>
				
				<tbody>
					<tr id="dongRow">
						<td><center><input type="text" class="form-control manageSelectDong" placeholder="동/호수" size="19"></center></td>
						<td><center><button type="button" class="btn btn-default inline dongAddBtn">추가</button></center></td>
						<td><center><button type="button" class="btn btn-default inline dongDeleteBtn">삭제</button></center></td>
					</tr>
				</tbody>
			</table>

			<div class="col-md-offset-10 col-md-2">
				<button type="submit" class="btn btn-primary" id="modifyManager">Submit</button>
			</div>
			<br><br>
</body>

<script type="text/javascript">
	$(document).on('click', '.dongAddBtn', function() { 
		$("#dongRow").after(
				"<tr><td><center><input type='text' class='form-control manageSelectDong' placeholder='동/호수' size='19'></center></td>"
				+"<td><center><button type='button' class='btn btn-default inline dongAddBtn'>추가</button></center></td>"
				+"<td><center><button type='button' class='btn btn-default inline dongDeleteBtn'>삭제</button></center></td></tr>");
	});
	
	$(document).on('click', '.dongDeleteBtn', function(){
		 var clickedRow = $(this).closest('tr'); 
		clickedRow.remove(); 
	});
	
	$("#modifyManager").on('click', function(){
		alert("modify");
		 $.ajax({
            url : "modifyManager.do",
            type : "get",
            dataType : "json",
            data : {
               userId : $("#userId").val(),
               userPassword : $("#userPassword").val(),
               userName : $("#userName").val(),
               userPhone : $("#userPhone").val(),
               manageDone : $(".manageSelectDong").val()
            },
            contentType : "application/json; charset=utf-8",
            success : function(data) {
         	   alert("success");
            },
            error : function(e) {
               alert("error");
            }

         }); 
	});
</script>

</html>