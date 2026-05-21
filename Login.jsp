 <%
    response.setHeader("Cache-Control","no-cache, no-store, must-revalidate"); // HTTP 1.1
    response.setHeader("Pragma","no-cache"); // HTTP 1.0
    response.setDateHeader("Expires", 0); // Proxies
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>

<head>
<script src="js/jquery.min.js" /></script>

<title>Login Page</title>
</head>

<style>

.btn {
  display: inline-block;
  *display: inline;
  *zoom: 1;
  padding: 4px 10px 4px;
  margin-bottom: 0;
  font-size: 13px;
  line-height: 18px;
  color: #333333;
  text-align: center;
  text-shadow: 0 1px 1px rgba(255, 255, 255, 0.75);
  vertical-align: middle;
  background-color: #f5f5f5;
  background-image: -moz-linear-gradient(top, #ffffff, #e6e6e6);
  background-image: -ms-linear-gradient(top, #ffffff, #e6e6e6);
  background-image: -webkit-gradient(
    linear,
    0 0,
    0 100%,
    from(#ffffff),
    to(#e6e6e6)
  );
  background-image: -webkit-linear-gradient(top, #ffffff, #e6e6e6);
  background-image: -o-linear-gradient(top, #ffffff, #e6e6e6);
  background-image: linear-gradient(top, #ffffff, #e6e6e6);
  background-repeat: repeat-x;
  filter: progid:dximagetransform.microsoft.gradient(
      startColorstr=#ffffff,
      endColorstr=#e6e6e6,
      GradientType=0
    );
  border-color: #e6e6e6 #e6e6e6 #e6e6e6;
  border-color: rgba(0, 0, 0, 0.1) rgba(0, 0, 0, 0.1) rgba(0, 0, 0, 0.25);
  border: 1px solid #e6e6e6;
  -webkit-border-radius: 4px;
  -moz-border-radius: 4px;
  border-radius: 4px;
  -webkit-box-shadow: inset 0 1px 0 rgba(255, 255, 255, 0.2),
    0 1px 2px rgba(0, 0, 0, 0.05);
  -moz-box-shadow: inset 0 1px 0 rgba(255, 255, 255, 0.2),
    0 1px 2px rgba(0, 0, 0, 0.05);
  box-shadow: inset 0 1px 0 rgba(255, 255, 255, 0.2),
    0 1px 2px rgba(0, 0, 0, 0.05);
  cursor: pointer;
  *margin-left: 0.3em;
}

.btn:hover {
  color: #333333;
  text-decoration: none;
  background-color: #e6e6e6;
  background-position: 0 -15px;
  -webkit-transition: background-position 0.1s linear;
  -moz-transition: background-position 0.1s linear;
  -ms-transition: background-position 0.1s linear;
  -o-transition: background-position 0.1s linear;
  transition: background-position 0.1s linear;
}
.btn-primary,
.btn-primary:hover {
  text-shadow: 0 -1px 0 rgba(0, 0, 0, 0.25);
  color: #ffffff;
}
.btn-primary.active {
  color: rgba(255, 255, 255, 0.75);
}
.btn-primary {
  background-color: #4a77d4;
  background-image: -moz-linear-gradient(top, #6eb6de, #4a77d4);
  background-image: -ms-linear-gradient(top, #6eb6de, #4a77d4);
  background-image: -webkit-gradient(
    linear,
    0 0,
    0 100%,
    from(#6eb6de),
    to(#4a77d4)
  );
  background-image: -webkit-linear-gradient(top, #6eb6de, #4a77d4);
  background-image: -o-linear-gradient(top, #6eb6de, #4a77d4);
  background-image: linear-gradient(top, #6eb6de, #4a77d4);
  background-repeat: repeat-x;
  filter: progid:dximagetransform.microsoft.gradient(
      startColorstr=#6eb6de,
      endColorstr=#4a77d4,
      GradientType=0
    );
  border: 1px solid #3762bc;
  text-shadow: 1px 1px 1px rgba(0, 0, 0, 0.4);
  box-shadow: inset 0 1px 0 rgba(255, 255, 255, 0.2),
    0 1px 2px rgba(0, 0, 0, 0.5);
}
.btn-primary:hover,
.btn-primary:active,
.btn-primary.active,
.btn-primary.disabled,
.btn-primary[disabled] {
  filter: none;
  background-color: #4a77d4;
}
.btn-block {
  width: 100%;
  display: block;
}

* {
  -webkit-box-sizing: border-box;
  -moz-box-sizing: border-box;
  -ms-box-sizing: border-box;
  -o-box-sizing: border-box;
  box-sizing: border-box;
}

html {
  width: 100%;
  height: 100%;
  overflow: hidden;
}

body {
  width: 80%;
  height: 80%;
  font-family: "Open Sans", sans-serif;
  background: url(images/bg_2.jpg);
  background-size: cover;
 }
.login {
  position: absolute;
  top: 50%;
  left: 50%;
  margin: -100px 0 0 -150px;
  width: 300px;
  height: 300px;
}
.login-body {
  position: absolute;
  top: 60%;
  left: 50%;
  margin: -100px 0 0 -150px;
  width: 300px;
  height: 300px;
}
input {
  width: 100%;
  margin-bottom: 10px;
  border: none;
  outline: none;
  padding: 10px;
  font-size: 13px;
  color: #333;
  text-shadow: 1px 1px 1px rgba(0, 0, 0, 0.3);
  border: 1px solid rgba(0, 0, 0, 0.3);
  border-radius: 4px;
  box-shadow: inset 0 -5px 45px rgba(100, 100, 100, 0.2),
    0 1px 1px rgba(255, 255, 255, 0.2);
  -webkit-transition: box-shadow 0.5s ease;
  -moz-transition: box-shadow 0.5s ease;
  -o-transition: box-shadow 0.5s ease;
  -ms-transition: box-shadow 0.5s ease;
  transition: box-shadow 0.5s ease;
}
input:focus {
  box-shadow: inset 0 -5px 45px rgba(100, 100, 100, 0.4),
    0 1px 1px rgba(255, 255, 255, 0.2);
}

</style>


<!-- validation script -->

<script src="js/jquery.min.js" /></script>
<script>
$(document).ready(function(){
	
	$("#buttonSubmit").click(function(){
	    debugger;
	    var valid = true;
	    $('.callValid').each(function(){
	       // alert("Value:::"+$(this).val());
	        if($.trim($(this).val()) == ''){
	            alert("Please enter/select all the mandatory fields");
	            $(this).focus();
	            valid = false;
	            return valid;
	        }
	    });
	    if(!valid){

	        return false;
	    }else{
	    	$("#myform").submit();
	    }
	});
	
	
});

/* Script for only number in field  */
function isNumber(evt) 
{
    evt = (evt) ? evt : window.event;
    var charCode = (evt.which) ? evt.which : evt.keyCode;
    if (charCode > 31 && (charCode < 48 || charCode > 57))
    {
        return false;
    }
    return true;
}

</script>


<body class="login-page">


			
<h4> <font style=' text-align:center;'>
<div  class="header-line" align="center">
<a href="Registration.jsp" target="_blank">Participates Registration Here</a>
</div>
</font>
</h4>

<div class="login">
  <img src="${pageContext.request.contextPath}/images/exam.png" height=70px width=250px alt="Online Examination"> 
<a class="navbar-brand"> </a>
</div>


<div class="login-body">	
	<br>
    <form class="login-form" id="login-form" action="LoginServlet"  align="middle" name="myForm" onsubmit="return(validate());" method="post">
    	
    	  
    	<input type="text"  id="ein" name="ein" placeholder="EIN" class="callValid" autocomplete="off" />
        <input type="password" id="upass" name="upass" maxlength="30" placeholder=" Password"  autocomplete="off" class="callValid" />
        <button type="submit" id="buttonSubmit" class="btn btn-primary btn-block btn-large">Login</button>
        <br>
       
    </form>
    
    <h6>NOTE : Kindly Use Goggle Chrome Browser For EXAMINATION</h6>
    
       <%
            String msg = (String) request.getAttribute("msg");
            String ein = request.getAttribute("ein")!=null ? (String) request.getAttribute("ein") : "";
            System.out.println(msg+",Session User on jsp "+session.getAttribute("msg"));
            System.out.println(",Session User on jsp ein:::"+ein);
            if (msg != null && !msg.equals("")) {
                out.println("<h6><font style='color:tomato;font-size: larger'><b><center>" + msg + "</center></b></font></h6>");
            }
                         
            if ((session.getAttribute("msg") != null) && (session.getAttribute("ein") != null) && !session.getAttribute("ein").equals("")) {
                /*   out.print("<h8><font style='color:tomato;font-size: larger'><b><center>" + session.getAttribute("msg") + "</center></b></font></h8>"); */
                  out.print("<h8><font style='color:tomato;font-size: larger'><b>" + session.getAttribute("ein")+"  "+ session.getAttribute("msg")+ "</b></font></h8>");
        %>
             <input type="hidden" name="ein" value="<%=ein%>">	
             <a href="${pageContext.request.contextPath}/logout?ein=${ein}">LOG OUT</a>
        <%
            }
        %>
     
</div>
<!-- <h1> <font style=' text-align:center;'>
<div  class="header-line" align="center">
<a href="Registration.jsp" target="_blank">Participation Registration Here 2 </a>
</div>
</font>
</h1> -->



</body>

</html>