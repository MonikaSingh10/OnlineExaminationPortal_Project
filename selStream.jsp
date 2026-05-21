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
        function validateForm() {
            let questions = document.getElementsByClassName("question");
            
            for (let i = 0; i < questions.length; i++) {
                let options = questions[i].getElementsByTagName("input");
                let checked = false;

                for (let j = 0; j < options.length; j++) {
                    if (options[j].checked) {
                        checked = true;
                        break;
                    }
                }

                if (!checked) {
                    alert("Please select your stream for your examnation " + (i + 1));
                    return false; // prevent form submission
                }
            }
            return true; // allow submission
        }
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
<%@ page import="java.io.*,java.util.*, java.sql.*"%>
<%@ page import="oracle.jdbc.driver.OracleConnection"%>
<%@ include file="Header.jsp"%>

<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet"	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">



<body onload="noBack();" onpageshow="if (event.persisted) noBack();" onunload="">
	<%
	   
	
        if ( request.getAttribute("user") != null ) {
            out.println("<h4><font style='color:tomato;font-size: larger'><b><center>" +  request.getAttribute("user").toString() + "</center></b></font></h4>");
        }
        %>

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
					<h4 class="header-line">Select your stream for Exam</h4>
				</div>

		<% 
		    String lsuser = (String) session.getAttribute("user");
            String msg = (String) request.getAttribute("msg");
            if (msg != null && !msg.equals("")) {
                out.println("<h4><font style='color:tomato;font-size: larger'><b><center>" + msg + "</center></b></font></h4>");
            }
        %>

			</div>

			<form action="TestServlet" method="post" onsubmit="return validateForm();">
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

										<div class="question">
											<p>2. Which language runs in a web browser?</p>
											<UI>
											<LI><input type="radio" name="stream" value="Java">  Java</LI>
											<LI><input type="radio" name="stream" value="C">   C</LI>
											<LI><input type="radio" name="stream" value="Python">  Python</LI>
											<LI><input type="radio" name="stream" value="JavaScript">  JavaScript</LI>
											<LI><input type="radio" name="stream" value="HTML">  HTML</LI>
											<LI><input type="radio" name="stream" value="MySql">   MySql</LI>
											<LI><input type="radio" name="stream" value="Oracle">  Oracle</LI>
											<LI><input type="radio" name="stream" value="Recat">   Recat</LI>
											</UI>										
										</div>

									</div>
									<br> <br>
                    <!-- Hidden input -->                              
                                <input type="hidden" name="hlsuser" value="<%=lsuser%>">

									<div style="margin-top: 10px;" align="center">
										<input type="submit" value="START " class="callValid btn btn-primary" onclick="return validate();">
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


