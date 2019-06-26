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
		$(".modify").click(function(a)
		{
			$(".panel-update").css("display","inline");
			
			// 이벤트 객체의 값을 가져옴.
			var count = a.target.value;
			
			//act1(count);
		
			// 이 블럭 내에서 $(this) == $(".modify")
			//act2($(".modify"));
			act2($(this));
		});
	});
	
	// id로 직접
	function act1(count) {
		var thisMid = $('#mid' + count);
		var thisName = $('#name' + count);
		var thisTelephone = $('#telephone' + count);
		
		var thisMidText = thisMid.text();
		var thisNameText = thisName.text();
		var thisTelephoneText = thisTelephone.text();
		
		console.log(thisMidText, thisNameText, thisTelephoneText);
		
		$('#midResult').val(thisMidText);
		$('#nameResult').val(thisNameText);
		$('#telephoneResult').val(thisTelephoneText);		
	}

	// 상하좌우
	function act2(now) {
		var thisTelephone = now.parent().prev();
		var thisName = thisTelephone.prev();
		var thisMid = thisName.prev();
		
		var thisTelephoneText = thisTelephone.text();
		var thisNameText = thisName.text();
		var thisMidText = thisMid.text();
		
		console.log(thisMidText, thisNameText, thisTelephoneText);

		$('#midResult').val(thisMidText);
		$('#nameResult').val(thisNameText);
		$('#telephoneResult').val(thisTelephoneText);
	}
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
						<c:forEach var="member" items="${list}" varStatus="vs">
							<tr id="tr${vs.count}">
								<td id="mid${vs.count}">${member.mid }</td>
								<td id="name${vs.count}">${member.name }</td>
								<td id="telephone${vs.count}">${member.telephone }</td>
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
				<form role="form" name="frm" action="membermodify.action" method="post">
					<input type="hidden" value="" id="midResult" name="mid">
					
					<div class="form-group">
						<label for="name">
							NAME : 
						</label>
						<input type="text" class="form-control" id="nameResult" name="name">
					</div>
					
					<div class="form-group">
						<label for="telephone">
							TELEPHONE : 
						</label>
						<input type="tel" class="form-control" id="telephoneResult" name="telephone">
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


