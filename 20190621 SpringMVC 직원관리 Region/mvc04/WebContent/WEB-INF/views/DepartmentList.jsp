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
<title>DepartmentList.jsp</title>
</head>
<body>

<div>
	<!-- 메뉴 영역 -->
	<div>
		<c:import url="EmployeeMenu.jsp"></c:import>
	</div>
	
	<!-- 콘텐츠 영역 -->
	<div id="content">
		
		<h1>[ 부서 관리 ]</h1>
		<hr>
		
		<div>
			<form action="">
				<input type="button" value="부서 추가" class="btn"
				onclick="location.href=''">
			</form>
		</div>
		
		<br><br>
		<table>
			<tr>
				<th>번호</th>
				<th>부서명</th>
			</tr>
			
			<c:forEach var="department" items="departmentList">
			<tr>
				<td>
					${department.departmentId }
				</td>
				<td>
					${department.departmentName }
				</td>
				<td>
					<button ></button>
				</td>
			</tr>
			
			</c:forEach>
		</table>
</div>

</body>
</html>