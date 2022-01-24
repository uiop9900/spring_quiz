<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>판매자 추가</title>

<!-- bootstrap CDN link -->
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

  <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
</head>
<body>
	<div class="container">
		<h1>판매자 추가</h1>
		
		<form method="post" action="/lesson04/quiz01/add_seller">
			<div class=form-group>
				<label for="nickname"><b>닉네임</b></label>
				<input type="text" id="nickname" name="nickname" class="form-control col-5" placeholder="닉네임을 입력하세요."> 
			</div>
			<div class=form-group>
				<label for="profileImageUrl"><b>프로필 사진 URL</b></label>
				<input type="text" id="profileImageUrl" name="profileImageUrl" class="form-control col-10" placeholder="사진 url을 넣어주세요"> 
			</div>
			<div class=form-group>
				<label for="온도"><b>프로필 사진 URL</b></label>
				<input type="text" id="temperature" name="temperature" class="form-control col-5" placeholder="온도를 넣어주세요"> 
			</div>
			<div class=form-group>
				<input type="submit" class="btn btn-primary" value="추가">
			</div>
		</form>	
	
	</div>
	
</body>
</html>