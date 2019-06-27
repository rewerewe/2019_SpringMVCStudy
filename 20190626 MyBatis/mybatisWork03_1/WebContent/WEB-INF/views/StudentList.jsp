<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="com.test.mybatis.StudentDTO" %>
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

<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript" src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<script type="text/javascript">

	function addStudent() {
	
		location.href="studentinsertform.action";
	}
</script>
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
			<button type="button" class="btn btn-default btn-xl" onclick="addStudent()">학생정보 입력</button>
			<br/><br/>
				<table class="table">
					<colgroup>
						<col width="20%;" />
						<col width="30%;" />
						<col width="30%;" />
						<col width="10%;" />
						<col width="10%;" />
					</colgroup>
					<thead>
						<tr>
							<th>학생ID</th>
							<th>이름</th>
							<th>전화번호</th>
						</tr>
					</thead>
					<tbody>
					<%-- 1. Scriptlet --%>
					<%-- 					
					<%
						ArrayList<StudentDTO> list = (ArrayList<StudentDTO>) request.getAttribute("list");
						for(int i=0; i<list.size(); i++) {
							StudentDTO student = (StudentDTO) list.get(i);
					%>
						<tr>
							<td><%= student.getSid() %></td>
							<td><%= student.getName() %></td>
							<td><%= student.getTel() %></td>
						</tr>

					<% 
						} 
					%> 
					--%>
					<%-- 2. JSTL --%>
<c:forEach var="student" items="${list}">
						<tr>
							<td>${student.sid}</td>
							<td>${student.name}</td>
							<td>${student.tel}</td>
							<td>
								<button type="button" class="btn btn-default btn-xs">삭제</button>
 								<button type="button" class="btn btn-default btn-xs">수정</button>
							</td>
						</tr>
</c:forEach>
 					</tbody>
				</table>
			</div>
		</div>
	</div>
</div>


</body>
</html>