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
	
	<%--datepicker --%>
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css">
	<%--내 css --%>
	<link rel="stylesheet" type="text/css" href="/css/Lesson06LastQuiz.css">
</head>
<body>
	<div class="container">
		<div class="display-4 text-center">통나무 팬션</div>
		<c:import url="/WEB-INF/jsp/lesson06/booking_nav.jsp" />
		<section>
			<h3 class="text-center mt-3 mb-3 font-weight-bold">예약 하기</h3>
			<div id="reserve-box">
				<label for="name" class="reserve-font">이름</label>
				<input type="text" id="name" class="form-control">
				<label for="datepicker" class="reserve-font">예약날짜</label>
				<input type="text" id="datepicker" class="form-control">
				<label for="day" class="reserve-font">숙박일수</label>
				<input type="text" id="day" class="form-control" placeholder="예) 3">
				<label for="headcount" class="reserve-font">숙박인원</label>
				<input type="text" id="headcount" class="form-control" placeholder="예) 2">
				<label for="phoneNumber" class="reserve-font">전화번호</label>
				<input type="text" id="phoneNumber" class="form-control" placeholder="예) 010-2345-9876">
				
				<button type="button" class="btn btn-warning w-100 mt-3" id="reserveBtn">예약하기</button>
				
			</div>
		</section>
		<c:import url="/WEB-INF/jsp/lesson06/booking_footer.jsp" />
	</div>
<script>
$(document).ready(function(e){
	$("#datepicker").datepicker({
		showAnim: 'slide'
		, changeMonth: true
		, dateFormat: 'yy-mm-dd'
		, minDate: 0
	});
	
	$("#reserveBtn").on('click', function(e){
		let name = $("#name").val().trim();
		let date = $("#datepicker").val();
		let day = $("#day").val().trim();
		let headcount = $("#headcount").val().trim();
		let phoneNumber = $("#phoneNumber").val().trim();
		
		//validation check
		if (name == "") {
			alert("이름을 입력하세요.");
			return;
		}
		if (date == "") {
			alert("날짜를 선택하세요.");
			return;
		}
		if (day == "") {
			alert("숙박일수를 입력하세요.");
			return;
		}
		if (headcount == "") {
			alert("숙박인원을 입력하세요.");
			return;
		}
		if (phoneNumber == "") {
			alert("전화번호를 입력하세요.");
			return;
		}
		
		//ajax로 db insert
		$.ajax({
			type: "POST"
			, url:"/booking/reserve"
			, data : {"name":name, "date":date, "day":day, "headcount":headcount, "phoneNumber":phoneNumber}
			, success: function(data) {
				location.reload();
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