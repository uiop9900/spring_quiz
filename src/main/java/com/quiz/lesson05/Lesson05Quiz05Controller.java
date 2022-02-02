package com.quiz.lesson05;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.quiz.lesson05.bo.WeatherhistoryBO;
import com.quiz.lesson05.model.Weatherhistory;

@Controller
public class Lesson05Quiz05Controller {
	
	@Autowired
	private WeatherhistoryBO weatherhistoryBO;
	
	//http://localhost/lesson05/quiz05/1 - 날씨 list화면
	@RequestMapping("/lesson05/quiz05/1")
	public String quiz05_1(Model model) {		
		//select하기
		List<Weatherhistory> weatherhistory = weatherhistoryBO.getweatherhistory();
		//view가 참조
		model.addAttribute("weatherhistory", weatherhistory);
		return "lesson05/quiz05_template";
	}
	
	//http://localhost/lesson05/quiz05/1 - 날씨 insert화면
	@RequestMapping("/lesson05/quiz05/2")
	public String quiz05_insert() {
		return "lesson05/quiz05_insert";
	}
	
	//insert화면에서 insert를 실행하는 메소드
	@PostMapping("/lesson05/quiz05_insert")
	public String quiz05_afterInsert(
			@ModelAttribute Weatherhistory weatherhistory //받은 정보들로 객체만듬
			) {
		
		//insert에서 저장된 객체를 가지고 와서 넘기고 insert한다.
		weatherhistoryBO.addWeatherhistory(weatherhistory);

		return "redirect:/lesson05/quiz05/1"; //날씨list 뷰로 다시 redirect한다.
	}
	
	
}
