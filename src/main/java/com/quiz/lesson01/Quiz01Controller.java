package com.quiz.lesson01;

import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@RequestMapping("/lesson01/quiz01")
@Controller
public class Quiz01Controller { //controller와 mapping은 한 쌍
	
	@ResponseBody
	@RequestMapping("/1") // 같은 주소인 부분을 위로 올리고 다른 부분만 여기서 선언해준다.
	public String printString() {
		String text = "<h1>테스트 프로젝트 완성</h1> <h3>해당 프로젝트를 통해서 문제풀이를 진행합니다.</h3>";
		return text;
	}
	
	// 하나의 class안에 여러개의 메소드를 만들수있다.
	@RequestMapping("/2")
	@ResponseBody
	public Map<String, Integer> printMap() {
		Map<String, Integer> result = new HashMap<>();
		result.put("국어", 80);
		result.put("수학", 90);
		result.put("영어", 85);
		
		return result;
	}
	
	
}
