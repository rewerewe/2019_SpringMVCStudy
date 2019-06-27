<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
 	request.setCharacterEncoding("UTF-8");
 	String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>StudentList.jsp</title>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<style type="text/css">

	.container
	{
		
	}
</style>

<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript" src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

</head>
<body>

<div class="container">
	<div class="panel-group">
		<div class="panel panel-dafault">
			<div class="panel-heading" id="title">
				<h1>학생정보 입력</h1>
				<hr>
			</div>
			
			<div class="panel-body">
				<form action="studentlist.action" role="form">
					<div class="form-group">
						<label for="sid">
							학생ID:
						</label>
						<input type="text" class="form-control" id="sid" name="sid">
					</div>
					
					<div class="form-group">
						<label for="name">
							이름 :
						</label> 
						<input type="text" class="form-control" id="name" name="name">
					</div>
					
					<div class="form-group">
						<label for="sub1">
							과목1 : 
						</label>
						<input type="text" class="form-control" id="sub1" name="sub1">
					</div>
					
					<div class="form-group">
						<label for="sub2">
							과목2 : 
						</label>
						<input type="text" class="form-control" id="sub2" name="sub2">
					</div>
					
					<div class="form-group">
						<label for="sub3">
							과목3 : 
						</label>
						<input type="text" class="form-control" id="sub3" name="sub3">
					</div>
				</form>
			</div>
			
			<button type="submit" class="btn btn-default btn-sm">SUBMIT</button>
		</div>
	</div>
</div>

</body>
</html>




