<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>날씨 정보 페이지</title>
	
	<!-- css파일 -->
	<link rel="stylesheet" type="text/css" href="/css/Lesson05Quiz05.css">
	
	<!-- bootstrap CDN link -->
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

  <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
</head>
<body>
	<div id="wrap">
		<div class="container">
			<div class="d-flex">
				<%--왼쪽 menu --%>
				<nav class="col-2">
					<header>
						 <div class="d-flex justify-content-center">
							<div>
								<img src="/images/기상청.png" alt="기상청로고" width="50">
							</div>
							<div class="logo">기상청</div>
						</div>	
					</header>
					<ul class="nav flex-column">
						<li class="nav-item"><a class="nav-link" href="#">날씨</a></li>
						<li class="nav-item"><a class="nav-link" href="#">날씨입력</a></li>
						<li class="nav-item"><a class="nav-link" href="#">테마날씨</a></li>
						<li class="nav-item"><a class="nav-link" href="#">관측 기후</a></li>
					</ul>
				</nav>

				<%--오른쪽 화면 --%>
				<section class="col-10 ml-4">
				<h3>과거 날씨</h3>
				<table class="table text-center">
					<thead>
						<tr>
							<th>날짜</th>
							<th>날씨</th>
							<th>기온</th>
							<th>강수량</th>
							<th>미세먼지</th>
							<th>풍속</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="weather" items="${weatherhistory}">
						<tr>								<td>${weather.date}</td>
							<td>
							<%--기온에 따른 사진 삽입 --%>
							<c:choose>
								<c:when test="${weather.weather == '맑음'}" >
									<img src="/images/sunny.jpg" alt="날씨 기호">
								</c:when>
								<c:when test="${weather.weather == '비'}" >
										<img src="/images/rainy.jpg" alt="날씨 기호">
								</c:when>
								<c:when test="${weather.weather == '구름조금'}" >
									<img src="/images/partlyCloudy.jpg" alt="날씨 기호">
								</c:when>
								<c:when test="${weather.weather == '흐림'}" >
									<img src="/images/cloudy.jpg" alt="날씨 기호">
								</c:when>
							</c:choose>
							</td>
							<td>${weather.temperatures}</td>
							<td>${weather.precipitation}</td>
							<td>${weather.microDust}</td>
							<td>${weather.windSpeed}</td>
						</tr>
						</c:forEach>
					</tbody>
				</table>
				</section>
			</div>
			
			<%--아래 footer --%>
			<footer>
				<div class="d-flex">
					<div>
						<img src="/images/footer.logo.jpg" alt="기상청 로고" width="200">
					</div>
					<div class="mt-3">
						<span>(07062) 서울시 동작구 여의대방로 16길 61</span><br>
						<span>CopyRight@2022 KMA. All Rights RESERVED.</span>
					</div>
				</div>
			</footer>
		</div>
	</div>
	
</body>
</html>