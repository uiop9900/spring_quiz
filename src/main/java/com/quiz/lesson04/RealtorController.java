package com.quiz.lesson04;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.quiz.lesson04.bo.RealtorBO;
import com.quiz.lesson04.model.Realtor;

@Controller
public class RealtorController {
	
	@Autowired
	private RealtorBO realtorBO;
	
	//http://localhost/lesson04/quiz02/1 - 뷰로 넘어가는 url
	@RequestMapping("/lesson04/quiz02/1")
	public String quiz02_1() {
		return "lesson04/addRealtor";
	}
	
	//http://localhost/lesson04/quiz02/add_realtor
	@PostMapping("/lesson04/quiz02/add_realtor")
	public String addRealtor(
			@ModelAttribute Realtor realtor) { 
		
		
		// insert할것임 
		realtorBO.addRealtor(realtor); 
		
		
		return "";
	}
}
