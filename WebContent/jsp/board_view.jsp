<%@page import="kr.ac.apart.vo.CommentsVO"%>
<%@page import="java.util.List"%>
<%@page import="kr.ac.apart.vo.BoardVO"%>
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
<script src="static/js/jquery-1.11.1.js"></script>
<title>Insert title here</title>

<%
	BoardVO vo = (BoardVO)request.getAttribute("vo");
%>

</head>
<body>

      
    <div class="container">

      <div class="row row-offcanvas row-offcanvas-left">
        
        <!-- sidebar -->
        <div class="col-xs-6 col-sm-3 sidebar-offcanvas" id="sidebar" role="navigation">

        	<font size="4">

            <ul class="nav">
              <li><a href="noticeBoard.do">�������� �Խ���</a></li>
              <li><a href="complainBoard.do">�ο� �Խ���</a></li>
              <li><a href="freeBoard.do">���� �Խ���</a></li>
               
            </ul>

            </font>
        </div>
  	

        <!-- main area -->

        <div class="col-xs-12 col-sm-9">
     
        <br>
        <center><h1><%=vo.getTitle() %></h1></center><br>
        <center><h1><%=vo.getWriter_id() %></h1></center><br>
        <textarea rows="20" cols="135">
			<%=vo.getContents() %>
		</textarea>
		<br><div align="right">
		<button type="submit" class="btn btn-default navbar-btn" ><a href="UpdateForm.do?board_no=<%=vo.getBoard_no()%>">����</a></button>
		<button type="submit" class="btn btn-default navbar-btn" ><a href="Delete.do?board_no=<%=vo.getBoard_no()%>">����</a></button>
		</div>
		
	
		 
            <!-- Default panel contents -->
                    	<%
			if("free".equals(vo.getCategory())){
				
			
		%>
		   <div class="container">
      <!-- main area -->
      <div class=" col-xs-3 col-sm-9">
         <div class="navbar-form navbar-center" role="search">
            <div class="form-group">
              <input type="hidden" class="form-control" placeholder="�Խ��ǳѹ�" size="5" id="comments_no"> &nbsp;&nbsp;&nbsp;&nbsp; 
              <input type="text" class="form-control" placeholder="�ۼ���" size="5" id="writer_id" value="<%=vo.getWriter_id()%>">
              <input type="text" class="form-control inline" placeholder="����� �Է����ּ���." size="88" id="contents">
              <button type="button" class="btn btn-default inline" id="addComments" value=<%=vo.getBoard_no() %>>�Է�</button><br><br>
     

            <!-- Table -->
    		<div>
            <table class="table" id="visitRecordTable">
               <tr>
                  <th><center>�ۼ���</center></th>
                  <th><center>���</center></th>
                  <th><center>��¥</center></th>
                  <th><center>����/����</center></th>
               </tr>
               <tr id="commentsTable">

                <% List<CommentsVO> comments = (List<CommentsVO>)request.getAttribute("commentsList");             
           
                  if(comments != null){
                  for(CommentsVO vc : comments){
                 	if(vc.getBoard_no() == vo.getBoard_no()){
                 		
                 
                 %>
               </tr>
               <tr>
                  <td><center><%=vc.getComments_no() %></center></td>
                  <td><center><%=vc.getWriter_id()%></center></td>
                  <td><center><%=vc.getContents() %></center></td>
                  <td><center><%=vc.getReg_date() %></center></td>
                  <td><center>
                  <button type="button" class="btn btn-default deleteVisitRecord" value="">����</button></center></td>
               </tr>
               <%}}} %>
            </table>
         </div>
         <%} %>
                 </div>

      </div>
    
        </div><!-- /.col-xs-12 main -->
    </div><!--/.row-->
  </div><!--/.container-->



</body>

<script type="text/javascript">
$("#addComments").click(function() {
            $.ajax({
              url : "addComments.do",
              type : "get",
              dataType : "json",
              data : {
            	  board_no : $("#addComments").val(),
            	  writer_id : $("#writer_id").val(),
            	  contents : $("#contents").val()
              },
              contentType : "application/json; charset=utf-8",
              success : function(data) {
           	    $("#commentsTable").after(
           			"<tr><td><center>" + data.writerId + "</center></td><td><center>" 
           			+ data.contents + "</center></td><td><center>"
           			+ data.commentsRegDate + "</center></td><td><center><button type='button' class='btn btn-default'  value='" + data.recordNo +"'>" + '����' + "</button></center></td></tr>"
           	   ); 

              },
              error : function(e) {
                 alert("error");
        
              }

           }); 
        });
</script>

</html>