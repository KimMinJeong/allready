<%@page import="kr.ac.apart.vo.ExpressVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<script src="static/js/bootstrap.js"></script>
<script src="static/js/jquery-1.11.1.js"></script>
<script src="static/js/bootstrap.min.js"></script>
<link  href="static/css/bootstrap.min.css" rel="stylesheet" type="text/css">
<link  href="static/css/style.css" rel="stylesheet" type="text/css">
<script src="static/js/jquery-1.11.1.js"></script>
<title>Insert title here</title>



</head>
<body>
<%
	List<ExpressVO> list = (List<ExpressVO>)request.getAttribute("list");
	ExpressVO vo2 = (ExpressVO)request.getAttribute("vo");
	
%>

     
    <div class="container">
    
      <div class="row row-offcanvas row-offcanvas-left">
        
        	
        <!-- main area -->
        <div class="col-xs-12 col-sm-12">

        <br>
   		 <div align="right">
	
<button class="btn btn-primary btn-lg" data-toggle="modal" data-target="#myModal">
  등록
</button>

<!-- Modal -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
        <h4 class="modal-title" id="myModalLabel">Modal title</h4>
      </div>
      <div class="modal-body">
     
     
      <div align="left">
		<button type="button" class="btn btn-default navbar-btn"  >102동</button>
		
	
		<button type="button" class="btn btn-default navbar-btn" >202동</button>
</div>
	<br>
	<br>
	

	
  <div class="row">
  <div class="col-xs-7">
  <form action="addExpress.do">
    <input type="text" class="form-control" placeholder=".col-xs-2" value="호수를 입력하세요" name="user_id"> 
      <br>
     <input type="text" class="form-control" placeholder=".col-xs-2" value="이름을 입력하세요" name="orderer">
    <br><br><br>
 <select name="express_company">
 	<option value="cj">CJ</option>
 	<option value="hangin">한진</option>
 	<option value="lojen">로젠</option>
 	<option value="yellowCap">Yellow Cap</option>
 	<option value="post">우체국</option>
 	<option value="store">편의점</option>
 </select>

      
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        <button type="submit" class="btn btn-default">Save changes</button>
     </form>

    </div>
  </div>
</div>
	</div></div></div>
   
</div>
<br>

		 <div class="panel panel-default">
		 
		  <!-- Default panel contents -->
		  <div class="panel-heading"><center>Express List</center></div>
		
		  <!-- Table -->
		  <table class="table">
		    <tr>
		    	<th>날짜</th>
		       	<th>동호수</th>
		   	   	<th>이름</th>
		       	<th>택배회사</th>
		       	<th>수령확인</th>
		    </tr><%
		    	if (list != null) {
						for (ExpressVO vo : list) {
							
				%>
		    <tr>
		    	<td><%=vo.getReg_date() %></td>
		    	<td><%=vo.getUser_id() %></td>
		    	<td><%=vo.getOrderer() %></td>
		    	<td><%=vo.getExpress_company() %></td>
		    	<td> <button class="btn btn-primary btn-lg" data-toggle="modal" data-target="#myModal2" onClick="getExpressOne.do?express_id=<%=vo.getExpress_id() %>">확인<%=vo.getExpress_id() %></a></button>
		    	<%=vo.getReceiver() %></td>
		    </tr>
		  <%}} %>
		  </table>
		</div>
		
		<!-- Modal -->

<div class="modal fade" id="myModal2" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true"  >
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
        <h4 class="modal-title" id="myModalLabel">택배 수령자 입력</h4>
      </div>
      <div class="modal-body">
      
      <div align="left">
    <form action="updateExpress.do">
      	<input type="text" name="receiver" value="수령자">
      
      	<input type="text" name="express_id"  >
		<input type="submit" value="수령확인">
</form>	
</div>
	<br>
	<br>
	</div></div></div></div>	
		
		<div align="center">
	<ul class="pagination">
  <li><a href="#">&laquo;</a></li>
  <li><a href="#">1</a></li>
  <li><a href="#">2</a></li>
  <li><a href="#">3</a></li>
  <li><a href="#">4</a></li>
  <li><a href="#">5</a></li>
  <li><a href="#">&raquo;</a></li>
</ul></div>

	
	
          
        </div><!-- /.col-xs-12 main -->
    </div><!--/.row-->
  </div><!--/.container-->

</body>



 



  
<script type="text/javascript">

	 
</script>


</html>