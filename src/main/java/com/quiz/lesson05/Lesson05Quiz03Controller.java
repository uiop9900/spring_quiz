package com.quiz.lesson05;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class Lesson05Quiz03Controller {
	
	//http://localhost/lesson05/quiz03/1
	@RequestMapping("lesson05/quiz03/1")
	public String quiz03_1(Model model) {
		//3-1
		List<Integer> candidates = new ArrayList<>();
		candidates.add(263001);
		candidates.add(173942); 
		candidates.add(563057); 
		
		//총 득표수 구하는 로직: 원래는 BO에서 하는게 맞다.- 로직을 어디에 두는 지 중요하다. 이런 계산 로직은 서버에서 하는걸로.
		int totalCount = 0;
		for(Integer candidate : candidates) {
			totalCount += candidate;
		}
		
		//3-2
		List<Map<String, Object>> cardBills = new ArrayList<>();

		Map<String, Object> cardBill = new HashMap<>();
		cardBill.put("store", "GS48");
		cardBill.put("pay", 7800);
		cardBill.put("date", "2025-09-14");
		cardBill.put("installment", "일시불");
		cardBills.add(cardBill);

		cardBill = new HashMap<>();
		cardBill.put("store", "현태백화점");
		cardBill.put("pay", 2750000);
		cardBill.put("date", "2025-09-18");
		cardBill.put("installment", "3개월");
		cardBills.add(cardBill);

		cardBill = new HashMap<>();
		cardBill.put("store", "요촌치킨");
		cardBill.put("pay", 180000);
		cardBill.put("date", "2025-09-20");
		cardBill.put("installment", "일시불");
		cardBills.add(cardBill);
		
		// 데이트 객체 생성
		Date date = new Date();
		
		//3-1
		model.addAttribute("candidates", candidates);
		model.addAttribute("totalCount", totalCount);
		//3-2
		model.addAttribute("date", date);
		model.addAttribute("cardBills", cardBills);
		
		
		return "lesson05/quiz03";
	}
}
