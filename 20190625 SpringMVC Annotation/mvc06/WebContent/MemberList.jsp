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
<title>MemberList.jsp</title>
</head>
<body>

<div>
	<h1>회원명단</h1>
	<h2><a href="memberinsertform.action">회원등록</a></h2>
</div>

<div>
	<table>
		<tr>
			<th>아이디</th>
			<th>이름</th>
			<th>전화</th>
			<th>이메일</th>
		</tr>
		<tr>
			<th>admin</th>
			<th>한승원</th>
			<th>전화</th>
			<th>이메일</th>
		</tr>
	</table>
</div>

</body>
</html>