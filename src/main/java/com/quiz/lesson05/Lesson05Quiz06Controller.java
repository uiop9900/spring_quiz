package com.quiz.lesson05;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.quiz.lesson02.bo.StoreBO;
import com.quiz.lesson02.model.Store;

@Controller
public class Lesson05Quiz06Controller {
	
	@Autowired
	private StoreBO storeBO;
	
	//http://localhost/lesson05/quiz06
	@RequestMapping("/lesson05/quiz06")
	public String quiz06(Model model) {
		
		//select해서 view로 보내기
		List<Store> storeList = storeBO.getStoreList();
		model.addAttribute("storeList", storeList);
		return "lesson05/quiz06_template";
	}
	
	@RequestMapping("/lesson05/quiz06_review")
	public String quiz06_review(HttpServletRequest request, Model model) {
		int storeId = Integer.parseInt(request.getParameter("storeId"));
		String storeName = request.getParameter("storeName");
		
		model.addAttribute("storeId", storeId);
		model.addAttribute("storeName", storeName);
		
		return "lesson05/quiz06_review";
	}
}
