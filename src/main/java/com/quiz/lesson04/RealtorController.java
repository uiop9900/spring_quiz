package com.quiz.lesson04;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.quiz.lesson04.bo.RealtorBO;
import com.quiz.lesson04.model.Realtor;

@Controller
public class RealtorController {
	
	@Autowired
	private RealtorBO realtorBO;
	
	//http://localhost/lesson04/quiz02/1 - 뷰로 넘어가는 url -> get방식임, url를 치고 들어와서 뷰로 넘어가기 때문
	@RequestMapping("/lesson04/quiz02/1")
	public String quiz02_1() {
		return "lesson04/addRealtor";
	}
	
	//http://localhost/lesson04/quiz02/add_realtor 
	@PostMapping("/lesson04/quiz02/add_realtor")
	public String addRealtor( //따로 파라미터를 저장하게 되면 id를 받기 힘들다. -> @RequestParam과 @ModelAttribute 는 선호에 따라 다른다.
			// @RequestParam을 한 다음에는 아래에서 자바로 객체를 생성한 다음에 객체에 값을넘고 객체를 넘기는 형태이다. 
			@ModelAttribute Realtor realtor,
			Model model
			) { 
		
		// insert -> id를 반환받고
		realtorBO.addRealtor(realtor); 
		
		// select-> 반환받은 id로 /  insert,select를 두번 하면 컴터가 힘들지않나? 캐시에서 가져오기때문에 신경쓰지 말기 
 		Realtor result = realtorBO.getRealtorById(realtor.getId()); //잘안되면 id값이 잘 들어온건지 검증하면서 넘어가기
 		// realtor 변수를 재사용해서 여기서 담아도된다(단, insert만 하고 완벽하게 끝나는 경우에만 담기)
		
		// view에서 참조 가능
		model.addAttribute("result", result);
		
		return "lesson04/afterAddRealtor"; // 추가된 공인중개사 뷰(jsp)
	}
}
