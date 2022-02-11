<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>즐겨찾기 목록</title>

	<!-- bootstrap CDN link -->
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
	<!-- Ajax 쓰려면 전체의 jQuery가져와야 한다 -->
  <script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
</head>
<body>
	<div class="container">
		<h1>즐겨 찾기 목록</h1>
		<table class="table">
			<thead>
				<tr>
					<th>NO.</th>
					<th>이름</th>
					<th>주소</th>
					<th></th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="bookmark" items="${bookmark}" >
				<tr>
					<td>${bookmark.id}</td>
					<td>${bookmark.name}</td>
					<td>${bookmark.url}</td>
					<td>
						<!-- 1) name속성과 value속성을 이용해서 삭제버튼 감지 -->
						<%-- <button type="button" class="btn btn-danger deleteBtn" name="delBtn" value="${bookmark.id}">삭제</button> --%>
						<%--2) data를 이용해서 태그에 임시 저장해놓기 --%>
						<button type="button" class="del-btn btn btn-danger" data-favorite-id="${bookmark.id}">삭제</button> 
							<%-- -뒤의 변수명은 내 임의, 카멜케이스 절대 안됨, value값을 많이 넘길때 단순 value설정값으로 넘기는것보다 jquery에서 제공하는 data- 설정값 사용, 여러개만들어도 된다. --%>
					</td>
				</tr>
				</c:forEach>			
			</tbody>
		</table>
	</div>
<script>
$(document).ready(function(e){
	//1) name속성과 value속성을 이용해서 삭제버튼 감지
/* 	$("td").on('click', 'button[name=delBtn]', function(e){//일단 태그로 잡고 그안에서 버튼태그에 name이 del인것
		let id = e.target.value; //3)새로운 방법 this와 동일한 함수
		
		//let id = $(this).attr('value'); // n개가 있을때 클릭이 된 그 것이 this. attr 파라1면 값 가지고 오기, 파라2이면 그 설정에 값 넣음
		alert(id);
	})   */
	
	
	//2) data를 이용해서 태그에 임시 저장해놓기
	// 태그: data-favorite-id 속성		data-  그 뒤부터는 우리가 이름을 정한다.(반드시 -문법, 카멜절대불가)
	// 자바스크립트: $(this).data('favorite-id'); 
	$('.del-btn').on('click', function(e){
		let id = $(this).data('favorite-id'); //String값으로 key를 넣는다고 생각
		
		$.ajax({
			type:"post" //삭제할때는 조심해야하기때문에 안보이게 post로 한다.
			, url:"/lesson06/bookmark_delete"
			, data: {'id':id}
			, success: function(data){
				if(data.result == 'success') {
					location.reload(); //삭제가 된 후에 새로고침하지않으면 삭제해도 그 행이 보여진다.
				} else {
					alert("삭제하는데 실패하였습니다. 관리자에게 문의해주세요.");
				}
			}
			, error: function(e){
				alert("에러");
			}
		});
	})
	
	
	// 내가 푼 풀이 : class로 잡고 this로 확인
/* 	$(".deleteBtn").on('click', function(e){//1)클래스로 잡기 id는 유일값이라 반복문안에서 id를 주면 제대로 먹히지않는다., 2) name으로 셀렉터 잡아도 된다.
		let id = $(this).val();
		alert(id);
		
		$.ajax({
			type:"POST"
			, url:"/lesson06/bookmark_delete"
			, data: {'id':id}
			, success: function(data){
				if (data.result == 'success'){
					location.reload();
				}
			}
			, error: function(e){
				alert("error");
			}
		}); 
		-
		value를 따로 넣지않고 아예 첫번쨰 td태그를 찾아서 값을 가져오기도 한다.
		parent(), children을 통해 찾고 td의 eq를 쓰면 list처럼 값을 가져올수도 있음
		-
		ajax error로 가면 아예 request가 잘못된거고 server에서 받아서 무언가 제대로 실행이 안됐으면 success안에서 if문을 통해 나눌수있음(success fail같이)
		
	}); */
});
</script>
</body>
</html>