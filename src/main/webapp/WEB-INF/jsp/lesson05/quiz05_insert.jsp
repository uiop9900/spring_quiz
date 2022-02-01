<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>날씨 입력</title>

		<!-- css파일 -->
	<link rel="stylesheet" type="text/css" href="/css/Lesson05Quiz05.css">
	
	<!-- bootstrap CDN link -->
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

  <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
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
					<li class="nav-item"><a class="nav-link" href="#">날씨</a></li>
					<li class="nav-item"><a class="nav-link" href="#">날씨입력</a></li>
					<li class="nav-item"><a class="nav-link" href="#">테마날씨</a></li>
					<li class="nav-item"><a class="nav-link" href="#">관측 기후</a></li>
				</ul>
			</nav>
		
		
			<%--오른쪽 content --%>
			<section class="ml-4">
				<h3>날씨입력</h3>
				<form method="" action="">
				<div class="d-flex justify-content-around">
					<div class="form-group">
						<div>날짜</div>
							<input type="text" class="form-control" id="datepicker">
						</div>
					<div class="form-group">
						<div>날씨</div>
						<select class="form-control" id="weather" name="weather">
							<option>맑음</option>
							<option>흐림</option>
							<option>비</option>
							<option>구름조금</option>
						</select>
					</div>
					<div class="form-group">
						<div>미세먼지</div>
						<select class="form-control" id="microDust" name="microDust">
							<option>좋음</option>
							<option>보통</option>
							<option>나쁨</option>
							<option>최악</option>
						</select>
					</div>
				</div>
				<div class="d-flex justify-content-around">
					<div class="input-group">
						<div>기온</div>
						<input type="text" class="form-control">
						<div class="input-group-append">
							<span class="input-group-text" id="temperatures" name="temperatures">°C</span>
						</div>
					</div>
					<div class="input-group">
						<div>강수량</div>
						<input type="text" class="form-control">
						<div class="input-group-append">
							<span class="input-group-text" id="precipitation" name="precipitation">mm</span>
						</div>		
					</div>
					<div class="input-group">
						<div>풍속</div>
						<input type="text" class="form-control">
						<div class="input-group-appned">
							<span class="input-group-text" id="windSpeed" name="windSpeed">km/h</span>
						</div>
					</div>		
				</div>
				
				<div class="justify-content-end">	
					<input type="submit" value="저장" class="btn btn-success" id="join">
				</div>
				
				</form>
				</section>
		</div>
	</div>	

	
	
	<script>
		$(document).ready(function(e){
			$("#join").on("click", function(e){
				let 
				
				
			});
			
		});
	
	</script>
</body>
</html>