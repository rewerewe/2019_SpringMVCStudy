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
<title>Send.jsp</title>
</head>
<body>

<!-- 클라이언트와 마주해 결과를 보여주는 최종 페이지는 send.jsp 이다.  -->
<div>
	<h1>Spring MVC 데이터 송수신 실습</h1>
	<hr>
</div>

<div>
	<form action="receive.do" method="post">
		이름 <input type="text" name="userName">
		<button type="submit">Submit</button>
	</form>
</div>
</body>
</html>