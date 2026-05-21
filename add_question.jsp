<%@page language="java" contentType="text/html ;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

 
    <%@ include file="Adminheader.jsp"%>
    <link rel="stylesheet" type="text/css" href="style_sheet1.css" />
    <script type="text/javascript" src="javascript/JScript1.js">  </script>
    
    <script type="text/javascript" src="javascript/keyboard.js"></script>


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
	height: 300px;
}



.ul, li {
	margin-left: 100px;
	margin-top: 20px;
}
</style>

 
</head>

<body>

	<form action="AddQuestion" method="post" id="FormSubmit">
		<div class="quiz-container">
			<h3>Question :
			<br>
			<input type="text" name="question" id="question" class="callValid form-control">
			</h3>
			
			
										<div class="panel-body">
								<div class="containerForm">


									<div class="row">
										<div class="col-md-12">

											<div class="table-responsive">
												<table
													class="table table-striped table-bordered table-hover"
													id="dataTables-example">
													<thead>
														<tr>
															
															<th>OPTION A&#2357;&#2352;&#2381;&#2335;&#2367;&#2325;&#2354;  / &#2357;&#2367;&#2349;&#2366;&#2327; / &#2325;&#2366;&#2352;&#2381;&#2351;&#2366;&#2354;&#2351;/ &#2358;&#2366;&#2326;&#2366; &#2325;&#2366; &#2344;&#2366;&#2350; </th>
															<th>OPTION B</th>
															<th>OPTION C</th>
															<th>OPTION D</th>
															
														</tr>
													</thead>
													<tbody>

													
														<tr>
														<tr>
															
															<td><input type="text"  value="" name ="optA" class="callValid form-control"></td>
															<td><input type="text"  value="" name ="optB" class="callValid form-control"></td>
															<td><input type="text"  value="" name ="optC" class="callValid form-control"></td>
															<td><input type="text"  value="" name ="optD" class="callValid form-control"></td>
															
															</tr>
														
													</tbody>

												</table>
											</div>

										</div>
									</div>
						
		<div style="margin-top: 10px;" align="center">
			
			<input type="submit" value="Add Question" class="callValid btn btn-primary">

		</div>
		</div>
		</div>
		</div>
	</form>

	

</body>
</html>