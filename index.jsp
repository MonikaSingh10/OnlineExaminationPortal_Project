<%
    response.setHeader("Cache-Control","no-cache, no-store, must-revalidate"); // HTTP 1.1
    response.setHeader("Pragma","no-cache"); // HTTP 1.0
    response.setDateHeader("Expires", 0); // Proxies
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">


<script type="text/javascript">
	// Disable back button
	window.history.forward();
	function noBack() {
		window.history.forward();
	}

	history.pushState(null, null, location.href);
	window.onpopstate = function() {
		history.go(1);
	};
</script>


</head>
<body onload="noBack();" onpageshow="if (event.persisted) noBack();" onunload="">
        <h1 align="center">Please Login through Oracle Self Service </h1>
    </body>
</html>
