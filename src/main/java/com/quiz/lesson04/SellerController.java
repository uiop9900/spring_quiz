package com.quiz.lesson04;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.quiz.lesson04.bo.SellerBO;
import com.quiz.lesson04.model.Seller;

@Controller
@RequestMapping("/lesson04/quiz01")
public class SellerController {
	
	@Autowired
	private SellerBO sellerBO;
	
	//http://localhost/lesson04/quiz01/1	-> 판매자 추가 view 화면
	@RequestMapping("/1") // -> GetMapping으로 해줘도 된다.(어차피 url을 통해 뷰화면으로 넘어가는 것이기에)
	public String addSeller() {
		return "lesson04/addSeller"; //절대경로, application에서 /까지 넣어줬기에 여기서는 제일 앞의 / 생략한다. 이 경로로 들어가진다.
	}
	
	//http://localhost/lesson04/quiz01/add_seller
	@PostMapping("/add_seller") // addSeller의 뷰에서 여기로 넘어온다. -> post만 허용
	public String add_Seller( //insert하는 메소드
			@RequestParam("nickname") String nickname,
			@RequestParam(value="profileImageUrl", required=false) String profileImageUrl, //여기서부터는 컬럼명과 변수명이 맞아야 한다. 그 전은 상관없음
			@RequestParam("temperature") double temperature //비필수-Double, 필수-double
			) {//값을 안넣어도 null로 들어오지 않고 공백("")으로 들어간다.
		
		sellerBO.addSeller(nickname, profileImageUrl, temperature);
		
		return "/lesson04/afterAddSeller";
	}
	
	
	//http://localhost/lesson04/quiz01/seller_info
	@GetMapping("/seller_info")//주소 치고 들어갔을때 보일것이니까 get으로 한다.
	public String seller_info(
			@RequestParam(value="id", required=false) Integer id,
			Model model) { //select문 - 테이블 자체의 클래스로 반환한다. map은 추천하지 않는다.
		
		// 우리가 분리해야한다.
		if (id == null) {
			//null이면 가장 최신의 인포를 내보낸다.
			Seller lastSeller = sellerBO.getLastSeller();
			model.addAttribute("result", lastSeller);
		} else {
			Seller sellerById = sellerBO.getSellerById(id);
			model.addAttribute("result", sellerById); //뷰가 모델을 참조할수있다.
		}
		
		return "lesson04/lastSeller";
	}
	
	
}
