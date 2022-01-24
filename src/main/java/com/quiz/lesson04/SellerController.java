package com.quiz.lesson04;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.fasterxml.jackson.annotation.JsonTypeInfo.Id;
import com.quiz.lesson04.bo.SellerBO;
import com.quiz.lesson04.model.Seller;

@Controller
@RequestMapping("/lesson04/quiz01")
public class SellerController {
	
	@Autowired
	private SellerBO sellerBO;
	
	//http://localhost/lesson04/quiz01/1
	@RequestMapping("/1")
	public String addSeller() {
		return "lesson04/addSeller"; //이 경로로 들어가진다.
	}
	
	//http://localhost/lesson04/quiz01/add_seller
	@PostMapping("add_seller")
	public String add_Seller( //insert하는 메소드
			@RequestParam("nickname") String nickname,
			@RequestParam(value="profileImageUrl", required=false) String profileImageUrl,
			@RequestParam("temperature") Double temperature
			) {
		
		sellerBO.addSeller(nickname, profileImageUrl, temperature);
		
		return "/lesson04/afterAddSeller";
	}
	
	
	//http://localhost/lesson04/quiz01/seller_info
	@RequestMapping("/seller_info")
	public String seller_info(
			//@ModelAttribute Id id,//class생성
			Model model) { //select문
		
		Seller lastSeller = sellerBO.getLastSeller();
		
		model.addAttribute("result", lastSeller);
		model.addAttribute("id", id);
		
		return "lesson04/lastSeller";
	}
	
	
}
