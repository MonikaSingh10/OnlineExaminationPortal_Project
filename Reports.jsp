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
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
 
<%@ include file="Adminheader.jsp"%>
<link rel="stylesheet" type="text/css" href="style_sheet1.css" />
<script type="text/javascript" src="javascript/JScript1.js">  </script>    
<script type="text/javascript" src="javascript/keyboard.js"></script>
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
				<h4 class="header-line">ONLINE EXAM RESULT</h4>

			</div>

		</div>

		<div class="row">

			<div class="col-md-3 col-sm-3 col-xs-6">
				<div class="alert alert-info back-widget-set text-center">
					<i class="fa fa-briefcase fa-5x"></i>
					<h3>
						<span id="total"></span>
					</h3>
					
					<input type="hidden" id ="applied" name="applied" > 
					<!-- <a id="link" href="applied_quiz_report.jsp">EXAM PARTICIPATION REPORT 1</a> -->
					<a href="exam">EXAM PARTICIPATION REPORT</a>
				</div>
			</div>
			<div class="col-md-3 col-sm-3 col-xs-6">
				<div class="alert alert-success back-widget-set text-center">
					<i class="fa fa-briefcase fa-5x"></i>
					<h3>
						<span id="approved"></span>
					</h3>
					<input type="hidden" id ="marksheet" name="marksheet" >
					<!-- <a id="link"  href="Marksheet.jsp" > PARTICIPATS RESULT REPORT 2</a> --> 
					<a href="examResult">PARTICIPATS SCORE REPORT</a>
				</div>
			</div>
			
			<div class="col-md-3 col-sm-3 col-xs-6">
				<div class="alert alert-success back-widget-set text-center">
					<i class="fa fa-briefcase fa-5x"></i>
					<h3>
						<span id="approved"></span>
					</h3>
					<input type="hidden" id ="addquestion" name="addquestion" >
				    <a id="link"  href="addQues.jsp" >ADD EXAM QUESTION 2</a>  
					<!-- <a href="AddQues">ADD EXAM QUESTION</a> -->
				</div>
			</div>
			
		  <!--  <div class="col-md-3 col-sm-3 col-xs-6">
				<div class="alert alert-success back-widget-set text-center">
					<i class="fa fa-briefcase fa-5x"></i>
					<h3>
						<span id="approved"></span>
					</h3>
					<form action="ReportServlet">
					<input type="hidden" id ="quiz" name="quiz" >
				<a id="link"  href="hindi_quiz_report.jsp" >ADD EXAM QUESTION</a>	 
					</form> 
				</div>
			</div>  -->
			
			
			 <!-- <div class="col-md-3 col-sm-3 col-xs-6">
				<div class="alert alert-warning back-widget-set text-center">
					<i class="fa fa-briefcase fa-5x"></i>
					<h3>
						<span id="pending"></span>
					</h3>
					 <a id="link" href="Non_hindi_quiz_report.jsp"> NON-HINDI QUIZ REPORT</a>
				</div>
			</div>  -->
				</div>







	</div>
</div>



</html>