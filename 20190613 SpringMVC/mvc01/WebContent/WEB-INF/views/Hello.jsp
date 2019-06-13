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
<title>Hello.jsp</title>
</head>
<body>

<!-- 클라이언트와 마주해 결과를 보여주는 최종 페이지는 Hello.jsp 이다.  -->
<div>
	<h1>${message}</h1>
</div>

</body>
</html>