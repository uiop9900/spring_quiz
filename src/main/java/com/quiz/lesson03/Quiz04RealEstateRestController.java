package com.quiz.lesson03;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.quiz.lesson03.bo.RealEstateBO;

@RestController
public class Quiz04RealEstateRestController {

	@Autowired
	private RealEstateBO realEstateBO;
	
	//cntl + shift+ R : 파일명으로 파일 오픈
	//http://localhost/lesson03/quiz04?id=21
	@RequestMapping("/lesson03/quiz04")
	public String quiz04(
			@RequestParam("id") int id
			) {
		
		int rowCount = realEstateBO.deleteRealEstateById(id);
		return "삭제 성공 : " + rowCount;
		
		//메소드커서 + F3 : 타고 들어갈수있다.
		// alt + 방향키: 왼쪽-이전 오른쪽-이후
		// ctrl + alt + h: 이 메소드를 쓰는 모든것들 -> call depth
		// 계층을 잘 이해하고 순서를 잘 나눠야한다. - 초기에 잘 뎁스를 짜야 한다. 아니면 나중에 엉킨다.
		
		
	}
}
