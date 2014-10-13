<%@page import="kr.ac.apart.vo.FamilyVO"%>
<%@page import="kr.ac.apart.vo.UserVO"%>
<%@page import="java.util.*"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>세대주 설정</title>
<script src="static/js/bootstrap.js"></script>
<script src="static/js/jquery-1.11.1.js"></script>
<script src="static/js/bootstrap.min.js"></script>
<link href="static/css/bootstrap.min.css" rel="stylesheet" type="text/css">
</head>

<body>
	<div class="container" style="margin-top: 4%">
		<div class="col-md-offset-3 col-md-6">
			<h1 align="center">상세정보 기입란</h1> <br><br>
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
					<label for="exampleInputPassword1">Password(필수입력)</label> 
					<input type="password" class="form-control" id="userPassword">
				</div>

				<div class="form-group">
					<label for="exampleInputPassword1">세대주 이름</label> 
					<input type="text" class="form-control" id="userName" value="<%=vo.getUser_name()%>">
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
					<form name="usersFamily">
						<select id="selectFamily" class="form-control" name="selected">
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
							<td><center><input type='text' class='form-control familyName<%=i%>' value="<%=familyVo.getName()%>"></center></td>
							<td><center><input type='text' class='form-control familyPhone<%=i%>' value="<%=familyVo.getPhone()%>"></center></td>
							<%
								i++;
									}
								}
							%>
					</tbody>
				</table>

				<div class="col-md-offset-10 col-md-2">
					<button type="submit" class="btn btn-primary" id="modifyUser">Submit</button>
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
			if($("#userEmail").val().match(/^(\w+)@(\w+)[.](\w+)$/ig)==null){
				alert("E-mail 형식으로 입력해주세요.");
				$("#userEmail").focus();
				return false;
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
</html>