<%@page import="kr.ac.apart.vo.Manager_DongVO"%>
<%@page import="kr.ac.apart.vo.UserVO"%>
<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
			<h1 align="center">상세정보 기입란</h1> <br><br>
			<%
				UserVO vo = (UserVO) session.getAttribute("UserFlag");
				List<Manager_DongVO> manageDongList = (List<Manager_DongVO>) request.getAttribute("managerDongList");
			%>
			<div class="form-group">
				<label for="exampleInputEmail1">관리자 ID</label> 
				<input type="text" class="form-control" id="userId" value="<%=vo.getUser_id()%>" readonly />
			</div>

			<div class="form-group">
				<label for="exampleInputPassword1">Password</label> 
				<input type="text" class="form-control" id="userPassword" placeholder="Password">
			</div>

			<div class="form-group">
				<label for="exampleInputPassword1">관리자 이름</label> 
				<input type="text" class="form-control" id="userName" value="<%=vo.getUser_name()%>" placeholder="관리자 이름">
			</div>

			<div class="form-group">
				<label for="exampleInputPassword1">전화번호</label> 
				<input type="text" class="form-control" id="userPhone" value="<%=vo.getPhone()%>" placeholder="전화번호">
			</div>

			<div class="form-group">
				<label for="disabledSelect">관리하는 동 수</label> 
				<select id="selectDong" class="form-control">
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

			<div id="manageDong">
				<%
					int i=0;
				    	if(manageDongList != null){
				    	for(Manager_DongVO vo2 : manageDongList){
				%>
				<input type="text" class="form-control manageSelectDong<%=i%>" value="<%=vo2.getDong()%>" size='10' name="test"><br>
				<%
					i++;
				    }}
				%>
			</div>

			<div class="col-md-offset-10 col-md-2">
				<button type="submit" class="btn btn-primary" id="modifyManager">Submit</button>
			</div> <br><br>
		</div>
	</div>
	<hr>
</body>

<script type="text/javascript">
	$("#selectDong").on('change', function(){
		$("#manageDong *").remove(); //처음에 append한 것 모두 지워주기
		
		var selectDong = $("#selectDong").val(); //select 값

		for(var i = 0; i < selectDong; i++){
			$("#manageDong").append(
				"<input type='text' class='form-control manageSelectDong" + i + "' placeholder='관리동' size='10' name='test'><br>");
		}
	});

	$("#modifyManager").on('click', function(){
		
		if ($("#userPassword").val() == "") {
			alert("비밀번호를 입력해주세요.");
		} else{
			var selectDong = $("#selectDong").val();
			arr = [];
			
			for ( var j = 0; j < selectDong; j++) {
				arr[j] = $('.manageSelectDong' + j).val();
			}
			
			jQuery.ajaxSettings.traditional = true; //배열을 넘겨주려면 꼭 필요
			
			$.ajax({
				url : "modifyManager.do",
				type : "get",
				dataType : "json",
				data : {
					userId : $("#userId").val(),
					userPassword : $("#userPassword").val(),
					userName : $("#userName").val(),
					userPhone : $("#userPhone").val(),
					manageDong : arr
				},
				contentType : "application/json; charset=utf-8",
				success : function(data) {
					alert("정보가 수정되었습니다.");
				},
				error : function(e) {
					alert("error");
				}
			});
		}
	});

	var inputCount = $("input[name=test]").length; //input타입의 갯수
	$("#selectDong").val(inputCount); //select 기본값 설정
</script>
</html>