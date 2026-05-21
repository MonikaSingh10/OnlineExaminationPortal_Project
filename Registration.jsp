<%
    response.setHeader("Cache-Control","no-cache, no-store, must-revalidate"); // HTTP 1.1
    response.setHeader("Pragma","no-cache"); // HTTP 1.0
    response.setDateHeader("Expires", 0); // Proxies
%> 
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<head>
<link rel="stylesheet" 	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">

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

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">


 <script>
function validateForm() {
	  let ein = document.forms["myForm"]["ein"].value;
	  let text;
	  if (ein == "") {
		  text="EIN must be filled out";
	      alert("EIN must be filled out");	    
	    return false;
	  }else{
		  if (isNaN(ein) || x < 1 || x > 10) {
			    text = "EIN must be Numric Value";
			    alert("EIN must be Numric Value");
			    return false;
			  }
	  }
	  console.log(ein);
	  document.getElementById("ein").innerHTML = text;
	  debugger;
	  
	  let e_name = document.forms["myForm"]["e_name"].value;
	  if (e_name == "") {
	    alert("EMPLOYEE NAME must be filled out");
	    return false;
	  }
	  debugger;
	  let desgntn = document.forms["myForm"]["desgntn"].value;
	  if (desgntn == "") {
	    alert("DESIGNATION must be filled out");
	    return false;
	  }  
	  debugger;
	  const emailPattern = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;
	  let e_mail = document.forms["myForm"]["e_mail"].value;
	  if (e_mail === "") {
	        setError("emailError", "EMAIL-ID must be filled out");
	        valid = false;
	    } else if (!emailPattern.test(e_mail)) {
	        setError("emailError", "Please enter a valid EMAIL-ID (e.g. example@gmail.com)");
	        valid = false;
	    }
	  debugger;
	  let mobile_no = document.forms["myForm"]["mobile_no"].value;
	  if (mobile_no == "") {
	    alert("Mobile Number must be filled out");
	    return false;
	  }   
	  debugger;
	  let city = document.forms["myForm"]["city"].value;
	  if (city == "") {
	    alert("CITY must be filled out");
	    return false;
	  }
	  debugger;
	  let pincode = document.forms["myForm"]["pincode"].value;
	  if (pincode == "") {
	    alert("PINCODE must be filled out");
	    return false;
	  }else{
		  if (isNaN(pincode) || x < 1 || x > 10) {
			    text = "pincode must be Numric Value";
			    alert("PINCODE must be Numric Value");
			    return false;
			  }
	  }
	  debugger;
	  let state = document.forms["myForm"]["state"].value;
	  if (state == "") {
	    alert("STATE must be filled out");
	    return false;
	  }
	  debugger;
	  const passwordPattern = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$/;
	  let password = document.forms["myForm"]["password"].value;
	    if (password === "") {
        setError("passError", "PASSWORD must be filled out");
        valid = false;
    } else if (!passwordPattern.test(password)) {
        setError("passError", "Password must include uppercase, lowercase, number, special char (min 8 chars)");
        valid = false;
    }
	}
</script>  
 
<!-- <script>
function validateForm(event) {
    event.preventDefault(); // prevent form submit until valid

    let valid = true;
    document.querySelectorAll(".error-message").forEach(el => el.textContent = ""); // clear old errors

    // Get all fields
    const form = document.forms["myForm"];
    const ein = form["ein"].value.trim();
    const e_name = form["e_name"].value.trim();
    const desgntn = form["desgntn"].value.trim();
    const e_mail = form["e_mail"].value.trim();
    const mobile_no = form["mobile_no"].value.trim();
    const city = form["city"].value.trim();
    const pincode = form["pincode"].value.trim();
    const state = form["state"].value.trim();
    const password = form["password"].value.trim();

    // 🔹 Patterns
    const emailPattern = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;
    const mobilePattern = /^[0-9]{10}$/;
    const pinPattern = /^[0-9]{6}$/;
    const passwordPattern = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$/;

    // 🔹 EIN
    if (ein === "") {
        setError("einError", "EIN must be filled out");
        valid = false;
    } else if (isNaN(ein)) {
        setError("einError", "EIN must be numeric");
        valid = false;
    }

    // 🔹 NAME
    if (e_name === "") {
        setError("nameError", "Employee NAME must be filled out");
        valid = false;
    }

    // 🔹 DESIGNATION
    if (desgntn === "") {
        setError("desgError", "DESIGNATION must be filled out");
        valid = false;
    }

    // 🔹 EMAIL
    if (e_mail === "") {
        setError("emailError", "EMAIL-ID must be filled out");
        valid = false;
    } else if (!emailPattern.test(e_mail)) {
        setError("emailError", "Please enter a valid EMAIL-ID (e.g. example@gmail.com)");
        valid = false;
    }

    // 🔹 MOBILE NUMBER
    if (mobile_no === "") {
        setError("mobileError", "Mobile Number must be filled out");
        valid = false;
    } else if (!mobilePattern.test(mobile_no)) {
        setError("mobileError", "Mobile Number must be 10 digits");
        valid = false;
    }

    // 🔹 CITY
    if (city === "") {
        setError("cityError", "CITY must be filled out");
        valid = false;
    }

    // 🔹 PINCODE
    if (pincode === "") {
        setError("pinError", "PINCODE must be filled out");
        valid = false;
    } else if (!pinPattern.test(pincode)) {
        setError("pinError", "PINCODE must be 6 digits");
        valid = false;
    }

    // 🔹 STATE
    if (state === "") {
        setError("stateError", "STATE must be filled out");
        valid = false;
    }

    // 🔹 PASSWORD
    if (password === "") {
        setError("passError", "PASSWORD must be filled out");
        valid = false;
    } else if (!passwordPattern.test(password)) {
        setError("passError", "Password must include uppercase, lowercase, number, special char (min 8 chars)");
        valid = false;
    }

    // Submit if valid
    if (valid) form.submit();
}

// 🔸 Function to show error messages
function setError(id, message) {
    document.getElementById(id).textContent = message;
}
</script>
-->
 
<a class="navbar-brand"> <img src="/OnlineExamPortal/images/exam.png" height=50px width=250px alt="EXAMINATION">
				</a>
<body onload="noBack();" onpageshow="if (event.persisted) noBack();" onunload="">

	<div class="content-wrapper">
		
		<div class="container">
		
			
			<!-- Alert END -->

			 <div class="row pad-botm">
				<div class="col-md-12">
					&nbsp;&nbsp;
					 <%
					        String fail = (String) request.getAttribute("fail");
				            String msg = (String) request.getAttribute("msg");
				            if (msg != null && !msg.equals("")) {
				                out.println("<h4><font style='color:green;font-size: larger'><b><center>" + msg + "</center></b></font></h4>");
				            }
				            if (fail != null && !fail.equals("")) {
				                out.println("<h4><font style='color:red;font-size: larger'><b><center>" + fail + "</center></b></font></h4>");
				            }
				        %>
				</div>				

			</div> 
			
			<!-- Danger Alert -->
			<h4><div class="alert alert-danger " id="DAlert" role="alert" align="center">				
				<strong id="DVal" align="center">&nbsp;&nbsp;&nbsp;&nbsp;Employee Registration for an online exam</strong>	
							
			</div></h4>
			<!-- onsubmit="return validateForm()" -->
			 <form action ="Registration" name="myForm"   method="post">
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
									<div class="row" style="margin-top:1px;" align="center">

																				
										<div style="margin-top:1px;" align="left">
											<label for="ein"> PARTICIPATS ID</label> 
											<input type="text" id="ein" name="ein" placeholder="Enter your PARTICIPATS ID"  class="callValid form-control" autocomplete="off">
										</div>

										<div style="margin-top:1px;" align="left">
											<label for="e_name"> NAME</label> 
												<input type="text" id="e_name" name="e_name" placeholder="Enter your NAME" class="callValid form-control" autocomplete="off">
										</div>

										<div style="margin-top:1px;" align="left">
											<label for="desgntn">DESIGNATION</label>
												<input type="text" id="desgntn" name="desgntn" placeholder="Enter your DESIGNATION" class="callValid form-control" autocomplete="off">
										</div>
										
										<div style="margin-top:1px;" align="left">
											<label for="e_mail">EMAIL-ID</label>
												<input type="text" id="e_mail" name="e_mail" placeholder="Enter your e_mail" class="callValid form-control" autocomplete="off">
										</div>


                                         <div style="margin-top:1px;" align="left">
											<label for="e_mail">Mobile Number</label> 
												<input type="text" id="mobile_no" name="mobile_no" placeholder="Enter your mobile_no"	class="callValid form-control" autocomplete="off">
										</div>
										
										<div style="margin-top:1px;" align="left">
											<label for="e_mail">CITY</label>
												<input type="text" id="city" name="city" placeholder="Enter your city" class="callValid form-control" autocomplete="off">
										</div>
										
										<div style="margin-top:1px;" align="left">
											<label for="e_org">PINCODE</label> 
											<input type="text" 	id="pincode" name="pincode"	placeholder="Enter your pincode" class="callValid form-control" autocomplete="off">
										</div>


										<div style="margin-top:1px;" align="left">
											<label for="e_region">STATE</label> 
												<input type="text" id="state" name="state"	placeholder="Enter your state" class="callValid form-control" autocomplete="off">
										</div>
										
										
										<div style="margin-top:1px;" align="left">
											<label for="e_super_ein">PASSWORD</label>
											 <input type="password" id="password" name="password" placeholder="Enter your password" class="callValid form-control" autocomplete="off">
										</div>

									</div>
							
							           <div style="margin-top: 10px;" align="center">
											&nbsp; 
										</div>
										
										<!-- <div style="margin-top: 10px;" align="left">
											&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp; 
										</div> -->

									<div style="margin-top:1px;" align="center">  
										<input type="submit" value="submit " class="callValid btn btn-primary" >
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

	<%-- <%@ include file="footer.jsp"%> --%>

</body>

</html>
