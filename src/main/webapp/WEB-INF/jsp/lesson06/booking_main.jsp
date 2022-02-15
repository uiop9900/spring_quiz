<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>통나무 팬션</title>
	
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
		<%--nav --%>
		<c:import url="/WEB-INF/jsp/lesson06/booking_nav.jsp" />
		<%--사진 --%>
		<section>
			<img id="images" src="/images/test06_banner1.jpg" alt="팬션 사진">
		</section>
		<%--main의 bottom content --%>
		<div class="d-flex bottom_content">
			<div class="col-4 content1">
				<div class="display-4 mt-5 ml-5">실시간</div>			
				<div class="display-4 ml-5">예약하기</div>			
			</div>
			<div class="col-4 content2">
				<div class="mt-3 bigger_letter">예약 확인</div>
				<div class="d-flex">
					<div class="text-white mt-2 mr-1 ml-5">이름: </div>
					<div><input type="text" id="name" class="form-control"> </div>
				</div>
				<div class="d-flex mt-2">
					<div class="text-white mt-2 mr-1 ml-3">전화번호: </div>
					<div><input type="text" id="phoneNumber" class="form-control" placeholder="예) 010-2345-1234"> </div>
				</div>
				<div align="right">
					<button id="checkBtn"class="btn btn-success mt-2 b-block">조회하기</button>
				</div>
			</div>
			<div class="col-4 content3 pt-5">
				<div class="bigger_letter font-weight-bold pl-5">예약문의:</div>
				<div class="pl-5">010-</div>
				<div class="pl-5">0000-1111</div>
			</div>
		</div>
		<%--footer --%>
		<c:import url="/WEB-INF/jsp/lesson06/booking_footer.jsp" />
	</div>
	
<script>
$(document).ready(function(e){
		//3초마다 메인사진 변경
		let mainImages = ["1.jpg", "2.jpg", "3.jpg", "4.jpg"]; 
		let imagesIndex = 0; //배열을 가르키는 변수
		
		setInterval(function(e){
			$("#images").attr("src" , "/images/test06_banner" + mainImages[imagesIndex]);
			imagesIndex++;
			if (imagesIndex > mainImages.length-1) { //4
				imagesIndex = 0;
			} // 파라1: 함수 그 자체
		}, 3000);//파라2: 얼마간격?

		//조회하기 버튼 클릭 이벤트
		$("#checkBtn").on('click', function(e){
			let name = $("#name").val().trim();
			let phoneNumber = $("#phoneNumber").val().trim();
			
			//받아온 값을 최대한 검증을 한 후 server에 보내는 게 좋다.
			//validation check
			if (name == "") {
				alert("이름을 입력해주세요.");
				return;
			}
			if (phoneNumber == "") {
				alert("전화번호를 입력해주세요.");
				return;
			}
			if (phoneNumber.startsWith("010") == false) {
				alert("010으로 시작하는 번호만 입력할 수 있습니다.");
				return;
			}	
		
			
			$.ajax({
				type: "POST"
				,url:"/booking/check_reserve"
				,data: {"name":name, "phoneNumber":phoneNumber}
				,success: function(data){
					// {"result": "sucess", 	booking 그 자체를 통으로 담아서 넘긴다.
					// "code":"1" 				-> 어떠한 형태로 json을 만들지는 개발자 마음대로이다.
					// {"name":"이지아", "phoneNumber":"010-9973-5424"}}
					if (data.code == 1) {
						//성공 - 키를 가지고 하나씩 들어가면서 값을 추출한다.
						//date 객체가 model로 내려가서 보여지면 kst~~어쩌구이고, json으로 변환되서 내려지면 년월일시분초어쩌구가 다 나온다. -> 어떻게 내려지냐에 따라 보여지는게 다르다.
						let booking = data.booking;
						let message = "이름: " + booking.name + "\n날짜: " + booking.date.substring(0,10) 
									 + "\n일수: " + booking.day + "\n인원: " + booking.headcount 
									 + "\n상태: " + booking.state
						
						alert(message);
					} else {
						alert("예약 내역이 없습니다.");
					}
					
/* 					if(Object.keys(data).length == 0) {
						alert("예약 내역이 없습니다.");
					} else {
						alert("이름: " + data.name
								 + "\n날짜: " + data.date.substring(0,10)
								 + "\n일수: " + data.day
								 + "\n인원: " + data.headcount 
								 + "\n상태: " + data.state);
					}
				*/ } 
				, error: function(e) {
					alert("서버 통신 실패");
				}
			});

		});
});
</script>
</body>
</html>