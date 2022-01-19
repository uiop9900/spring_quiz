package com.quiz.lesson03;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.quiz.lesson03.bo.RealEstateBO;
import com.quiz.lesson03.model.realEstate;

@RequestMapping("/lesson03/quiz01")
@RestController
public class RealEstateRestController {
	
	@Autowired
	private RealEstateBO realEstateBO;
	
	@RequestMapping("/1")
	public realEstate quiz01 (
			@RequestParam(value="id") int id
			) {
		return realEstateBO.getRealEstate(id); 
		
	}
}
