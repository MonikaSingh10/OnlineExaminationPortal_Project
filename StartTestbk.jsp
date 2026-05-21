<%    
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1
	response.setHeader("Pragma", "no-cache"); // HTTP 1.0
	response.setDateHeader("Expires", 0); // Proxies

	 if (session == null || session.getAttribute("user") == null) {
	        response.sendRedirect("Login.jsp");
	        return;
	    }    
%>

<%@page import="com.idbi.ServiceImp.TestServiceImp"%>
<%@page import="com.idbi.Beans.QuestionBean"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
 <%@ include file="Header.jsp"%> 
<script src="https://code.jquery.com/jquery-2.2.4.min.js"></script>

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


<style>
* {
	box-sizing: border-box;
}

.body {
	display: flex;
	align-items: center;
	margin: 0;
	min-height: 100;
}

.quiz-container {
	background-color: #fff;
	border-radius: 10px;
	box-shadow: 0 0 10px 5px rgba(0, 0, 0, 0.1);
	width: 1000px;
	margin-top: 100px;
	margin-left: 200px;
	padding: 20px;
	
	
	top:0 ;
	bottom: 0;
	left: 0;
	right: 0;
  	
	margin: auto;
}

.timer-container {
	background-color: #fff;
	border-radius: 10px;
	box-shadow: 0 0 10px 5px rgba(0, 0, 0, 0.1);
	width: 300px;
	
	top:0 ;
	bottom: 0;
	left: 0;
	right: 0;
  	
	margin: auto;
}
.ansborder{
	border: 1px solid #dedede;
    border-radius: 11px;
    padding: 10px;
    margin-bottom: 10px;
}

.ul, li {
	margin-left: 100px;
	margin-top: 20px;
}
.next40{
	display: none;
}
</style>

<script>

$(document).ready(function(){
	$("#Div1").show();
	
	
	$("#SubmitProcess").on('click', function(){
		$("#FormSubmit").submit();
	});
});

function Back(id){
	debugger;
	$("#Div"+id).hide();
   var data = Number(id-1);
  $("#Div"+data).show();	  
}
function Next(id){
	debugger;
$("#Div"+id).hide();
var data = Number(id+1);
$("#Div"+data).show();
}

var countdown = 15 * 60 * 1000;
var timerId = setInterval(function(){
  countdown -= 1000;
  var min = Math.floor(countdown / (60 * 1000));
  var sec = Math.floor((countdown - (min * 60 * 1000)) / 1000);
  
  if (countdown <= 0) {
     alert("15 Time UP!!..");
 	$("#FormSubmit").submit();
     clearInterval(timerId);
  } else {
     $("#countTime").html(min + " : " + sec);
  }

}, 1000);
</script>

<body onload="noBack();" onpageshow="if (event.persisted) noBack();" onunload="">
			<%
			    if(session.getAttribute("user") == null){
			        response.sendRedirect("Login.jsp");
			    }
			%>
	<div class="timer-container" style="text-align: center">

		<h1 id="countTime" align="center"></h1>
	</div>

	<%
		TestServiceImp service = new TestServiceImp();
		List<QuestionBean> list = request.getAttribute("Questionlist") != null ? (List) request.getAttribute("Questionlist"): new ArrayList<QuestionBean>();
		if (!list.isEmpty()) {
			int finalCOunt = list.size();
	%>

	<%
		int count = 1;
			for (QuestionBean obj : list) {
	%>

	<form action="ExamServlet" method="post" id="FormSubmit">
		<div class="quiz-container" id="Div<%=count%>" style="display: none">
			<h2><%=count%>.	<%=obj.getQuestion()%> ::<%=obj.getQuestion_id()%>:::<%=obj.getCorrectOption()%> </h2>
				<hr>
			<div style="font-size: 20px">
				<div class="">
				
				<div class="col-md-6 ansborder">
				    <input type="hidden" name="stream" value="<%=obj.getStream()%>">
					<input type="hidden" name="question_id<%=obj.getQuestion_id()%>" value="<%=obj.getQuestion_id()%>">					
					A.&nbsp;<input type="radio" id="A" value="A" name="answer<%=obj.getQuestion_id()%>"> <label for="A"><%=obj.getOptionA()%></label>
					
					
				</div>
				
				<div class="col-md-6 ansborder">
					B.&nbsp;<input type="radio" id="B" value="B" name="answer<%=obj.getQuestion_id()%>"> <label for="B"><%=obj.getOptionB()%></label>
				</div>
			
			
			<%	if (obj.getOptionC()!=null ) {     %>
					
				<div class="col-md-6 ansborder">
					C. &nbsp;<input type="radio" id="C" value="C" name="answer<%=obj.getQuestion_id()%>"> &nbsp;<label for="C"><%=obj.getOptionC()%></label>
				</div>
				
			<%	}  %>
			
			
			<%	if (obj.getOptionD()!=null ) {    %>			
				
				<div class="col-md-6 ansborder">
					D. &nbsp;<input type="radio" id="D" value="D" name="answer<%=obj.getQuestion_id()%>"> &nbsp;<label for="D"><%=obj.getOptionD()%></label>
				</div>
				
			<%	}  %>			
			
				
			</div>
		</div>

			<div style="text-align: center;margin: -7px;">
			<%
				if (count > 0) {
							if (count > 1) {
			%>
			
				<input type="button" value="<< Back" class="callValid btn btn-sm btn-info" align="left" onclick="Back(<%=count%>)">
			<%
					}
					if (count != finalCOunt ) {
								
			%>
				<input type="button" value="Next >>" align="middle" class="callValid btn btn-sm btn-info next<%=count%>" onclick="Next(<%=count%>)">
			
			<%
					}
				}
			%>
			</div>
		</div>
		<%
			count++;
				}
		%>
		<div style="margin-top: 10px;" align="center">
			<input type="hidden" name="finalCount" value="<%=finalCOunt%>">
			<input type="button" value="Final Submit" id="SubmitProcess" class="callValid btn btn-success">

		</div>
	</form>

	<%
		} else {
	%>
	<h4 style="color: red" class="center">
		<%="No Questions For Test"%>
	</h4>
	<%
		}
	%>


</body>
</html>