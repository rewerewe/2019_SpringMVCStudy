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
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<style type="text/css">

.panel-update
{
	display: none;	
}
	
</style>

<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script type="text/javascript" src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>


<script type="text/javascript">

	function remove(val)
	{
		location.href="memberdelete.action?mid=" + val;
	}
	
	$(document).ready(function()
	{		
		$(".modify").click(function(val)
		{
			$(".panel-update").css("display","inline");
			// 이부분 더 찾아볼 것.
			console(val);
			$(".updateform").val(val)
			
		});
	});

</script>
</head>
<body>

<div>
	<h1>회원정보</h1>
	<hr>
</div>


<div class="container">
	<div class="panel-group">
		<div class="panel panel-default">
			<div class="panel-heading" id="title">
				회원정보 입력
			</div>
			
			<div class="panel-body">
				<form role="form" action="memberinset.action" method="post">
					<input type="hidden" value="" id="mid" name="mid" class="updateform">
					
					<div class="form-group">
						<label for="name">
							NAME : 
						</label>
						<input type="text" class="form-control" id="name" name="name">
					</div>
					
					<div class="form-group">
						<label for="telephon">
							TELEPHONE :
						</label>
						<input type="tel" class="form-control" id="telephone" name="telephone">
					</div>
					
					<button type="submit" class="btn btn-default btn-sm">SUBMIT</button>
					<button type="button" class="btn btn-default btn-sm btn-Cancel">CANCEL</button>
				</form>
				
			</div>
		</div>
		
		<div class="panel panel-default">
			<div class="panel-heading">
				회원정보 출력
			</div>
			
			<div class="panel-body">
				<table class="table">
					<thead>
						<tr>
							<th>MID</th>
							<th>NAME</th>
							<th>TELEPHONE</th>
							<th>삭제 / 수정</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="member" items="${list }">
							<tr>
								<td>${member.mid }</td>
								<td>${member.name }</td>
								<td>${member.telephone }</td>
								<td>
									<button type="button" class="btn btn-default btn-xs btnDelete" value="${member.mid }" onclick="remove(this.value)">삭제</button>
									<button type="button" class="btn btn-default btn-xs btnUpdate modify" value="${member.mid }">수정</button>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<button type="button" class="btn btn-default btn-sm">Count     <span class="badge">${count}</span>
				</button>
			</div>
		</div>
		

		<div class="panel-update panel panel-default">
			<div class="panel-heading" id="title">
				회원수정 입력
			</div>
			
			<div class="panel-body">
				<form role="form" action="membermodify.action" method="post">
					<input type="hidden" value="" id="mid" name="mid">
					
					<div class="form-group">
						<label for="name">
							NAME : ${name} 
						</label>
						<input type="text" class="form-control" id="name" name="name">
					</div>
					
					<div class="form-group">
						<label for="telephone">
							TELEPHONE : ${telephone}
						</label>
						<input type="tel" class="form-control" id="telephone" name="telephone">
					</div>
					
					<button type="submit" class="btn btn-default btn-sm">SUBMIT</button>
					<button type="button" class="btn btn-default btn-sm btn-Cancel">CANCEL</button>
				</form>
				
			</div>
		</div>
	</div>
</div>


</body>
</html>


