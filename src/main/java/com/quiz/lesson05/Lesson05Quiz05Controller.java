package com.quiz.lesson05;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.quiz.lesson05.bo.WeatherhistoryBO;
import com.quiz.lesson05.model.Weatherhistory;

@Controller
public class Lesson05Quiz05Controller {
	
	@Autowired
	private WeatherhistoryBO weatherhistoryBO;
	
	//http://localhost/lesson05/quiz05/1 - 날씨 list화면
	//request -> response, 주소를 쳤을때 jsp화면이 나오는것
	@RequestMapping("/lesson05/quiz05/1")
	public String quiz05_1(Model model) {		

		List<Weatherhistory> weatherhistory = weatherhistoryBO.getweatherhistoryList();

		model.addAttribute("weatherhistory", weatherhistory);
		return "lesson05/quiz05_template";
	}
	
	//http://localhost/lesson05/quiz05/2 - 날씨 정보 입력 화면(insert화면)
	@RequestMapping("/lesson05/quiz05/2")
	public String quiz05_insert() {
		return "lesson05/quiz05_insert";
	}
	
	//insert를 실행하는 메소드 -> 결과: 날씨 정보 목록 화면으로 리다이렉트
	@PostMapping("/lesson05/quiz05_insert")//항상 form을 통해서만 들어올수있다.
	public String quiz05_afterInsert( //name으로 지정된 애들이 다 넘어온다
			@RequestParam("date") String date, //datepicker로 받으면 값이 String이라 오류 생김 -> 1)type을 String으로 변경해버리기.
			@RequestParam("weather") String weather,
			@RequestParam("microDust") String microDust,
			@RequestParam("temperatures") double temperatures, //필수값
			@RequestParam("precipitation") double precipitation,
			@RequestParam("windSpeed") double windSpeed
			//@ModelAttribute Weatherhistory weatherhistory //받은 정보들로 객체만듬
//			HttServletResponse response - servlet기반의 Spring이라 Servlet에서 쓰던 것도 가능하다
			) {
		
		// insert에서 저장된 객체를 가지고 와서 넘기고 insert한다.(DB insert)
		weatherhistoryBO.addWeatherhistory(date, weather, microDust, temperatures, precipitation, windSpeed);
		
		// 날씨 정보 목록 화면으로 리다이렉트
		// return response.sendDirect("/lesson05/quiz05/1"); - 예외처리도 해야하고 복잡할수있음
		return "redirect:/lesson05/quiz05/1"; //날씨list 뷰로 다시 redirect한다.
	}
	
	
}
