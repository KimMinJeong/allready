<%@page import="kr.ac.apart.vo.FamilyVO"%>
<%@page import="kr.ac.apart.vo.UserVO"%>
<%@page import="java.util.*"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=Edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />

<title>세대주 설정</title>
<script src="static/js/jquery-1.11.1.js"></script>
<script src="static/js/bootstrap.js"></script>
<link href="static/css/bootstrap.css" rel="stylesheet" type="text/css">
<link href="static/css/style.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css" href="style.css" media="only and (min-width: 360px) and (max-width: 768px)" id="stylesheet-768" />
<link rel="stylesheet" type="text/css" href="style.css" media="only and (min-width: 768px)" id="stylesheet-1200" />
</head>

<body>
<!-- 	<div class="alert alert-danger alert-dismissible" id="id_alert" role="alert"> -->
<!-- 		<button type="button" class="close" data-dismiss="alert"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button> -->
<!-- 	</div> -->
	<div class="container font-style" style="margin-top: 4%">
		<div class="col-xs-12 col-md-offset-3 col-md-6">
			<h1 align="center" >상세정보 기입란</h1> <br><br>
			<%
				UserVO vo = (UserVO) session.getAttribute("UserFlag");
				List<FamilyVO> familyList = (List<FamilyVO>) request.getAttribute("familyList");
			%>
			<form role="form">
				<div class="form-group">
					<label for="exampleInputEmail1" class="label-style">세대주 ID</label> 
					<input type="text" class="form-control input-text-style" id="userId" value="<%=vo.getUser_id()%>" readOnly>
				</div>

				<div class="form-group">
					<label for="exampleInputPassword1" class="label-style">Password(필수입력)</label> 
					<input type="password" class="form-control input-text-style" id="userPassword">
				</div>

				<div class="form-group">
					<label for="exampleInputPassword1" class="label-style">세대주 이름</label> 
					<input type="text" class="form-control input-text-style" id="userName" value="<%=vo.getUser_name()%>">
				</div>

				<div class="form-group">
					<label for="exampleInputPassword1" class="label-style">E-mail</label> 
					<input type="text" class="form-control input-text-style" id="userEmail" value="<%=vo.getE_mail()%>">
				</div>

				<div class="form-group">
					<label for="exampleInputPassword1" class="label-style">전화번호</label> 
					<input type="text" class="form-control input-text-style" id="userPhone" value="<%=vo.getPhone()%>">
				</div>

				<div class="form-group">
					<label for="disabledSelect" class="label-style">부양 가족 수</label>
					<form name="usersFamily">
						<select id="selectFamily" class="form-control input-text-style" name="selected">
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
					</form>
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
							int i = 0;
							if (familyList != null) {
								for (FamilyVO familyVo : familyList) {
						%>
						<tr>
							<td><center><input type='text' class='input-text-style form-control familyName<%=i%>' value="<%=familyVo.getName()%>"></center></td>
							<td><center><input type='text' class='input-text-style form-control familyPhone<%=i%>' value="<%=familyVo.getPhone()%>"></center></td>
							<%
								i++;
									}
								}
							%>
					</tbody>
				</table>

				<div class="col-xs-2 col-md-offset-10 col-md-2">
					<button type="submit" class="btn button-style" id="modifyUser">Submit</button>
				</div>
			</form>
		</div>
	</div>		
	<hr>
</body>

<script type="text/javaScript">
	$("#selectFamily").on('change', function() {
		$("#userFamily *").remove(); //처음에 append한 것 모두 지워주기
		
		var selectDong = $("#selectFamily").val(); //select값

		for ( var i = 0; i < selectDong; i++) {
			$("#userFamily").append(
				"<tr><td><center><input type='text' class='form-control familyName"+i+"'></center></td>"
				+ "<td><center><input type='text' class='form-control familyPhone"+i+"'></center></td></tr>");
		}
	});

	$("#modifyUser").on('click', function() {
		if ($("#userPassword").val() == "") {
			alert("비밀번호를 입력해주세요.");
			$("#userPassword").focus();
			return false;
		} else {
			if($("#userEmail").val()!=""){
				if($("#userEmail").val().match(/^(\w+)@(\w+)[.](\w+)$/ig)==null){
					alert("E-mail 형식으로 입력해주세요.");
					$("#userEmail").focus();
					return false;
				}
			}
			var selectFamily = $("#selectFamily").val();
			arrName = [];
			arrPhone = [];
			
			for ( var j = 0; j < selectFamily; j++) {
				arrName[j] = $('.familyName' + j).val();
				arrPhone[j] = $('.familyPhone' + j).val();
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
					alert("정보수정 실패!");
				}
			});
		}
		
	});
	
	var table = document.getElementById('userFamily');
	var tr = table.getElementsByTagName("tr").length; //table의 tr 갯수
	$("#selectFamily").val(tr); //select 기본값 설정, 기본값=tr
</script>

<script type="text/javascript">
	var regex=/^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/;
	var user_email=$('#userEmail').val();
	
	if(regex.test(user_email)===false){
		$("#id_alert").show();
	}
</script>
</html>