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
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>    
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
	
	
 <%@ include file="Adminheader.jsp"%>
 <link rel="stylesheet" type="text/css" href="style_sheet1.css" />
 <script type="text/javascript" src="javascript/JScript1.js">  </script>   
 <script type="text/javascript" src="javascript/keyboard.js"></script>
<script type="text/javascript" src="css/datatable/jquery.dataTables.min.js"></script>
 <script type="text/javascript" src="css/datatable/dataTables.buttons.min.js"></script>
 <script type="text/javascript" src="css/datatable/buttons.flash.min.js"></script>
 <script type="text/javascript" src="css/datatable/jszip.min.js"></script>
 <script type="text/javascript" src="css/datatable/pdfmake.min.js"></script>
 <script type="text/javascript" src="css/datatable/vfs_fonts.js"></script>
 <script type="text/javascript" src="css/datatable/buttons.html5.min.js"></script>
 <script type="text/javascript" src="css/datatable/buttons.print.min.js"></script>
  
         
        <script>
          function chk()
          {
              if(document.frm1.ques.value == "")
              {
                  alert("Please enter solid and than save");
                  document.frm1.ques.focus();
                  return false;
              }
              if(document.frm1.optA.value == "")
              {
                  alert("Please enter Branch Name and than Save");
                  document.frm1.optA.focus();
                  return false;
              }
              if(document.frm1.optB.value == "")
              {
                  alert("Please enter Branch Name and than Save");
                  document.frm1.optB.focus();
                  return false;
              }
              if(document.frm1.optC.value == "")
              {
                  alert("Please enter Branch Name and than Save");
                  document.frm1.optC.focus();
                  return false;
              }
              if(document.frm1.optD.value == "")
              {
                  alert("Please select State and than Save");
                  document.frm1.optD.focus();
                  return false;
              }

          }      
         

          </script>
           <link rel="stylesheet" type="text/css" href="style_sheet1.css" />
           <script type="text/javascript" src="javascript/JScript1.js">  </script>
    </head>
    <body>    
            
             <div class="row pad-botm">
				<div class="col-md-12">
					&nbsp;&nbsp;
					 <%
					        String fail = (String) request.getAttribute("fail");
				            String msg = (String) request.getAttribute("mesg");
				            if (msg != null && !msg.equals("")) {
				                out.println("<h4><font style='color:green;font-size: larger'><b><center>" + msg + "</center></b></font></h4>");
				            }
				            if (fail != null && !fail.equals("")) {
				                out.println("<h4><font style='color:red;font-size: larger'><b><center>" + fail + "</center></b></font></h4>");
				            }
				        %>
				</div>				

			</div> 
         <!-- <div align="right"> <font size="3"><a href="home.jsp">मुख्य पृष्ठ </a> </font></div> -->
         <h4 class="header-line" align="center">Add Your Stream Question For Exam</h4>
                
        <form action ="AddQues" method="post" name="frm1">
                    
             <table align="center" border="1">
             
              <tr>
                     <td>Add Question</td>
                     <td><input type="text"  value="" name ="ques" class="callValid form-control"></td>
                 </tr>
                 
                 <tr>
                     <td>Option A</td>
                     <td><input type="text"  value="" name ="optA" class="callValid form-control"></td>
                 </tr>
                 <tr>
                     <td>Option B</td>
                     <td><input type="text"  value="" name ="optB" class="callValid form-control"></td>
                 </tr>
                 <tr>
                     <td>Option C</td>
                     <td><input type="text"  value="" name ="optC" class="callValid form-control"></td>
                </tr>
                <tr>
                    <td>Option D</td>
                     <td><input type="text"  value="" name ="optD" class="callValid form-control"></td>
                </tr>
                
                <tr>
                    <td>Answer</td>
                     <td><input type="text"  value="" name ="ans" class="callValid form-control"  maxlength="1"></td>
                </tr>
                
                <tr>
                    <td>Stream Type</td>
                     <td><input type="text"  value="" name ="stream" class="callValid form-control"></td>
                </tr>
                
             </table>
			<div style="margin-top: 10px;" align="center">			
				<input type="submit" value="Add Question" class="callValid btn btn-primary">
			</div>
            
        </form>
    </body>
</html>
