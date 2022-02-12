<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약목록</title>

<!-- bootstrap CDN link -->
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
	<!-- Ajax 쓰려면 전체의 jQuery가져와야 한다 -->
  <script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

	<link rel="stylesheet" type="text/css" href="/css/Lesson06LastQuiz.css">
</head>
<body>
	<div class="container">
		<div class="display-4 text-center">통나무 팬션</div>
		<c:import url="/WEB-INF/jsp/lesson06/booking_nav.jsp" />
		<section>
			<h3 class="text-center mt-3 mb-3 font-weight-bold">예약목록 보기</h3>
			<table class="table">
				<thead>
					<tr>
						<th>이름</th>
						<th>예약날짜</th>
						<th>숙박일수</th>
						<th>숙박인원</th>
						<th>전화번호</th>
						<th>예약상태</th>
						<th></th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="list" items="${bookingList}">
					<tr>
						<td>${list.name}</td>
						<td>
							<fmt:formatDate value="${list.date}" pattern="yyyy년 MM월 dd일" />
						</td>
						<td>${list.day}</td>
						<td>${list.headcount}</td>
						<td>${list.phoneNumber}</td>
						<c:choose>
							<c:when test="${list.state == '대기중'}">
								<td class="text-info">${list.state}</td>
							</c:when>
							<c:when test="${list.state == '확정'}">
								<td class="text-success">${list.state}</td>
							</c:when>
						</c:choose>
						<td>
							<button type="button" class="btn btn-danger delBtn" data-booking-id="${list.id}">삭제</button>
						</td>
					</tr>
					</c:forEach>
				</tbody>
			</table>
		</section>
		
		<c:import url="/WEB-INF/jsp/lesson06/booking_footer.jsp" />
	</div>
<script>
$(document).ready(function(e){
	$(".delBtn").on('click', function(e){
		let id = $(this).data("booking-id");
		
		$.ajax({
			type:"POST"
			, url:"/booking/delete"
			, data: {"id":id}
			, success: function(data){
				if(data.result == 'success') {
					location.reload();
				}
			}
			, error: function(e) {
				alert("error");
			}
		});
	});
});
</script>
</body>
</html>