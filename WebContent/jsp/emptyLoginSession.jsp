<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>로그인 해주세요.</title>
</head>
<body onload="test()">

</body>
<script type="text/javascript">
	function test(){
		alert("로그인해주세요.");
		location.replace("loginForm.do"); 
		//response.sendRedirect("loginForm.do");
	}
</script>

</html>