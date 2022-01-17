package com.quiz.lesson01;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RequestMapping("/lesson01/quiz02")
@RestController // Controller의 기능 + ResponseBody도 내려준다.
public class Quiz02RestController {

	//http://localhost:8080/lesson01/quiz02/1
	@RequestMapping("/1")
	public List<Map<String, Object>> printMap() { //출력된거 보고 어떤 형태인지 짜기
		List<Map<String, Object>> list = new ArrayList<>();
		Map<String, Object> map1 = new HashMap<>(); // map은 항상 새롭게 new해줘야 칸칸에 들어간다.
		map1.put("rate", 15);
		map1.put("director", "봉준호");
		map1.put("time", 131);
		map1.put("title", "기생충");
		list.add(map1);
		
		Map<String, Object> map2 = new HashMap<>(); // 변수 map으로 계속 사용해도된다. new만 해주면 괜찮음
		map2.put("rate", 0);
		map2.put("director", "르베르토 베니니");
		map2.put("time", 166);
		map2.put("title", "인생은 아름다워");
		list.add(map2);
		
		Map<String, Object> map3 = new HashMap<>();
		map3.put("rate", 12);
		map3.put("director", "크리스토퍼 놀란");
		map3.put("time", 147);
		map3.put("title", "인셉션");
		list.add(map3);
		
		Map<String, Object> map4 = new HashMap<>();
		map4.put("rate", 19);
		map4.put("director", "윤종빈");
		map4.put("time", 133);
		map4.put("title", "범죄와의 전쟁: 나쁜놈들 전성시대");
		list.add(map4);
		
		Map<String, Object> map5 = new HashMap<>();
		map5.put("rate", 15);
		map5.put("director", "프란시스 로렌스");
		map5.put("time", 137);
		map5.put("title", "헝거게임");
		list.add(map5);
		
		return list;
	}
	
	//http://localhost:8080/lesson01/quiz02/2
	@RequestMapping("/2")
	public List<Board> quiz02_2() {
		List<Board> result = new ArrayList<>(); // 명칭을 같이 잘 바꿔줘야 한다. Map->map, List-> boardList
		
		Board board = new Board();
		board.setTitle("가입인사 드립니다.");
		board.setUser("hagulu");
		board.setContent("안녕하세요. 가입했어요, 앞으로 잘부탁드립니다.");
		result.add(board);
		
		Board board2 = new Board();
		board2.setTitle("헐 대박.");
		board2.setUser("bada");
		board2.setContent("오늘 목요일이었어,, 금요일인줄");
		result.add(board2);
		
		Board board3 = new Board();
		board3.setTitle("오늘 데이트한 얘기 해드릴게요");
		board3.setUser("dulumary");
		board3.setContent("...");
		result.add(board3);
	
		return result;
	}
	

	@RequestMapping("/3")
	public ResponseEntity<Board> quiz02_3() {
		
		Board board = new Board();
		board.setTitle("가입인사 드립니다.");
		board.setUser("hagulu");
		board.setContent("안녕하세요. 가입했어요, 앞으로 잘부탁드립니다.");
		
		return new ResponseEntity<>(board, HttpStatus.INTERNAL_SERVER_ERROR); // return 하고자 하는 객체, 에러형태
	}
		// 내맘대로 숫자를 정해서 하는것도 괜찮다. -  좀 더 상세하게 에러를 잡을 수 있음
}
