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
<title>MemberInsertForm.jsp</title>
</head>
<script type="text/javascript">

	function clear()
	{
		document.getElementById("id").clear
		document.getElementById("pw").clear
		document.getElementById("name").clear
		document.getElementById("tel").clear
		document.getElementById("email").clear
		
	}
</script>
<body>

<div>
	<h1>Member 등록</h1>
	<hr>
</div>

<div>
<form action="memberinsert.action" method="post">
	<table>
		<tr>
			<th>아이디</th>
			<td><input type="text" id="id" name="id" placeholder="아이디를 입력하세요" ></td> 
		</tr>		
		<tr>
			<th>비밀번호</th>
			<td><input type="password" id="pw" name="pw" placeholder="비밀번호를 입력하세요" ></td> 
		</tr>		
		<tr>
			<th>이름</th>
			<td><input type="text" id="name" name="name" placeholder="이름을 입력하세요" ></td> 			
		</tr>
		<tr>
			<th>전화</th>
			<td><input type="text" id="tel" name="tel" placeholder="전화번호를 입력하세요" ></td> 		
		</tr>
		<tr>
			<th>이메일</th>
			<td><input type="text" id="email" name="email" placeholder="이메일을 입력하세요" ></td> 
		</tr>
		<tr>
			<td colspan="2">
			<button type="submit">입력</button>
			<button type="reset" onclick="clear()">취소</button>
			</td>
		</tr>	
	</table>	
</form>	
</div>

</body>
</html>