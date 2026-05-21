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
<%@ page import="com.idbi.Beans.ParticipantsResultBean"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<%@ include file="Adminheader.jsp"%>
<link rel="stylesheet" type="text/css" href="style_sheet1.css" />
<script type="text/javascript" src="javascript/JScript1.js"></script>
<script type="text/javascript" src="javascript/keyboard.js"></script>
<script type="text/javascript"	src="css/datatable/jquery.dataTables.min.js"></script>
<script type="text/javascript"	src="css/datatable/dataTables.buttons.min.js"></script>
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
			"bPaginate" : true,
			"bInfo" : true,
			"bFilter" : true,
			"bLengthChange" : true,
			"bAutoWidth" : false,
			dom : 'Bfrtip',
			buttons : [ {
				extend : 'excel',
				text : 'Export Excel',
				className : 'btn btn-primary',
				filename : 'NON-HINDI_QUIZ_REPORT',
				exportOptions : {
					modifier : {
						page : 'all'
					}
				}
			} ]
		});
	});
</script>


<script type="text/javascript">

history.pushState(null, null, location.href);
window.onpopstate = function () {
    history.go(1);
};

    // Disable back button
    window.history.forward();
    function noBack() { window.history.forward(); }
</script>
</head>

<body onload="noBack();" onpageshow="if (event.persisted) noBack();" onunload="">

	<div class="content-wrapper">
		<div class="container">
			<div class="row pad-botm">
				<div class="col-md-12">
					<h4 class="header-line">APPLIED QUIZ REPORT</h4>
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
									<th>Employee Name</th>
									<th>Exam Type</th>
									<th>Exam Start Time</th>
									<th>Exam End Time</th>
									<th>Not Applied</th>
									<th>Correct Answer</th>
									<th>Wrong Answer</th>
									<th>Q1</th>
									<th>Q2</th>
									<th>Q3</th>
									<th>Q4</th>
									<th>Q5</th>
									<th>Q6</th>
									<th>Q7</th>
									<th>Q8</th>
									<th>Q9</th>
									<th>Q10</th>
								</tr>
							</thead>
							<tbody>

					<%
					try {	
					List<ParticipantsResultBean> list = request.getAttribute("ParticepentsResult") != null ? (List) request.getAttribute("ParticepentsResult"): new ArrayList<ParticipantsResultBean>();
					//List<ParticipantsResultBean> list = request.getAttribute("ParticepentsResult") != null ? (List) request.getAttribute("ParticepentsResult"): new ArrayList<ParticipantsResultBean>();
					if (!list.isEmpty()) {
						for (ParticipantsResultBean obj : list) { 
					%>
					<tr>
						<td><%=obj.getEin()%></td>
						<td><%=obj.getName()%></td>
						<td><%=obj.getExamtype()%></td>
						<td><%=obj.getStarttime()%></td>
						<td><%=obj.getEndtime()%></td>
						<td><%=obj.getNotapplied()%></td>
						<td><%=obj.getCorrect()%></td>
						<td><%=obj.getWrong()%></td>
						<td><%=obj.getA1()%></td>
						<td><%=obj.getA2()%></td>
						<td><%=obj.getA3()%></td>
						<td><%=obj.getA4()%></td>
						<td><%=obj.getA5()%></td>
						<td><%=obj.getA6()%></td>
						<td><%=obj.getA7()%></td>
						<td><%=obj.getA8()%></td>
						<td><%=obj.getA9()%></td>
						<td><%=obj.getA10()%></td>			

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
			<!--End Advanced Tables -->
			<!--  </div>
            </div> -->
			<!-- /. ROW  -->

		</div>
	</div>


</body>
</html>