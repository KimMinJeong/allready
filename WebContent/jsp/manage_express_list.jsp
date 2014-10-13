<%@page import="kr.ac.apart.vo.Manager_DongVO"%>
<%@page import="kr.ac.apart.vo.ExpressVO"%>
<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="static/js/bootstrap.js"></script>
<script src="static/js/jquery-1.11.1.js"></script>
<script src="static/js/bootstrap.min.js"></script>
<link href="static/css/bootstrap.min.css" rel="stylesheet" type="text/css">
<link href="static/css/style.css" rel="stylesheet" type="text/css">
<script src="static/js/jquery-1.11.1.js"></script>
<title>Insert title here</title>
</head>

<body>
	<%
		List<ExpressVO> expressList = (List<ExpressVO>) request.getAttribute("list");
	%>
	<div class="container">
		<div class="row row-offcanvas row-offcanvas-left">

			<!-- main area -->
			<div class="col-xs-12 col-sm-12"> <br>
				<div align="right">
					<button class="btn btn-primary btn-lg" data-toggle="modal" data-target="#myModal">등록</button>

					<!-- Modal -->
					<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
						<div class="modal-dialog">
							<form action="addExpress.do">
								<div class="modal-content">
									<div class="modal-header">
										<div class="col-xs-8">
											<h4 class="modal-title" id="myModalLabel" align="left">택배등록</h4>
										</div>
										
										<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
									</div>
									<%
										List<Manager_DongVO> managerDongList = (List<Manager_DongVO>) request.getAttribute("managerDongList");
									%>
									<div class="modal-body" align="center">
										<div align="left">
											<%
												for(Manager_DongVO dongList : managerDongList){
											%>
											<input type="checkbox" class="btn btn-default navbar-btn" name="userDong" value="<%=dongList.getDong()%>"><%=dongList.getDong()%></button> &nbsp;
											<%
												}
											%>
										</div> <br><br>

										<div class="row" align="center">
											<div class="col-xs-7">
												<div class="form-inline">
													호수 : <input type="text" class="form-control" placeholder="호수를 입력하세요" name="userNo">
												</div> <br>
												
												<div class="form-inline">
													이름 : <input type="text" class="form-control" placeholder="이름을 입력하세요" name="orderer"> <br>
												</div> <br>
												
												<div align="right">
													<select name="express_company">
														<option value="cj">CJ</option>
														<option value="hangin">한진</option>
														<option value="lojen">로젠</option>
														<option value="yellowCap">Yellow Cap</option>
														<option value="post">우체국</option>
														<option value="store">편의점</option>
														<option value="etc">기타</option>
													</select>
												</div> <br>

												<button type="submit" class="btn btn-default">Save changes</button>
											</div>
										</div>
									</div>
								</div>
							</form>
						</div>
					</div>
				</div> <br>

				<div class="panel panel-default">

					<!-- Default panel contents -->
					<div class="panel-heading">
						<center>택배 리스트</center>
					</div>

					<!-- Table -->
					<table class="table">
						<tr>
							<th><center>날짜</center></th>
							<th><center>동호수</center></th>
							<th><center>이름</center></th>
							<th><center>택배회사</center></th>
							<th><center>수령확인</center></th>
						</tr>
						<%
							int currentPage = (Integer) request.getAttribute("currentPage");
							if (expressList != null){
								for (ExpressVO vo : expressList){
						%>
						<tr>
							<td><center><%=vo.getReg_date()%></center></td>
							<td><center><%=vo.getUser_id()%></center></td>
							<td><center><%=vo.getOrderer()%></center></td>
							<%
								if("cj".equals(vo.getExpress_company())){
							%>
								<td><center>CJ</center></td>
							<%
								} else if("hangin".equals(vo.getExpress_company())){
							%>
								<td><center>한진</center></td>
							<%
								} else if("lojen".equals(vo.getExpress_company())){
							%>
								<td><center>로젠</center></td>
							<%
								} else if("yellowCap".equals(vo.getExpress_company())){
							%>
								<td><center>Yellow Cap</center></td>
							<%
								} else if("post".equals(vo.getExpress_company())){
							%>
								<td><center>우체국</center></td>
							<%
								} else if("store".equals(vo.getExpress_company())){
							%>
								<td><center>편의점</center></td>
							<%
								} else if("etc".equals(vo.getExpress_company())){
							%>
								<td><center>기타</center></td>
							<%
								}
							%>
							<td><center>
									<%
										if(vo.getReceiver() == null){ %>
											<button id="<%=vo.getExpress_id()%>" class="btn btn-primary getButton" data-toggle="modal" data-target="#myModal2" value="<%=currentPage%>">확인</button>
									<% }else if(vo.getReceiver() != null){ %>
										<%=vo.getReceiver()%> &nbsp; <button type="button" class="btn btn-primary getButton" data-toggle="modal" data-target="#myModal2" id="<%=vo.getExpress_id()%>" value="<%=currentPage%>">수정</button>
									<%
										}
									%>
								</center></td>
						</tr>
						<%
							}																																							}
						%>
					</table>
				</div>

				<!-- Modal -->
				<!-- <form action="updateExpress.do" id="updateExpress"> -->
				<div class="modal fade" id="myModal2" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal">
									<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
								</button>

								<h4 class="modal-title" id="myModalLabel">택배 수령자 입력</h4>
							</div>

							<div class="modal-body">
								<div align="left">
									<input type="text" id="receiver" name="receiver"> 
									<input type="button" id="submitBtn" value="수령확인">
								</div> <br><br>
							</div>
						</div>
					</div>
				</div>
				<%
					int expressRowNum = (Integer) request.getAttribute("expressRowNum");
				%>
				<div align="center">
					<ul class="pagination">
						<li><a href="expressList.do">&laquo;</a></li>
						<%
							int j=1;  //페이지수
							int a=0;  //마지막페이지
							for(int i=0; i<expressRowNum; i+=10){
						%>
								<li class="page"><a href="expressList.do?page=<%=i%>"><%=j%></a></li>
						<%
								j++;
								a=i;
							}
						%>
						<li><a href="expressList.do?page=<%=a%>">&raquo;</a></li>
					</ul>
				</div>
			</div>
			<!-- /.col-xs-12 main -->
		</div>
		<!--/.row-->
	</div>
	<!--/.container-->
	<hr>
</body>

<script type="text/javascript">
	var id;
	var receiver;
	var currentPage;

	$(document).on("click", ".getButton", function() {
		id = $(this).closest('button').attr('id');
		currentPage = $(this).closest('button').attr('value');
	});

	$("#submitBtn").on('click', function() {
		receiver = $("#receiver").val();
		window.location = "updateExpress.do?express_id=" + id + "&receiver=" + receiver + "&page=" + currentPage;

		return false;
	});
</script>
</html>