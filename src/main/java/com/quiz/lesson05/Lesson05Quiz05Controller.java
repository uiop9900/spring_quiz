package com.quiz.lesson05;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.quiz.lesson05.bo.WeatherhistoryBO;
import com.quiz.lesson05.model.Weatherhistory;

@Controller
public class Lesson05Quiz05Controller {
	
	@Autowired
	private WeatherhistoryBO weatherhistoryBO;
	
	//http://localhost/lesson05/quiz05/1
	@RequestMapping("/lesson05/quiz05/1")
	public String quiz05_1(Model model) {		
		
		//select하기
		List<Weatherhistory> weatherhistory = weatherhistoryBO.getweatherhistory();
		
		model.addAttribute("weatherhistory", weatherhistory);
		
		return "lesson05/quiz05_template";
	}
	
	// insert 화면 
	@RequestMapping("/lesson05/quiz05/2")
	public String quiz05_insert() {
		return "lesson05/quiz05_insert";
	}
	
	
}
