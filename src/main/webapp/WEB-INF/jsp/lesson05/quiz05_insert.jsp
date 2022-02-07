<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>날씨 입력</title>
	
	<!-- jQuery -->
	<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
	<!-- datepicker -->
 	<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
 	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<!-- bootstrap CDN link -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
	<!-- css파일 -->
	<link rel="stylesheet" type="text/css" href="/css/Lesson05Quiz05.css">
</head>
<body>

	<div class="container">
		<div class="d-flex">
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
					<li class="nav-item"><a class="nav-link" href="/lesson05/quiz05/1">날씨</a></li>
					<li class="nav-item"><a class="nav-link" href="/lesson05/quiz05/2">날씨입력</a></li>
					<li class="nav-item"><a class="nav-link" href="#">테마날씨</a></li>
					<li class="nav-item"><a class="nav-link" href="#">관측 기후</a></li>
				</ul>
			</nav>
		
		
			<%--오른쪽 content --%>
			<section class="ml-4">
				<h3>날씨입력</h3><%--누르면 그 정보를 들고 넘어가야 하니까 form태그 사용한다. --%>
				<form method="post" action="/lesson05/quiz05_insert">
				<!--첫 줄 -->
				<div class="d-flex ml-4 justify-content-around align-items-center">
					<div class="input-group">
						<div class="mt-1">날짜</div>
							<input type="text" class="form-control" id="date" name="date">
						</div>
					<div class="input-group ml-4">
						<div class="mt-1">날씨</div>
						<select class="form-control" id="weather" name="weather">
							<option>맑음</option>
							<option>흐림</option>
							<option>비</option>
							<option>구름조금</option>
						</select>
					</div>
					<div class="input-group ml-4">
						<div class="mt-1">미세먼지</div>
						<select class="form-control" id="microDust" name="microDust">
							<option>좋음</option>
							<option>보통</option>
							<option>나쁨</option>
							<option>최악</option>
						</select>
					</div>
				</div>
				
				<!--둘째 줄 -->
				<div class="d-flex mt-4 ml-4 justify-content-around">
					<div class="input-group">
						<div class="mt-1">기온</div>
						<input type="text" class="form-control" id="temperatures" name="temperatures">
						<div class="input-group-append">
							<span class="input-group-text">°C</span>
						</div>
					</div>
					<div class="input-group ml-4">
						<div class="mt-1">강수량</div>
						<input type="text" class="form-control" id="precipitation" name="precipitation">
						<div class="input-group-append">
							<span class="input-group-text">mm</span>
						</div>		
					</div>
					<div class="input-group ml-4">
						<div class="mt-1">풍속</div>
						<input type="text" class="form-control" id="windSpeed" name="windSpeed">
						<div class="input-group-appned">
							<span class="input-group-text">km/h</span>
						</div>
					</div>		
				</div>
				
				<div class="d-flex justify-content-end mt-4">	
					<input type="submit" value="저장" class="btn btn-success" id="join">
				</div>
				
				</form>
				</section>
		</div>
				<hr>
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

	
	
	<script>
		$(document).ready(function(e){//input에 들어가는 것이니까 input태그에서 id를 만들어야 한다.
			
			$("#date").datepicker({
				changeMonth: true
				, dateFormat: "yy-mm-dd" // 2022-02-07
			});
			
			$("#join").on("click", function(e){
				let date = $("#date").val();
				let weather = $("#weather").val();
				let microDust = $("#microDust").val();
				let temperatures = $("#temperatures").val();
				let precipitation = $("#precipitation").val();
				let windSpeed = $("#windSpeed").val();
				
				if(date == "") {
					alert("날짜를 선택하세요.")
					return;
				}
				if(weather == "") {
					alert("날씨를 선택하세요.")
					return;
				}
				if(microDust == "") {
					alert("미세먼지를 선택하세요.")
					return;
				}
				if(temperatures == "") {
					alert("기온을 입력하세요.")
					return;
				}
				if(precipitation == "") {
					alert("강수량를 입력하세요.")
					return;
				}
				if(windSpeed == "") {
					alert("풍속을 입력하세요.")
					return;
				}
				
				alert("날짜: " + date +
					  "\n날씨: " + weather +
					  "\n미세먼지: " + microDust +
					  "\n기온: " + temperatures +
					  "\n강수량: " + precipitation +
					  "\n풍속: " + windSpeed +
					  "\n입력이 완료되었습니다."	);
			});
			
		});
	
	</script>
</body>
</html>