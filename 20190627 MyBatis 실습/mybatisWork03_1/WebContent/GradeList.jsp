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
			<div class="panel-heading">
				<h1>학생 성적정보 출력</h1>
				<hr> 
			</div>
			
			<div class="panel-body">
				<table class="table">
					<thead>
						<tr>
							<th>학생ID</th>
							<th>이름</th>
							<th>과목1</th>
							<th>과목2</th>
							<th>과목3</th>
							<th>총점</th>
							<th>평균</th>
							<th>등급</th>
						</tr>
					</thead>
						<tr>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
						</tr>
				</table>
			</div>
		
		</div>
	</div>
</div>

</body>
</html>




