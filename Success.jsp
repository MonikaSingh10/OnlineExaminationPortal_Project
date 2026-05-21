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
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
  <link rel="stylesheet" type="text/css" href="style_sheet1.css" />
        <script type="text/javascript" src="JScript1.js">  </script>

<style>
.body-container{
	background-color: #fff;
	border-radius: 10px;
	box-shadow: 0 0 10px 5px rgba(0, 0, 0, 0.1);
	width: 1000px;
	margin: 20px auto;
	height: 300px;
}

.Head-container {
	background-color: #fff;
	border-radius: 10px;
	box-shadow: 0 0 10px 5px rgba(0, 0, 0, 0.1);
	width: 450px;
	margin: 20px auto;
	height: 60px;
}

</style>

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
<%-- <%@ include file="Header.jsp"%> --%>

<body onload="noBack();" onpageshow="if (event.persisted) noBack();" onunload="">
	<%
	    if(session.getAttribute("user") == null){
	        response.sendRedirect("Login.jsp");
	    }else{
	    	session.invalidate();
	    }
	%>
	<div class="Head-container">	
	<h1 align="center" style="text-align: center;"> ONLINE EXAM</h1>
	</div>


	<div class="body-container" >&nbsp;
		<h2 align="center"> Thank you for your online examination.</h2>
		<h2 align="center"> Your online examination has been completed and your answers are successfully submitted. &nbsp; &nbsp; &nbsp;</h2>				
	</div>

</body>
</html>