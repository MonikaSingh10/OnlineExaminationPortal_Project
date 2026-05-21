<%    
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1
	response.setHeader("Pragma", "no-cache"); // HTTP 1.0
	response.setDateHeader("Expires", 0); // Proxies

	 if (session == null || session.getAttribute("user") == null) {
	        response.sendRedirect("Login.jsp");
	        return;
	    }    
%>

<%@page language="java" contentType="text/html ;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*, java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

 <%@ include file="Adminheader.jsp"%>
 <link rel="stylesheet" type="text/css" href="style_sheet1.css" />
 <script type="text/javascript" src="javascript/JScript1.js">  </script>   
 <script type="text/javascript" src="javascript/keyboard.js"></script>
<script type="text/javascript" src="css/datatable/jquery.dataTables.min.js"></script>
 <script type="text/javascript" src="css/datatable/dataTables.buttons.min.js"></script>
 <script type="text/javascript" src="css/datatable/buttons.flash.min.js"></script>
 <script type="text/javascript" src="css/datatable/jszip.min.js"></script>
 <script type="text/javascript" src="css/datatable/pdfmake.min.js"></script>
 <script type="text/javascript" src="css/datatable/vfs_fonts.js"></script>
 <script type="text/javascript" src="css/datatable/buttons.html5.min.js"></script>
 <script type="text/javascript" src="css/datatable/buttons.print.min.js"></script>
    



<script type="text/javascript">
	$(document).ready(function() {
		$('#dataTables-example').DataTable({
			//"lengthMenu" : [ [ -1 ], [ "All" ] ],
		     "bPaginate": true,
             "bInfo": true,
             "bFilter": true,
             "bLengthChange": true,
             "bAutoWidth": false,
			dom : 'Bfrtip',
			buttons : [ {
				extend : 'excel',
				text : 'Export Excel',
				className: 'btn btn-primary',
				filename : 'APPLIED_QUIZ_REPORT',
				exportOptions : {
					modifier : {
						page : 'all'
					}
				}
			} ]
		});
	});

</script>
 
</head>

<body>

	<div class="content-wrapper">
		<div class="container">
			<div class="row pad-botm">
				<div class="col-md-12">
					<h4 class="header-line">Online Exam Participation Report</h4>
				</div>

			</div>
			<div class="row">
		<div class="col-md-12">

		<div class="table-responsive">
			<table class="table table-striped table-bordered table-hover"
					id="dataTables-example">
				<thead>
				  <tr>
					<th>EIN</th>
					<th>EMPLOYEE NAME</th>
					<th>EMPLOYEE EMAIL-ID</th>
					<th>APPLIED DATE</th>
					<th>STREAM</th>
				  </tr>
					</thead>
				<tbody>

					<%
					try {						
					List<UserBean> list = request.getAttribute("appliedlist") != null ? (List) request.getAttribute("appliedlist"): new ArrayList<UserBean>();
					if (!list.isEmpty()) {
						for (UserBean obj : list) { 
					%>
					<tr>							
						<td><%=obj.getEin()%></td>
						<td><%=obj.getName()%></td>
						<td><%=obj.getEmail()%></td>
						<td><%=obj.getAppliedDate()%></td>
						<td><%=obj.getExamtype()%></td>
						
					</tr>
					<%
					  } 
						}
					
					} catch (Exception ex) {
						System.out.print(ex.getMessage());
						}
					%>
				</tbody>
				
				</table>
					</div>

				</div>
			</div>
			
		</div>
	</div>


</body>
</html>