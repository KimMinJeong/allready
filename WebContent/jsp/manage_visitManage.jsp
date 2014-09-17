<%@page import="kr.ac.apart.vo.Visit_RecordVO"%>
<%@page import="java.util.List"%>
<%@page import="kr.ac.apart.vo.VisitorVO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
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
<script src="//cdnjs.cloudflare.com/ajax/libs/respond.js/1.4.2/respond.min.js"></script>
<title>������_�湮����</title>
</head>
<body>
   <div class="container">
      <!-- main area -->
      <!--  <div class=" col-xs-3 col-sm-9">-->
         <div class="navbar-form navbar-center" role="search">
            <div class="form-group">
               <input type="text" class="form-control" placeholder="��/ȣ��" size="19" id="user_id"> &nbsp;&nbsp;&nbsp;&nbsp; 
               <input type="text" class="form-control" placeholder="�湮�� �ź�" size="19" id="visitor_name"> &nbsp;&nbsp;&nbsp;&nbsp; 
               <input type="text" class="form-control inline" placeholder="�빫" size="48" id="business">&nbsp;
               <button type="button" class="btn btn-default inline" id="addVisitorManagerButton">�Է�</button>
            </div>
         </div>
     <!-- </div>-->
      <br> <br> <br>

      <form class="navbar-form navbar-right" role="search">
         <div class="form-group">
            <input type="text" class="form-control" placeholder="�湮�� �ź�" size="20%" align="center" name="user_id" id="searchUserId">
         </div>
         <button type="button" class="btn btn-default" id="searching">�˻�</button>
      </form>
      <br> <br>

      <div class="col-sm-12 col-xs-12">
         <div class="panel panel-default">
            <!-- Default panel contents -->
            <div class="panel-heading">
               <center>������ �湮�� ����Ʈ</center>
            </div>

            <!-- Table -->
            <table class="table" id="visitorTable">
               <thead>
                  <tr>
                     <th><center>��/ȣ��</center></th>
                     <th><center>�湮�ڽź�</center></th>
                     <th><center>�빫</center></th>
                     <th><center>����/�Ͻ�</center></th>
                     <th><center>�Է�</center></th>
                  </tr>
               </thead>

               <tbody id = "searchVisitor">
               
                  <%-- <%
                     int i=0;    //��ư�� td���� �ٸ� class���� �ֱ����� +i�� ���� ����
                        List<VisitorVO> visitorList = (List<VisitorVO>) request.getAttribute("VisitorManagerFlag");
                        if (visitorList != null) {
                           if (visitorList.size() == 0) {
                  %>
                  <tr>
                     <td colspan="5"><center>��ġ�ϴ� �˻������ �����ϴ�.</center></td>
                  </tr>
                  <%
                  }
                  else {
                      
                     for (VisitorVO vo : visitorList) {
                        i++;
                  %>
                  <tr>
                     <td class = "userId<%=i%>"><center><%=vo.getUser_id()%></center></td>
                     <td class = "visitorName<%=i%>"><center><%=vo.getVisitor_name()%></center></td>
                     <td class = "business<%=i%>"><center><%=vo.getBusiness()%></center></td>
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
                           <button type="button"
                              class="btn btn-default insertVisitButton[<%=i%>]">�Է�</button>
                        </center></td>
                  </tr>
                  <%
                        }
                      }
                           }
                         else if (visitorList == null) {
                  %>
                  <tr>
                     <td colspan="5"><center>�˻�� �Է����ּ���.</center></td>
                  </tr>
                  <%
                        }
                  %>
               </tbody> --%>

            </table>
         </div>
         <br>

         <!-- �湮 ��� ����Ʈ ���̺� -->
         <div class="panel panel-default">
            <!-- Default panel contents -->
            <div class="panel-heading">
               <center>�湮 ��� ����Ʈ</center>
            </div>

            <!-- Table -->
            <table class="table" id="visitRecordTable">
               <tr>
                  <th><center>��/ȣ��</center></th>
                  <th><center>�湮�ڽź�</center></th>
                  <th><center>�빫</center></th>
                  <th><center>��¥</center></th>
                  <th><center>����/����</center></th>
               </tr>
               <tr id="add">

                  <% List<Visit_RecordVO> visitRecord = (List<Visit_RecordVO>)request.getAttribute("visitRecord"); 
                     List<VisitorVO> visitorListAll = (List<VisitorVO>)request.getAttribute("visitorList");
               
                  if(visitorListAll != null){
                  for(Visit_RecordVO vr : visitRecord){
                     for(VisitorVO v : visitorListAll ){
                        if(v.getVisitor_no() == vr.getVisitor_no()){%>
               
               <tr>
                  <td><center><%=v.getUser_id() %></center></td>
                  <td><center><%=v.getVisitor_name() %></center></td>
                  <td><center><%=v.getBusiness() %></center></td>
                  <td><center><%=vr.getReg_date() %></center></td>
                  <td><center><button type="button" class="btn btn-default" id="#" value="<%=vr.getVisit_record_no()%>">����</button>  <button type="button" class="btn btn-default deleteVisitRecord" value="<%=vr.getVisit_record_no()%>">����</button></center></td>
               </tr>
               <%}}}} %>
            </table>
         </div>

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

<script type="text/javascript">
   
$("#addVisitorManagerButton").on('click',    //��,ȣ�� , �̸�, �빫 �Է� �� �߰� ��ư Ŭ����
         function() { //���� �Է�
            $.ajax({
               url : "addVisitorManager.do",
               type : "get",
               dataType : "json",
               data : {
                  user_id : $("#user_id").val(),
                  visitor_name : $("#visitor_name").val(),
                  business : $("#business").val()
               },
               contentType : "application/json; charset=utf-8",
               success : function(data) {
            	   alert("success");
                  var reg = data.add2;
                  $("#add").after(
                        //append�� �������� �ڽ����� �ٰ� after�� ���� ������ ����.
                        "<tr><td><center>" + data.add.user_id
                              + "</center></td><td><center>"
                              + data.add.visitor_name
                              + "</center></td><td><center>"
                              + data.add.business
                              + "</center></td><td><center>" + reg
                              + "</center></td><td><center><button type='button' class='btn btn-default'  value='" + data.recordNo +"'>" + '����' + "</button>" + '  ' + "<button type='button' class='btn btn-default deleteVisitRecord' value='"+data.recordNo+"'>" + '����' + "</button></center></td></tr>");
               },
               error : function(e) {
                  alert("error");
         
               }

            });
         });
         
   var rowCount;  //�������� ������ table row ���� ����

   $("#searching").on('click', function() {
      $("#visitorTable tr:not(:first)").remove();   //���̺��� ù�໩�� ��� ����
      $.ajax({
         url : "getVisitor.do",
         type : "get",
         dataType : "json",
         data : {
            userId3 : $("#searchUserId").val(),
         },
         contentType : "application/json; charset=utf-8",
         success : function(data) {
         var content = "";      
         var i=0;
         rowCount = 0;
            $.each(data.visitorListModel, function(key,visitor) {         
                  i++;
                  rowCount++;
                  content += "<tr id='"+ rowCount +"' class='"+ visitor.visitor_no+ "'>";
                  //content += "<td id='rowCount" + rowCount + "'><center>"+ rowCount + "</center></td>";
                  content += "<td id='userId" + i + "'><center>" + visitor.user_id + "</center></td>";
                  content += "<td id='visitorName" + i + "'><center>" + visitor.visitor_name + "</center></td>";
                  content += "<td id='business" + i + "'><center>" +visitor.business + "</center></td>";
                  if(visitor.fixed == "UNFIXED"){
                     content += "<td id='fixed" + i + "'><center>" + '�Ͻ�' + "</center></td>";
                  }
                  else if(visitor.fixed == "FIXED"){
                     content += "<td id='fixed" + i + "'><center>" + '����' + "</center></td>";
                  }
                  content += "<td><center><button type='button' class='btn btn-default' id='insertButton" + i + "' >" + '�Է�' + "</button></center></td></tr>";
            });
            $("#searchVisitor").append(content);
         },
         error:function(request,status,error){
                alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
         }
      });
   });

   for(var i=1; i<5; i++){
   $(document).on('click','#insertButton'+i, function(){  //�˻��� �湮�� �湮������Ʈ�� �߰�
      var trid=$(this).closest('tr').attr('id');    //Ŭ���� �� tr�� id
      alert(typeof rowCount);
      alert("trid : " + trid);
       $.ajax({
            url : "insertVisit.do",
            type : "get",
            dataType : "json",
            data : {
               insertUserNo : $(this).closest('tr').attr('class'),
               insertUserId : $("#visitorTable #userId"+trid).text(),
               insertVisitorName : $("#visitorTable #visitorName"+trid).text(),
               insertBusiness :  $("#visitorTable #business"+trid).text()
            },
            contentType : "application/json; charset=utf-8",
            success : function(data) {
               alert("success");
               $("#add").after(
                     //append�� �������� �ڽ����� �ٰ� after�� ���� ������ ����.
                     "<tr><td><center>" + data.user_id
                           + "</center></td><td><center>"
                           + data.visitor_name
                           + "</center></td><td><center>"
                           + data.business
                           + "</center></td><td><center>" + data.regdate
                           + "</center></td><td><center><button type='button' class='btn btn-default' value='" + data.recordNo +"'>" + '����' + "</button>" + '  ' + "<button type='button' class='btn btn-default deleteVisitRecord' value='" + data.recordNo +"'>" + '����' + "</button></center></td></tr>");    
            },
            error : function(e) {
               alert(e.responseText);
            }
         }); 
   });
   }

   $(document).on('click','.deleteVisitRecord', function(){         //������ư Ŭ����
            alert($(this).closest('button').attr('value'));
            var clickedRow = $(this).closest('tr');              //Ŭ���� tr ��������
             $.ajax({
                  url : "deleteVisitRecord.do",
                  type : "get",
                  dataType : "json",
                  data : {
                     visitRecordNo : $(this).closest('button').attr('value'),
                  },
                  contentType : "application/json; charset=utf-8",
                  success : function(data) {
                     alert("success!");
                     clickedRow.remove();
                  },
                  error : function(e) {
                     alert("error!");
                  }
             });
   });
</script>
</html>