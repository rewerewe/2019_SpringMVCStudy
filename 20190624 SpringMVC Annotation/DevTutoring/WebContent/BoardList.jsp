<%@ page contentType="text/html; charset=UTF-8"%>
<%
 	request.setCharacterEncoding("UTF-8");
 	String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BoardList.jsp</title>
<link rel="stylesheet" href="css/bootstrap.css">
<style type="text/css">
	/* header - 상단 */
	div#header
	{
		width: 1000px;
		margin: auto;
	}
	
	/* 추천글 영역 - 상단 왼쪽 */
	div#maximum.table
	{
		/* 추천글 위치 */
		padding-top: 50px;
		padding-right: 50px;
		padding-bottom: 50px;
		padding-left: 50px;
		width: 500px;
		margin-top: 20px; 
		margin-bottom: 20px;
		border: 1px solid black;
	}
	
	#maximum.table
	{
		
		width: 100%;
		margin: auto;
		text-align: left;
	}
	
	.maximum-date
	{
		width:30%;
		text-align: left;
	}

	/* 추천글 영역 - 상단 오른쪽 */
	div#best.table
	{
		/* 추천글 위치 */
		padding-top: 50px;
		padding-right: 70px;
		padding-bottom: 50px;
		padding-left: 70px;
		width: 500px;
		text-align: left;
		margin-top: 20px; 
		margin-bottom: 20px;
		border: 1px solid black;
	}
	
	#best
	{
		
		width: 500px;
		margin: auto;
		text-align: left;
	}
	
	
	
	/* 본문글 영역 - 중앙 */
	div#list
	{
		/* 본문글 위치 */
		padding-top: 70px;
		padding-right: 70px;
		padding-left: 70px;
		padding-bottom: 70px;
		
	}
	
	.table
	{
		/* 게시글 리스트 사이즈 및 위치 */
		width: 1000px;
		margin: auto;
		text-align: center;
	}
	
	th 
	{	
		/* 게시글 중 요소들 정렬 */
		text-align: center;
		font-weight: bold;
	}
	
	#subject
	{
		/* 게시글 중 제목 정렬  */
		text-align: left;
	}
	
	/* footer - 하단 */
	div#header
	{
		width: 1000px;
		margin: auto;
	}
		
</style>
</head>
<body>

<div id="header">

</div>


<div id="maximum" class="table">
	<table>
		<tr>
			<td>오늘의 튜터링에서</td>
			<td class="maximum-date">06-24</td>
		</tr>
		<tr>
			<td>파이썬으로 크롤링</td>
			<td class="maximum-date">06-20</td>
		</tr>
		<tr>
			<td>질문게시판입니다</td>
			<td class="maximum-date">06-18</td>
		</tr>
	
	</table>
	
	<!--
	<div class="row">
		<span class="col1">오늘의 튜터링에서...</span>
		<span class="col2">06-24</span>
	</div>
	<div class="row">
		<span class="col1">파이썬으로 크롤링</span>
		<span class="col2">06-20</span>
	</div>
	<div class="row">
		<span class="col1">질문게시판입니다</span>
		<span class="col2">06-18</span>
	</div> 
	-->
</div>

<div id="best" class="table">
	<div class="row">
		<span class="col1">오늘의 튜터링에서...</span>
		<span class="col2">06-24</span>
	</div>
	<div class="row">
		<span class="col1">파이썬으로 크롤링</span>
		<span class="col2">06-20</span>
	</div>
	<div class="row">
		<span class="col1">질문게시판입니다</span>
		<span class="col2">06-18</span>
	</div>
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
		<td>6</td>
		<td>질문</td>
		<td id="subject">오늘의 튜터링에서...</td>
		<td>최보라</td>
		<td>0</td>
		<td>1</td>
		<td>06-24</td>
	</tr>

	<tr>
		<td>5</td>
		<td>팁</td>
		<td id="subject">파이썬으로 크롤링</td>
		<td>전훈의</td>
		<td>10</td>
		<td>29</td>
		<td>06-20</td>
	</tr>

	<tr>
		<td>4</td>
		<td>질문</td>
		<td id="subject">질문게시판입니다.</td>
		<td>정임혜</td>
		<td>3</td>
		<td>5</td>
		<td>06-18</td>
	</tr>
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

<div id="footer">
	
</div>


</body>
</html>