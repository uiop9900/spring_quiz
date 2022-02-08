<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>즐겨찾기 추가하기</title>

<!-- bootstrap CDN link -->
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
	<!-- Ajax 쓰려면 전체의 jQuery가져와야 한다 -->
  <script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
</head>
<body>
	<div class="container">
		<h1>즐겨 찾기 추가 하기</h1>
		
		<div class="form-group">
			<label for="name">제목</label>
			<input type="text" class="form-control" id="name" name="name">
		</div>
		
		<div class="form-group">
			<label for="url">주소</label>
			<input type="text" class="form-control" id="url" name="url">
		</div>
		
		<button id="add" class="btn btn-success w-100">추가</button>
	</div>
	
	
<script>
	$(document).ready(function(e){
		$('#add').on('click', function(e){
			//alert("클릭");
			let name = $('#name').val().trim();
			let url = $('#url').val().trim();
			
			if (name == "") {
				alert("제목을 입력하세요.");
				return;
			}
			
			if (url == "") {
				alert("주소를 입력하세요.");
				return
			}
			if (!(url.startsWith('http') || url.startsWith('https'))){
				alert("주소값을 http(s)를 포함해서 넣어주세요.");
				return;
			}
			
			$.ajax({
				type:'POST'
				, url:'/lesson06/bookmark_add'
				, data: {'name':name, 'url':url}
				, success: function(data) {
					alert("성공");
					location.href='/lesson06/bookmark_add' //여기에서 return해야한다. 
				}
				, error: function(e) {
					alert("error :" + e)
				}
			});
			
		});
		
	});

</script>
</body>
</html>