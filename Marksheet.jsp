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
<%@ page import="oracle.jdbc.driver.OracleConnection"%>
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
				filename : 'EMPLOYEES_MARKSHEET',
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
    // Disable back button
    window.history.forward();
    function noBack() { window.history.forward(); }
</script>
</head>

<body onload="noBack();" onpageshow="if (event.persisted) noBack();" onunload="">


	<%
	    Statement st = null;
		ResultSet rs = null;
		PreparedStatement pstatement=null;
		Connection conn;
		try {
			
			//String query = "SELECT EIN, NAME, CORRECT, WRONG, NOT_FILLED AS NOT_APPLIED, NVL(Q1,'-') Q1, NVL(Q2,'-') Q2, NVL(Q3,'-') Q3, NVL(Q4,'-') Q4, NVL(Q5,'-') Q5, NVL(Q6,'-') Q6, NVL(Q7,'-') Q7, NVL(Q8,'-') Q8, NVL(Q9,'-') Q9, NVL(Q10,'-') Q10 FROM QUIZ_DATA";
			//Class.forName("oracle.jdbc.driver.OracleDriver");
			//conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521/xe", "GMIP_FEED", "GMIP_FEED");
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3307/test", "root", "root");
			String query = "SELECT EIN, NAME, CORRECT, WRONG, NOT_FILLED AS NOT_APPLIED,STREAM, IFNULL(Q1,'-') Q1, IFNULL(Q2,'-') Q2, IFNULL(Q3,'-') Q3, IFNULL(Q4,'-') Q4, IFNULL(Q5,'-') Q5, IFNULL(Q6,'-') Q6, IFNULL(Q7,'-') Q7, IFNULL(Q8,'-') Q8, IFNULL(Q9,'-') Q9, IFNULL(Q10,'-') Q10 FROM QUIZ_DATA";
			pstatement = conn.prepareStatement(query);
			rs = pstatement.executeQuery();
	%>


	<div class="content-wrapper">
		<div class="container">
			<div class="row pad-botm">
				<div class="col-md-12">
					<h4 class="header-line">Online Exam Response Report</h4>
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
									 <th>Correct Answer</th>
									<th>Wrong Answer</th> 
									<th>Not Applied</th>
									<th>STREAM</th>
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
									while (rs.next()) {
								%>
								<tr>
									<td><%=rs.getString("ein")%></td>
									<td><%=rs.getString("name")%></td>
									 <td><%=rs.getString("correct")%></td>
									<td><%=rs.getString("wrong")%></td> 
									<td><%=rs.getString("Not_applied")%></td>
									<td><%=rs.getString("STREAM")%></td>
									<td><%=rs.getString("Q1")%></td>
									<td><%=rs.getString("Q2")%></td>
									<td><%=rs.getString("Q3")%></td>
									<td><%=rs.getString("Q4")%></td>
									<td><%=rs.getString("Q5")%></td>
									<td><%=rs.getString("Q6")%></td>
									<td><%=rs.getString("Q7")%></td>
									<td><%=rs.getString("Q8")%></td>
									<td><%=rs.getString("Q9")%></td>
									<td><%=rs.getString("Q10")%></td>									
								</tr>
								<%
									}
								%>
							</tbody>
						     <%
							} catch (Exception ex) {
							//System.out.print(ex.getMessage());
							}
							%>
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