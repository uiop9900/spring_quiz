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
		
		<button id="add" class="btn btn-success btn-block">추가</button> <%--이 버튼을 <a>로도 만들수있고 그러면 아래에서 e.prevent어쩌구로 남겨놔야 한다. --%>
	</div>
	
	
<script>
	$(document).ready(function(e){
		$('#add').on('click', function(e){
			//alert("클릭");
			let name = $('#name').val().trim(); //id로 잡아서 value를 가져오기때문에 name값 굳이 필요없음
			let url = $('#url').val().trim();
			
			if (name.length < 1) {
				alert("사이트명을 입력하세요.");
				return;
			}
			
			if (url == "") {
				alert("주소를 입력하세요.");
				return
			}
			
			//http도 아니고 https도 아닐때 -> 둘다 아닐때 and 조건
			if (url.startsWith('http') == false && url.startsWith('https') == false){
				alert("주소형식이 잘못되었습니다.");
				return;
			}
			
			//서버 호출	
			$.ajax({ //json모양이지만 object.
				type:"POST" //큰따옴표
				, url:"/lesson06/bookmark_add"
				, data: {'name':name, 'url':url} //json은 아니고 object임
				, success: function(data) { //반드시 String return: ajax는 무조건 반드시 String 리턴한다. json형태의 string
					//alert(data.result); //키로 value값을 가져올때
					if (data.result == "success") { //진짜 성공 (키값으로 부르면)
						// 목록화면으로 이동
						location.href="/lesson06/bookmark_list_view" //여기에서 view의 주소값을 입력 -> mapping된 주소 넣어준다.
					}
				}
				, error: function(e) { // 파라미터를 3개까지 넣는다.
					alert("error :" + e)
				}
			});
			
		});
		
	});

</script>
</body>
</html>