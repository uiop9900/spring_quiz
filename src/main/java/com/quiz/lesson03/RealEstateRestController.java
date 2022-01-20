package com.quiz.lesson03;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.quiz.lesson03.bo.RealEstateBO;
import com.quiz.lesson03.model.realEstate;


@RestController
@RequestMapping("/lesson03/quiz01")
public class RealEstateRestController {
	
	//http://localhost/lesson03/quiz01/1
	@Autowired
	private RealEstateBO realEstateBO;
	
	@RequestMapping("/1")
	public realEstate quiz01_1 (//requestParam은 view에서 받은 param
			@RequestParam(value="id", required=true) int id //필수 파라미터, value에서 id 값을 가져온다, 뒤에 int id는 내가 임의로 정한 변수임
			) {
		return realEstateBO.getRealEstateById(id); //jackson 라이브러리로 인해 json으로 변환
	}
	
	
	//http://localhost/lesson03/quiz01/2
	
	@RequestMapping("/2") // 필드가 nullable가는 중요하지않고 이 메소드는 어떻게 쿼리를 받을건지가 중요함. 쿼리스트링으로 nullable하면 required=false인거임.
	public List<realEstate> quiz01_2(//return값 주의!!! 여러개면 List로 리턴해야한다! 그냥 type만 넣으면 오류생김!
			@RequestParam(value="rent_price") int rentPrice
			) {
		return realEstateBO.getRealEstateListByRentPrice(rentPrice);
	}

	
	//http://localhost/lesson03/quiz01/3
	@RequestMapping("/3")
	public List<realEstate> quiz01_3( //여러개니까 List
			@RequestParam(value="area", required=true) int area, // 필수값
			@RequestParam(value="price") int price// 필수값
			) {
		return realEstateBO.getRealEstateListByAreaPrice(area, price);
	}
}
