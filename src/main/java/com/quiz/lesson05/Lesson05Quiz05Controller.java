package com.quiz.lesson05;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class Lesson05Quiz05Controller {
		
	//http://localhost/lesson05/quiz05/1
	@RequestMapping("/lesson05/quiz05/1")
	public String quiz05_1() {
		
		//db 연결해서 bo-dao-xml로 모든 정보 select해서 뷰로 넘긴다.
		
		return "lesson05/quiz05_1";
	}
}
