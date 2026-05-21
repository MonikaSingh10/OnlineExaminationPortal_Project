<%    
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1
	response.setHeader("Pragma", "no-cache"); // HTTP 1.0
	response.setDateHeader("Expires", 0); // Proxies

	 if (session == null || session.getAttribute("user") == null) {
	        response.sendRedirect("Login.jsp");
	        return;
	    }    
%>

<%@page import="com.idbi.Beans.UserBean"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>



<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">

<script type="text/javascript">

history.pushState(null, null, location.href);
window.onpopstate = function () {
    history.go(1);
};

    // Disable back button
    window.history.forward();
    function noBack() { window.history.forward(); }
</script>

<head>

<meta charset="utf-8" />
<meta name="viewport"	content="width=device-width, initial-scale=1, maximum-scale=1" />
<meta name="description" content="" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,9,10,chrome=1">
<meta name="author" content="" />
<!--[if IE]>
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <![endif]-->
<title>GM Survey</title>
<!-- BOOTSTRAP CORE STYLE  -->
<link href="assets1/css/bootstrap.css" rel="stylesheet" />
<!-- FONT AWESOME STYLE  -->
<link href="assets1/css/font-awesome.css" rel="stylesheet" />
<!-- DATATABLE STYLE  -->
<link href="assets1/js/dataTables/dataTables.bootstrap.css"	rel="stylesheet" />
<!-- CUSTOM STYLE  -->
<link href="assets1/css/style.css" rel="stylesheet" />
<!-- GOOGLE FONT -->
<link href='http://fonts.googleapis.com/css?family=Open+Sans'	rel='stylesheet' type='text/css' />
	 <!-- CORE JQUERY  -->
 <script src="assets1/js/jquery-1.10.2.js"></script> 
<jsp:useBean id="empDetails" scope="session" class="com.idbi.Beans.UserBean" />
</head>

<style>

.body-container{
	background-color: #fff;
	border-radius: 10px;
	box-shadow: 0 0 10px 5px rgba(0, 0, 0, 0.1);
	width: 1000px;
	margin: 20px auto;
	height: 300px;
}


.my-container{
background-color: #fff;
	border-radius: 15px;
	box-shadow: 0 0 10px 5px rgba(0, 0, 0, 0.1);
	width: 500px;
	margin: 20px auto;
	height: 100px;
	
}



</style>       


<body onload="noBack();" onpageshow="if (event.persisted) noBack();" onunload="">

	<%
	UserBean empDetail = (UserBean) session.getAttribute("empDetails");
	 /* out.println(empDetail.getName()); */ 
	if(empDetail == null || empDetail.equals(" ") )
	{
		RequestDispatcher rd1 = request.getRequestDispatcher("/Login.jsp");
		rd1.forward(request, response);	
	}
	else{
		
	%>


	<div class="navbar navbar-inverse set-radius-zero">
		<div class="container">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target=".navbar-collapse">
					<span class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
			<a class="navbar-brand"> <img src="images/exam.png"	 height=70px width=250px alt="img"></a>
	</div>

			<div class="right-div">

				<!-- <a href="Login.jsp" class="btn btn-danger pull-right">LOG OUT</a> -->
				<a href="${pageContext.request.contextPath}/logout" class="btn btn-danger pull-right">LOG OUT</a> 
                <a href="#" class="btn btn-primary pull-right"><%=empDetail.getName()%></a>
                
			
			</div>
	</div>
		</div>
	

	<!-- LOGO HEADER END-->
	<%} %>
	<br><br>
	
							
	<div class="my-container" align="center">
				<label for="e_lang" > LOGIN AS ADMIN</label>
	<form action="adminHome.jsp">
	
		<input type="submit"  value="ADMIN LOGIN" class="callValid btn btn-primary"  onclick="return validate();" >
	
	</form>	
	
	
	</div>
	
	<div class="my-container" align="center">
	<label for="e_lang">LOGIN AS USER</label>
	<form action="Home.jsp">
	
		<input type="submit"  value="USER LOGIN" class="callValid btn btn-primary"  onclick="return validate();" >
	
	</form>	
	</div>
	
	

	
	<!-- MENU SECTION END-->
	
	
	
	
	
	
	