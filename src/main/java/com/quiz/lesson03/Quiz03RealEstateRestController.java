package com.quiz.lesson03;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.quiz.lesson03.bo.RealEstateBO;

@RestController

public class Quiz03RealEstateRestController {

	@Autowired
	private RealEstateBO realEstateBO;

	//http://localhost/lesson03/quiz03?id=8&type=전세&price=70000
	@RequestMapping("/lesson03/quiz03") //바로 위에서 매핑해줘야 한다
	public String quiz03(
			@RequestParam(value="id", required=true) int id, //클라이언트에게 int로 정의한 값들은 꼭 보내야한다고 정하는 메소드이다. class설정과는 상관없음
			@RequestParam(value="type", required=true) String type,
			@RequestParam("price") int price
			) {

		int rowCount = realEstateBO.updateRealEstateById(id, type, price);
		return "수정 성공 : " + rowCount;
	}
}
