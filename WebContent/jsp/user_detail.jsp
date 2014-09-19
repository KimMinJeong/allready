<%@page import="kr.ac.apart.vo.FamilyVO"%>
<%@page import="kr.ac.apart.vo.UserVO"%>
<%@page import="java.util.List" %>
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
<link href="static/css/bootstrap.min.css" rel="stylesheet" type="text/css">
</head>

<body>
	<div class="container" style="margin-top: 4%">
		<div class="col-md-offset-3 col-md-6">
			<h1 align="center">상세정보 기입란</h1>
			<br><br>
			
			<%
				UserVO vo = (UserVO) session.getAttribute("UserFlag");
				List<FamilyVO> familyList = (List<FamilyVO>) request.getAttribute("familyList");
			%>

			<form role="form">
				<div class="form-group">
					<label for="exampleInputEmail1">세대주 ID</label> 
					<input type="text" class="form-control" id="userId" value="<%=vo.getUser_id()%>" readOnly>
				</div>
				
				<div class="form-group">
					<label for="exampleInputPassword1">세대주 이름</label> 
					<input type="text" class="form-control" id="userName" value="<%=vo.getUser_name() %>">
				</div>
				
				<div class="form-group">
					<label for="exampleInputPassword1">Password</label> 
					<input type="password" class="form-control" id="userPassword">
				</div>
				
				<div class="form-group">
					<label for="exampleInputPassword1">E-mail</label> 
					<input type="text" class="form-control" id="userEmail" value="<%=vo.getE_mail()%>">
				</div>
				
				<div class="form-group">
					<label for="exampleInputPassword1">전화번호</label> 
					<input type="text" class="form-control" id="userPhone" value="<%=vo.getPhone()%>">
				</div>
				
				<div class="form-group">
					<label for="disabledSelect">부양 가족 수</label> 
					<select id="selectFamily" class="form-control">
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
				
				<table class="table">
				<thead>
					<tr>
						<th><center>이름</center></th>
						<th><center>전화번호</center></th>
					</tr>
					</thead>
					<tbody id="userFamily">
					<%
						if(familyList != null){
							for(FamilyVO familyVo : familyList){%>
								<tr><td><center><input type='text' class='form-control familyName' value="<%=familyVo.getName()%>"></center></td>
								<td><center><input type='text' class='form-control familyPhone' value="<%=familyVo.getPhone()%>"></center></td>
							<%}
						}%>
					</tbody>
				</table>
				<br><br>

				<div class="col-md-offset-10 col-md-2">
					<button type="submit" class="btn btn-primary" id="modifyUser">Submit</button>
				</div>
			</form>
</body>
<script type="text/javaScript">
var i = 0;

$("#selectFamily").on('change', function(){
	$("#userFamily *").remove();    //처음에 append한 것 모두 지워주기
	var selectDong = $("#selectFamily").val();    //select값
	
	for(var i=0; i<selectDong; i++){
		$("#userFamily").append(
				"<tr><td><center><input type='text' class='form-control familyName"+i+"'></center></td>"
				+"<td><center><input type='text' class='form-control familyPhone"+i+"'></center></td></tr>"
		);
	}
});

$("#modifyUser").on('click', function(){
	var selectFamily = $("#selectFamily").val();
	arrName = [];
	arrPhone = [];
	for(var j=0; j<selectFamily; j++){
		arrName[j] = $('.familyName'+j).val();
		arrPhone[j] = $('.familyPhone'+j).val();
	}
	jQuery.ajaxSettings.traditional = true; 
	 $.ajax({
        url : "modifyUser.do",
        type : "get",
        dataType : "json",
        data : {
        	userId : $("#userId").val(),
        	userName : $("#userName").val(),
        	userPassword : $("#userPassword").val(),
        	userEmail : $("#userEmail").val(),
        	userPhone : $("#userPhone").val(),
           familyName : arrName,
           familyPhone : arrPhone
        },
        contentType : "application/json; charset=utf-8",
        success : function(data) {
     	   alert("정보가 수정되었습니다.");
        },
        error : function(e) {
           alert("error");
        }
     }); 
});
</script>
</html>