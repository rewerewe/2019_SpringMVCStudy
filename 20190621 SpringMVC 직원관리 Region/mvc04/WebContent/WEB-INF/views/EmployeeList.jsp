<%@ page contentType="text/html; charset=UTF-8"%>
<!-- JSTL 에는 core도 있고 format 도 있다.  -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
 	request.setCharacterEncoding("UTF-8");
 	String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EmployeeList.jsp</title>
<link rel="stylesheet" href="<%=cp %>/css/main.css">

<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script type="text/javascript">
	
	//$(document).ready();
	$(function()
	{
		$(".updateBtn").click(function()
		{
			// 테스트
			// alert("수정 버튼 클릭");
			
			$(location).attr("href", "employeeupdateform.action?employeeId=" + $(this).val() );
			
		
		});
		
		$(".deleteBtn").click(function()
		{
			// 테스트
			// alert("삭제 버튼 클릭");
			
			if (confirm("현재 선택한 데이터를 정말 삭제하시겠습니까?"))
			{
				$(location).attr("href","employeedelete.action?employeeId=" + $(this).val() );
				
			}
		});
		
	});
	
</script>
</head>
<body>

<!-----------------------------------------------------------------------
	#14. EmployeeList.jsp
	- 직원 데이터 출력 페이지
	- 관리자가 접근하는 직원 데이터 출력 페이지
	  (일반직원이 접근하는 직원 데이터 출력 페이지 : EmpList.jsp로 구성) 
 ------------------------------------------------------------------------>
 
<div>
	<!-- 메뉴 영역 -->
	<div>
		<c:import url="EmployeeMenu.jsp"></c:import>
	</div>
	
	<!-- 콘텐츠 영역 -->
	<div id="content">
		
		<h1>[ 직원 관리 ]</h1>
		<hr>
		
		<div>
			<form action="">
				<input type="button" value="직원 추가" class="btn"
				onclick="location.href='employeeinsertform.action'">
			</form>
		</div>
		
		<br><br>
		
		<!----------------------------------------------------------------
		EMPLOYEEID   NAME   SSN   BIRTHDAY   LUNAR   LUNARNAME   TELEPHONE      
		DEPARTMENTID   DEPARTMENTNAME   POSITIONID   POSITIONNAME   
		REGIONID   REGIONNAME   BASICPAY   EXTRAPAY   PAY   GRADE
		---------------------------------------------------------------->
		<table id="customers" class="table">
			<tr>
				<th>번호</th>
				<th>이름</th>
				<th>주민번호</th>
				<th>생년월일</th>
				<th>양/음력</th>
				<th>전화번호</th>
				<th>지역</th>
				<th>부서</th>
				<th>직위</th>
				<th>기본급</th>
				<th>수당</th>
				<th>급여</th>
				<th>등급</th>
				<th>수정</th>
				<th>삭제</th>
			</tr>
			
			<!-- JSTL 활용하여 EmployeeListController 에서 보낸 자료구조 받기 -->
			<c:forEach var="list" items="${employeeList }">
			<tr>
				<td>${list.employeeId}</td>
				<td>${list.name }</td>
				<td>${list.ssn1 }-*******</td>
				<td>${list.birthday }</td>
				<td>${list.lunarName }</td>
				<td>${list.telephone }</td>
				<td>${list.regionName }</td>
				<td>${list.departmentName }</td>
				<td>${list.positionName }</td>
				
				<!-- JSTL Format 처리  -->
				<%-- <td>${list.basicPay }</td> --%>
				<td>
					<fmt:formatNumber value="${list.basicPay }" groupingUsed="true" ></fmt:formatNumber>
				</td>
				
				<%-- <td>${list.extraPay }</td> --%>
				<td>
					<fmt:formatNumber value="${list.extraPay }" groupingUsed="true"></fmt:formatNumber>
				</td>
				
				<%-- <td>${list.pay }</td> --%>
				<td>
					<fmt:formatNumber value="${list.pay }" groupingUsed="true"></fmt:formatNumber>
				</td>
				
				<td>${list.grade==0 ? "관리자" : "일반사원" }</td>
				<%--
				<c:set var="grade" value="${list.grade}"/>
				<c:choose>
					<c:when test="${grade eq '0'}" >
						관리자 
					</c:when>
					
					<c:when test="${grade eq '1'}" >
						일반사원
					</c:when>
				</c:choose> 
				--%>
				<td><button type="button" class="btn updateBtn" value="${list.employeeId }">수정</button></td>
				<td><button type="button" class="btn deleteBtn" value="${list.employeeId }">삭제</button></td>
			
				
			</tr>
			</c:forEach>
	
			<!--  
			<tr>
				<td>1</td>
				<td>유진석</td>
				<td>631212</td>
				<td>1963-12-12</td>
				<td>양력</td>
				<td>010-4543-2342</td>
				<td>서울</td>
				<td>개발부</td>
				<td>사원</td>
				<td>1,500,000</td>
				<td>1,000,000</td>
				<td>2,500,000</td>
				<td>관리자</td>
				<td><button type="button" class="btn">수정</button></td>
				<td><button type="button" class="btn">삭제</button></td>
			</tr>
			-->
			
		</table>
	</div>
	
	<!-- 회사 소개 및 어플리케이션 소개 영역 -->
	<div id="footer">
	
	</div>
</div>
</body>
</html>