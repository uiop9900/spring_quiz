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
		let imagesIndex = 0;
		
		setInterval(function(e){
			$("#images").attr("src" , "/images/test06_banner" + mainImages[imagesIndex]);
			imagesIndex++;
			if (imagesIndex > mainImages.length-1) { //4
				imagesIndex = 0;
			}
		}, 3000);

		//조회하기
		$("#checkBtn").on('click', function(e){
			let name = $("#name").val().trim();
			let phoneNumber = $("#phoneNumber").val().trim();
			
			if (name == "") {
				alert("이름을 입력해주세요.");
				return;
			}
			if (phoneNumber == "") {
				alert("전화번호를 입력해주세요.");
				return;
			}
			
			$.ajax({
				type: "POST"
				,url:"/booking/check_reserve"
				,data: {"name":name, "phoneNumber":phoneNumber}
				,success: function(data){
					if(Object.keys(data).length == 0) {
						alert("예약 내역이 없습니다.");
					} else {
						alert("이름: " + data.name
								 + "\n날짜: " + data.date.substring(0,10)
								 + "\n일수: " + data.day
								 + "\n인원: " + data.headcount 
								 + "\n상태: " + data.state);
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