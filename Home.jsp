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
	height: 530px;
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
<%@ include file="Header.jsp"%>



<body onload="noBack();" onpageshow="if (event.persisted) noBack();" onunload="">
<%
	    if(null==session.getAttribute("user") ){
	        response.sendRedirect("Login.jsp");
	    }
	%>
	<div class="Head-container">	
	<h1 align="center" style="text-align: center;"><b>Examination  </b></h1>
	</div>


	<div class="body-container" >&nbsp;
	<h2 align="center"> <b>Welcome to online Examination </b>&nbsp; &nbsp;</h2>
				
			<h3 align="left" style="text-align: left;">&nbsp; Dear Madam/Sir</h3>&nbsp;&nbsp;&nbsp;
			<ul>
				<li><h4>	If disconnected, rejoin immediately. 
				If time expires, all answered questions will be submitted automatically
				 unanswered questions will be marked as blank..</h4></li>
				<li> <h4>Avoid refreshing the page or pressing the back button as it may terminate your session.
				. </h4></li>
				<li><h4> Taking screenshots or copying questions is strictly prohibited and monitored.
				There is no negative marking for wrong answers </h4></li>
				<li><h4> Kindly note that the exam is confidential. </h4></li>
				<li><h4>There is total 10 questions with 4 options and time is of 15 seconds to choose correct option.
				Do not use search engines, books, or AI tools to find answers.
				Do not skip any question. </h4> </li>
				<h4 align="center">  </h4> 
				<li><h4>Follow all the instructions carefully  </h4> </li>				
			</ul>					
				
				 <div style="margin-top: 10px;" align="center">
				       <form action = "selStream.jsp" method = "POST">
					      <input type="submit"  value="Next" class="callValid btn btn-primary" >
					      
					   </form>
				</div> 
		</div>
		
			

</body>
</html>