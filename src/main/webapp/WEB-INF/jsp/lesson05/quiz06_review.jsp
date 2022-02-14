<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>배탈의 민족</title>
<!-- bootstrap CDN link -->
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
  <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

<!-- css파일 -->
	<link rel="stylesheet" type="text/css" href="/css/Lesson05Quiz06.css">

</head>
<body>
	<div id="wrap">
		<header>
			<div>배탈의 민족</div>
		</header>
		
		<div class="display-4 mt-2">${storeName} - 리뷰</div>
		<c:forEach var="review" items="${reviewList}" >
		<div id="reviewContent" class="mt-2">	
			<span id="reviewName">${review.userName}</span>
			<div>
				<fmt:formatNumber value="${review.point}" type="number"  var="point"/>
				<c:choose>
					<c:when test="${review.point.charAt(-1) != 0}" > 
						<c:set var="point" value="point-0.5" />
						<c:forEach begin = "1" end="point" step="1">
							<img src="/images/star-fill.png" alt="별모양" >
						</c:forEach>
						<img src="/images/star-half.png" >
						<c:forEach begin="5" end="point+1" step="-1">
							<img src="/images/star-empty.png" alt="별모양" >
						</c:forEach>
					</c:when>
					<c:otherwise>
						<c:forEach begin = "1" end="point" step="1">
							<img src="/images/star-fill.png" alt="별모양" >
						</c:forEach>
						<c:forEach begin="5" end="point" step="-1">
							<img src="/images/star-empty.png" alt="별모양" >
						</c:forEach>
					</c:otherwise>
				</c:choose>
				
				
				
								
			</div>
			<div id="reviewDate">
				<fmt:formatDate value="${review.createdAt}" pattern="yyyy월 MM월 dd일" />
			</div>
			<div id="reviewReview">${review.review}</div>
			<span id="reviewMenu">${review.menu}</span>
		</div>	
		</c:forEach>
		
					
	</div>
</body>
</html>