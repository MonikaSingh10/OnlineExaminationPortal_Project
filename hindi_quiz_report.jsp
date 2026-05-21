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
<script type="text/javascript" src="javascript/JScript1.js">
	
</script>

<script type="text/javascript" src="javascript/keyboard.js"></script>

<script type="text/javascript"
	src="css/datatable/jquery.dataTables.min.js"></script>
<script type="text/javascript"
	src="css/datatable/dataTables.buttons.min.js"></script>
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
				filename : 'HINDI_QUIZ_REPORT',
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

	<%
		Statement st = null;
		ResultSet rs = null;
		PreparedStatement pstatement = null;
		Connection conn;
		try {

			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521/xe","GMIP_FEED", "GMIP_FEED");

			String query = " select a.EIN ,a.NAME ,a.TYPE ,a.APPLIED_DATE as start_time , b.ENTRY_DATE as end_time, b.NOT_FILLED as not_applied ,b.CORRECT,b.WRONG,"
                   + " nvl(Q1,'-') Q1, nvl(Q2,'-') Q2, nvl(Q3,'-') Q3,nvl(Q4,'-') Q4, nvl(Q5,'-') Q5 ,nvl(Q6,'-') Q6, "
                   + " nvl(Q7,'-') Q7, nvl(Q8,'-') Q8,nvl(Q9,'-') Q9, nvl(Q10,'-') Q10 ,nvl(Q11,'-') Q11, nvl(Q12,'-') Q12,"
                   + " nvl(Q13,'-') Q13,nvl(Q14,'-') Q14, nvl(Q15,'-') Q15, nvl(Q16,'-') Q16, nvl(Q17,'-') Q17, nvl(Q18,'-') Q18,"
                   + " nvl(Q19,'-') Q19, nvl(Q20,'-') Q20, nvl(Q21,'-') Q21, nvl(Q22,'-') Q22, nvl(Q23,'-') Q23,nvl(Q24,'-') Q24,"
                   + " nvl(Q25,'-') Q25, nvl(Q26,'-') Q26, nvl(Q27,'-') Q27, nvl(Q28,'-') Q28,nvl(Q29,'-') Q29, nvl(Q30,'-') Q30 ,"
                   + " nvl(Q31,'-') Q31, nvl(Q32,'-') Q32, nvl(Q33,'-') Q33, nvl(Q34,'-') Q34,nvl(Q35,'-') Q35, nvl(Q36,'-') Q36 ,"
                   + " nvl(Q37,'-') Q37, nvl(Q38,'-') Q38, nvl(Q39,'-') Q39, nvl(Q40,'-') Q40 "
                   + " from  quiz_applied  a,  quiz_data b"
                   + "	where a.EIN= b.EIN "
                   + "	and a.TYPE like 'Hindi%' ";

			pstatement = conn.prepareStatement(query);
			rs = pstatement.executeQuery();
	%>


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
									<th>Type</th>
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

									<th>Q11</th>
									<th>Q12</th>
									<th>Q13</th>
									<th>Q14</th>
									<th>Q15</th>
									<th>Q16</th>
									<th>Q17</th>
									<th>Q18</th>
									<th>Q19</th>
									<th>Q20</th>

									<th>Q21</th>
									<th>Q22</th>
									<th>Q23</th>
									<th>Q24</th>
									<th>Q25</th>
									<th>Q26</th>
									<th>Q27</th>
									<th>Q28</th>
									<th>Q29</th>
									<th>Q30</th>

									<th>Q31</th>
									<th>Q32</th>
									<th>Q33</th>
									<th>Q34</th>
									<th>Q35</th>
									<th>Q36</th>
									<th>Q37</th>
									<th>Q38</th>
									<th>Q39</th>
									<th>Q40</th>


								</tr>
							</thead>
							<tbody>

								<%
									while (rs.next()) {
								%>
								<tr>

									<td><%=rs.getString("EIN")%></td>
									<td><%=rs.getString("NAME")%></td>
									<td><%=rs.getString("TYPE")%></td>
									<td><%=rs.getString("start_time")%></td>
									<td><%=rs.getString("end_time")%></td>
									<td><%=rs.getString("not_applied")%></td>
									<td><%=rs.getString("CORRECT")%></td>
									<td><%=rs.getString("WRONG")%></td>
									

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

									<td><%=rs.getString("Q11")%></td>
									<td><%=rs.getString("Q12")%></td>
									<td><%=rs.getString("Q13")%></td>
									<td><%=rs.getString("Q14")%></td>
									<td><%=rs.getString("Q15")%></td>
									<td><%=rs.getString("Q16")%></td>
									<td><%=rs.getString("Q17")%></td>
									<td><%=rs.getString("Q18")%></td>
									<td><%=rs.getString("Q19")%></td>
									<td><%=rs.getString("Q20")%></td>

									<td><%=rs.getString("Q21")%></td>
									<td><%=rs.getString("Q22")%></td>
									<td><%=rs.getString("Q23")%></td>
									<td><%=rs.getString("Q24")%></td>
									<td><%=rs.getString("Q25")%></td>
									<td><%=rs.getString("Q26")%></td>
									<td><%=rs.getString("Q27")%></td>
									<td><%=rs.getString("Q28")%></td>
									<td><%=rs.getString("Q29")%></td>
									<td><%=rs.getString("Q30")%></td>

									<td><%=rs.getString("Q31")%></td>
									<td><%=rs.getString("Q32")%></td>
									<td><%=rs.getString("Q33")%></td>
									<td><%=rs.getString("Q34")%></td>
									<td><%=rs.getString("Q35")%></td>
									<td><%=rs.getString("Q36")%></td>
									<td><%=rs.getString("Q37")%></td>
									<td><%=rs.getString("Q38")%></td>
									<td><%=rs.getString("Q39")%></td>
									<td><%=rs.getString("Q40")%></td>

								</tr>
								<%
									}
								%>
							</tbody>
							<%
								} catch (Exception ex) {
									System.out.println(ex.getMessage());
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