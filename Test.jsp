<%    
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1
	response.setHeader("Pragma", "no-cache"); // HTTP 1.0
	response.setDateHeader("Expires", 0); // Proxies

	 if (session == null || session.getAttribute("user") == null) {
	        response.sendRedirect("Login.jsp");
	        return;
	    }    
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">

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

<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/jquery.min.js"></script>


<%@ page import="java.io.*,java.util.*, java.sql.*"%>
<%@ page import="oracle.jdbc.driver.OracleConnection"%>

<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet"	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">




<body onload="noBack();" onpageshow="if (event.persisted) noBack();" onunload="">

	<%@ include file="Header.jsp"%>

	<div class="content-wrapper">

		<div class="container">
			<!-- Alert Start  -->
			<!-- Success Alert -->
			<div class="alert alert-success alert-msg" id="SAlert" role="alert">
				<button type="button" class="close" data-dismiss="alert"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<strong id="SVal"></strong>
			</div>
			<!-- Warning Alert -->
			<div class="alert alert-warning alert-msg" id="WAlert" role="alert">
				<button type="button" class="close" data-dismiss="alert"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<strong id="WVal"></strong>
			</div>
			<!-- Danger Alert -->
			<div class="alert alert-danger alert-msg" id="DAlert" role="alert">
				<button type="button" class="close" data-dismiss="alert"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<strong id="DVal"></strong>
			</div>
			<!-- Alert END -->

			<div class="row pad-botm">
				<div class="col-md-12">
					<h4 class="header-line">STUDENT DETAILS</h4>
				</div>

		<%
            String msg = (String) request.getAttribute("msg");
            if (msg != null && !msg.equals("")) {
                out.println("<h4><font style='color:tomato;font-size: larger'><b><center>" + msg + "</center></b></font></h4>");
            }
        %>

			</div>

			<form action="TestServlet" method="post">
				<div class="row">
					<div class="col-md-12">
						<!-- Advanced Tables -->
						<div class="panel panel-default">
							<!-- <div class="panel-heading">
                             New Request
                        </div> -->
							<div class="panel-body">
								<div class="containerForm">

									<!-- </div>  -->
									<div class="row">

										<div class="col-md-4">
											<label for="ein">RollNo</label> <input type="text" id="ein"
												name="ein" value="<%=empDetail.getEin()%>" readonly
												class="callValid form-control" autocomplete="off">
										</div>

										<div class="col-md-4">
											<label for="e_name"> NAME</label> <input type="text"
												id="e_name" name="e_name" value="<%=empDetail.getName()%>"
												readonly class="callValid form-control" autocomplete="off">
										</div>

										<div class="col-md-4">
											<label for="desgntn">DESIGNATION</label> <input type="text"
												id="desgntn" name="desgntn"
												value="<%=empDetail.getDesignation()%>" readonly
												class="callValid form-control" autocomplete="off">
										</div>

									</div>
									<br>

									<div class="row">

										<div class="col-md-4">
											<label for="e_mail">EMAIL-ID</label> <input type="text"
												id="e_mail" name="e_mail" value="<%=empDetail.getEmail()%>"
												readonly class="callValid form-control" autocomplete="off">
										</div>


                                         <div class="col-md-4">
											<label for="e_mail">Mobile Number</label> <input type="text"
												id="mobile_no" name="mobile_no" value="<%=empDetail.getMobile_no()%>"
												readonly class="callValid form-control" autocomplete="off">
										</div>
										
										
										

										<div class="col-md-4">
											<label for="e_mail">CITY</label> <input type="text"
												id="city" name="city" value="<%=empDetail.getCity()%>"
												readonly class="callValid form-control" autocomplete="off">
										</div>
									</div>



									<br>

									<div class="row">

										<div class="col-md-4">
											<label for="e_org">PINCODE</label> <input type="text"
												id="e_org" name="e_org"
												value="<%=empDetail.getDepartment()%>" readonly
												class="callValid form-control" autocomplete="off">
										</div>


										<div class="col-md-4">
											<label for="e_region">STATE</label> <input type="text"
												id="e_region" name="e_region"
												value="<%=empDetail.getRegion()%>" readonly
												class="callValid form-control" autocomplete="off">
										</div>


									</div>

									<br>

                           
									<%-- <div class="row">

										<div class="col-md-4">
											<label for="e_super_ein">SUPERVISIOR EIN</label> <input
												type="text" id="e_super_ein" name="e_super_ein"
												value="<%=empDetail.getSupEin()%>" readonly
												class="callValid form-control" autocomplete="off">
										</div>


										<div class="col-md-4">
											<label for="e_super_name">SUPERVISIOR NAME</label> <input
												type="text" id="e_super_name" name="e_super_name"
												value="<%=empDetail.getSupName()%>" readonly
												class="callValid form-control" autocomplete="off">
										</div>

										<div class="col-md-4">
											<label for="e_super_mail">SUPERVISIOR EMAIL-ID</label> <input
												type="text" id="e_super_mail" name="e_super_mail"
												value="<%=empDetail.getSup_email_address()%>" readonly
												class="callValid form-control" autocomplete="off">
										</div>

									</div>
 --%>



									<div style="margin-top: 10px;" align="center">
										<input type="submit" value="START "
											class="callValid btn btn-primary"
											onclick="return validate();">
									</div>

								</div>
							</div>
						</div>
						<!--End Advanced Tables -->
					</div>
				</div>

			</form>
			<!-- /. ROW  -->

		</div>
	</div>
	<!-- CONTENT-WRAPPER SECTION END-->

	<%@ include file="footer.jsp"%>

</body>

</html>


