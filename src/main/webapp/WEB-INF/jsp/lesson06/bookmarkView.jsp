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
			<div class="form-inline"> 
				<input type="text" class="form-control col-10" id="url" name="url">
				<button type="button" id="duplicationBtn" class="ml-2 btn btn-info">중복확인</button>
			</div>

		<small id="statusUrl" class="text-danger d-none">중복된 url입니다.</small> <!-- 이번에 Toggle로 할 예정 -->
		<small id="availableUrlText" class="text-success d-none">저장가능한 url입니다.</small> <!-- 이번에 Toggle로 할 예정 -->
		</div>
		
		<button id="add" class="btn btn-success btn-block">추가</button> <%--이 버튼을 <a>로도 만들수있고 그러면 아래에서 e.prevent어쩌구로 남겨놔야 한다. --%>
	</div>
	
	
<script>
	$(document).ready(function(e){ //ajax쓸때는 form태그 지양
		// 주소 중복 확인
		$("#duplicationBtn").on('click', function(e){
			let url = $('#url').val().trim();
			
			if (url == "") {
				alert("검사할 url을 입력해주세요.");
				return;
			}
			
			//서버 호출해서 확인
			$.ajax({
				type:"POST"
				, url:"/lesson06/bookmark_isDuplicate"
				, data: {'url':url}
				, success: function(data) {//성공하면 String이 넘어오는 것 -> object로 알아서 변경하고 받은 값 data를 key값으로 꺼낸다.
					if (data.result) {//true - 중복인 경우
						$("#statusUrl").removeClass("d-none");
						$("#availableUrlText").addClass("d-none");
						
					} else {
						$("#availableUrlText").removeClass("d-none");
						$("#statusUrl").addClass("d-none");
					}
				}
				, error: function(e){
					alert("error");
				}
			});
		});
		
		//즐겨찾기 추가
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
			
			// quiz02 - 중복확인 체크 : 초록색글자가 뜨면 저장가능한 걸로 판단
			if ($("#availableUrlText").hasClass("d-none")) { // -> 초록글자가 가려져 있다. -> 중복값 이거나 아예 검사를 안했다.
				// 저장가능 URL 문구가 없으면 검사를 다시 해야함
				alert("다시 중복확인을 해주세요");
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