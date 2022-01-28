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
		<div class="container d-flex">
			<nav class="bg-danger col-3">
				<header class="bg-warning">
					<div>
						<img src="/images/기상청.jpg" alt="기상청로고" width="50">
						<span>기상청</span>
					</div>
				</header>
				<ul class="nav flex-column">
					<li class="nav-item"><a class="nav-link" href="#">날씨</a></li>
					<li class="nav-item"><a class="nav-link" href="#">날씨입력</a></li>
					<li class="nav-item"><a class="nav-link" href="#">테마날씨</a></li>
					<li class="nav-item"><a class="nav-link" href="#">관측 기후</a></li>
				</ul>
			</nav>
			<section class="bg-secondary col-9">
				<h3>과거 날씨</h3>
				<table>
				
				</table>
			</section>
		</div>
	</div>
	
</body>
</html>