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
			<c:forEach var="number" begin="1" end="4" step="1">
				<img src="/images/test06_banner${number}.jpg">
			</c:forEach>
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
					<div><input type="text" class="form-control"> </div>
				</div>
				<div class="d-flex mt-2">
					<div class="text-white mt-2 mr-1 ml-3">전화번호: </div>
					<div><input type="text" class="form-control" placeholder="예) 010-2345-1234"> </div>
				</div>
				<div align="right">
					<button class="btn btn-success mt-2 b-block">조회하기</button>
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
	//alert("아아");
});
</script>
</body>
</html>