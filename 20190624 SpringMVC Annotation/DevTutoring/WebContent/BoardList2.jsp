<%@ page contentType="text/html; charset=UTF-8"%>
<%
 	request.setCharacterEncoding("UTF-8");
 	String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>HTML Layouts</title>
	<style>
		#header {
			/* background-color:lightgrey; */
			height:100px;
			border: 1px solid black;
		}
		#nav-left {
			/* background-color:#339999; */
			color:white;
			width: 15%;
			float:left;
			border: 1px solid black;
		}
		
		#nav-right {
			/* background-color:#339999; */
			color:white;
			width: 15%;
			float:right;
			border: 1px solid black;
		}
		#section {
			width: 70%;
			text-align:left;
			float:left;
		}
		#footer {
			/* background-color:#FFCC00; */
			height:100px;
			clear:both;
			border: 1px solid black;
		}
		#header, #nav, #section, #footer { text-align:center; }
		#header, #footer { line-height:100px; }
		#nav, #section { line-height:240px; }
	</style>
</head>

<body>

<h1>div 요소를 이용한 레이아웃</h1>
<div id="header">
	<h2>HEADER</h2>
</div>
<div id="nav-left">
	<h2>NAV1</h2>
</div>


<div id="list">

<table class="table table-hover">
	<colgroup>
		<col width="5%">
		<col width="10%">
		<col width="40%">
		<col width="10%"> 
		<col width="10%">
		<col width="10%">
		<col width="10%">
	</colgroup>
	
	<tr>
		<th>번호</th>
		<th>말머리</th>
		<th id="subject">제목</th>
		<th>작성자</th>
		<th>추천수</th>
		<th>조회수</th>		
		<th>작성일</th>
	</tr>
	
	<tbody>
	<tr>
		<td>3</td>
		<td>질문</td>
		<td id="subject">오늘의 튜터링에서...</td>
		<td>최보라</td>
		<td>0</td>
		<td>1</td>
		<td>06-24</td>
	</tr>

	<tr>
		<td>2</td>
		<td>팁</td>
		<td id="subject">파이썬으로 크롤링</td>
		<td>전훈의</td>
		<td>10</td>
		<td>29</td>
		<td>06-20</td>
	</tr>

	<tr>
		<td>1</td>
		<td>질문</td>
		<td id="subject">질문게시판입니다.</td>
		<td>정임혜</td>
		<td>3</td>
		<td>5</td>
		<td>06-18</td>
	</tr>

	</tbody>
</table>
	
		<button type="button" class="btn btn-primary" > 글쓰기 </button>
	
	
	
</div>



<div id="nav-right">
	<h2>NAV2	</h2>
</div>

<div id="footer">
	<h2>FOOTER</h2>
</div>

</body>
</html>