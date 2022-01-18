package com.quiz.lesson01;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class Quiz03Controller {
	
	@RequestMapping("/lesson01/quiz03/1") // 여기는 내가 임의로 mapping값 정할수있음. / 로 시작해야한다.
	public String view() { // ResponseBody없으니 경로.
		return "lesson01/quiz03_1"; // jsp 뷰 경로 
		// 이 부분이 기둥이니까 완벽하게 이해해야한다.
	}
}
