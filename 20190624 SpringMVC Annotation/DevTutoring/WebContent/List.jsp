<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>QABoardList.jsp</title>

<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<style type="text/css">

/* 게시판 */
/*
#qnalist {
	width: 1024px;
	margin: 0 auto 0 auto;
	padding: 40px 0 70px;
	text-align: left;
	border: 1px;
	border-collapse: collapse;
	position: relative;
	
}

.hr 
{
	color: gray;
}

.title
{
	padding: 21px 64px 23px;
}

tr 
{
	width: 20%;
	align-content: center;
}


#qnalist_header
{
    text-align :left;
}

#qnalist_board, #qnalist_pageForm
{
    text-align :center;
}

#qnalist_footer
{

}
*/


</style>



</head>
<body>
<div id="qnalist" class="container container-fluid row">
	
	<br>
	<div id="qnalist_header" class="col-xs-12 col-sm-6 col-md-8">		
		<h1>질문 게시판</h1>
	</div>
	
	<br>
	<div id="qnalist_board" class="col-xs-12 col-sm-6 col-md-8 title ">

		<table class="title">
			<colgroup>
				<col width="10%">
				<col width="20%">
				<col width="50%">
				<col width="10%">
				<col width="10%">
			</colgroup>
			<tr>
				<th>글번호</th>
				<th>분류</th>
				<th>제목</th>
				<th>작성자</th>
				<th>작성일</th>
			</tr>
			
			<tr>
				<td>1</td>
				<td>질문</td>
				<td>질문게시판입니다.</td>
				<td>정임혜</td>
				<td>06-18</td>
			</tr>

			<tr>
				<td>2</td>
				<td>질문</td>
				<td>질문게시판입니다.</td>
				<td>김선아</td>
				<td>06-18</td>
			</tr>

			<tr>
				<td>3</td>
				<td>질문</td>
				<td>질문게시판3</td>
				<td>전훈의</td>
				<td>06-18</td>
			</tr>
		</table>
	</div>
	
	<br>
    <div id="qnalist_pageForm">
        페이지 번호
    </div>

	<br>
	<div id="qnalist_footer" class="col-xs-12 col-sm-6 col-md-8">
	
	</div>
</div>
</body>
</html>