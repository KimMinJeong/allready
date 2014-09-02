<%@page import="java.util.List"%>
<%@page import="kr.ac.apart.vo.VisitorVO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<script src="static/js/bootstrap.js"></script>
<script src="static/js/jquery-1.11.1.js"></script>
<script src="static/js/bootstrap.min.js"></script>
<link href="static/css/bootstrap.min.css" rel="stylesheet"
	type="text/css">
<link href="static/css/style.css" rel="stylesheet" type="text/css">
<script src="static/js/jquery-1.11.1.js"></script>
<title>������_�湮����</title>
</head>
<body>
	<div class="container">
		<!-- main area -->
		<div class=" col-xs-3 col-sm-9">
			<form class="navbar-form navbar-center" role="search" action="addVisitorManger.do">
				<div class="form-group">
					<input type="text" class="form-control" placeholder="��/ȣ��"	size="19" name="user_id">&nbsp;&nbsp;&nbsp;&nbsp; 
					<input type="text" class="form-control" placeholder="�湮�� �ź�" size="19" name="visitor_name">&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="text" class="form-control inline" placeholder="�빫" size="48" name="business">&nbsp;
					<button type="submit" class="btn btn-default inline">�Է�</button>
			</form>
		</div>
	</div>
	<br>
	<br>
	<br>

	<form class="navbar-form navbar-right" role="search" action="getVisitor.do">
		<div class="form-group">
			<input type="text" class="form-control" placeholder="�湮�� �ź�" size="20%" align="center" name="user_id">
		</div>
		<button type="submit" class="btn btn-default">�˻�</button>
	</form>
	<br>
	<br>

	<div class="col-sm-12 col-xs-12">
		<div class="panel panel-default">
			<!-- Default panel contents -->
			<div class="panel-heading">
				<center>������ �湮�� ����Ʈ</center>
			</div>

			<!-- Table -->
			<table class="table">
				<thead>
					<tr>
						<th><center>��/ȣ��</center></th>
						<th><center>�湮�ڽź�</center></th>
						<th><center>�빫</center></th>
						<th><center>����/�Ͻ�</center></th>
						<th><center></center>
					</tr>
				</thead>
				<form class="navbar-form navbar-right" role="search" action="#">
				<tbody>
					<%
						List<VisitorVO> visitorList = (List<VisitorVO>) request.getAttribute("VisitorManagerFlag");
					
					if (visitorList != null) {
							if (visitorList.size() == 0) {
					%>
					<tr>
						<td colspan="5"><center>��ġ�ϴ� �˻������ �����ϴ�.</center></td>
					</tr>
					<%
						} else {
								for (VisitorVO vo : visitorList) {
					%>
					<tr>
						<td><center><%=vo.getUser_id()%></center></td>
						<td><center><%=vo.getVisitor_name()%></center></td>
						<td><center><%=vo.getBusiness()%></center></td>
						<%
							if (vo.getFixed().equals("FIXED")) {
						%>
						<td><center>����</center></td>
						<%
							} else if (vo.getFixed().equals("UNFIXED")) {
						%>
						<td><center>�Ͻ�</center></td>
						<%
							}
						%>
						<td><center>
								<button type="submit" class="btn btn-default">�Է�</button>
							</center></td>
					</tr>
					<%
						}
							}
						} else if (visitorList == null) {
					%><tr>
						<td colspan="5"><center>�˻�� �Է����ּ���.</center></td>
					</tr>
					<%
						}
					%>
				</tbody>
			</table>
			</form>
		</div>
		<br>

		<div class="panel panel-default">
			<!-- Default panel contents -->
			<div class="panel-heading">
				<center>�湮 ��� ����Ʈ</center>
			</div>





			<!-- Table -->
		<!-- 	<table class="table">
				<tr>
					<th><center>��ȣ��</center></th>
					<th><center>�湮�ڽź�</center></th>
					<th><center>�빫</center></th>
					<th><center>��¥</center></th>
				</tr>
				<tr>
					<td><center>2502ȣ</center></td>
					<td><center>�̸�</center></td>
					<td><center>������</center></td>
					<td><center>2014-8-18</center></td>
				</tr>
				<tr>
					<td><center>3002ȣ</center></td>
					<td><center>���ܽ�</center></td>
					<td><center>������</center></td>
					<td><center>2014-8-18</center></td>
				</tr>
				<tr>
					<td><center>301ȣ</center></td>
					<td><center>�ҸӴ�</center></td>
					<td><center>������</center></td>
					<td><center>2014-8-18</center></td>
				</tr>
			</table>
		</div> -->

		<div align="center">
			<ul class="pagination">
				<li><a href="#">&laquo;</a></li>
				<li><a href="#">1</a></li>
				<li><a href="#">2</a></li>
				<li><a href="#">3</a></li>
				<li><a href="#">4</a></li>
				<li><a href="#">5</a></li>
				<li><a href="#">&raquo;</a></li>
			</ul>
		</div>
	</div>
	<!-- /.col-xs-12 main -->
	</div>
	<!--/.row-->
	</div>
	<!--/.container-->
	</div>
	<!--/.page-container-->
</body>
</html>