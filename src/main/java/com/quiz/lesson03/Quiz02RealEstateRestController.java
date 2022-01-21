package com.quiz.lesson03;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.quiz.lesson03.bo.RealEstateBO;
import com.quiz.lesson03.model.realEstate;


@RestController
@RequestMapping("/lesson03/quiz02")
public class Quiz02RealEstateRestController {
	
	@Autowired
	private RealEstateBO realEstateBO;

	@RequestMapping("/1")
	public String quiz02_1() {//view에 String으로 출력할거라 return이 String
		//realEstate 객체에 값을 세팅
		realEstate realestate = new realEstate(); //자바 빈으로 생성
		realestate.setRealtorId(3); // 값을 넣어줌
		realestate.setAddress("푸르지용 리버 303동 1104호");
		realestate.setArea(89);
		realestate.setType("매매");
		realestate.setPrice(100000);
		
		//BO한테 insert요청 -> 입력된 성공 row 수 리턴
		int rowCount = realEstateBO.addRealEstate(realestate); //BO,DAO다 int를 반환함 (MyBatis가 지원하는 값)
		
		// return 입력성공: row
		return "입력성공: " + rowCount;
	}
	
	
	@RequestMapping("/2")
	public String quiz02_2(
			@RequestParam(value="realtor_id", required=true) int realtorId //입력받은 값(필수값)
			) {
		int rowCount = realEstateBO.addRealEstate(realtorId, "썅떼빌리버 오피스텔 814호", 45, "월세", 100000, 120);
		
		return "입력성공: " + rowCount;
	}
}
