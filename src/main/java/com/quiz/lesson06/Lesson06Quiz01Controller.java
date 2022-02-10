package com.quiz.lesson06;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.quiz.lesson06.bo.BookMarkBO;
import com.quiz.lesson06.model.Bookmark;

@Controller
public class Lesson06Quiz01Controller {
	
	@Autowired
	private BookMarkBO bookmarkBO;
	
	//http://localhost/lesson06/bookmark_view 
	@RequestMapping("/lesson06/bookmark_view")
	public String bookmarkView() {
		return "lesson06/bookmarkView";
	}
	
	// 즐겨찾기 추가 기능 - ajax 호출로 들어오는 요청
	@PostMapping("/lesson06/bookmark_add")
	@ResponseBody
	public Map<String,String> bookmarkAdd(//뷰 경로를 return 할 수 없다. -> json을 반환해본다.
			@RequestParam("name") String name,
			@RequestParam("url") String url // 일반 text일떄는 model 객체 사용 불가
			) {
		//insert DB
		bookmarkBO.addBookmark(name, url);
		
		//return map => return json string
		Map<String, String> result = new HashMap<>(); //API처럼
		result.put("result", "success");
		
		return result; //키값을 반환하면 알아서 value값인 success가 리턴됨
		//json이 String이라는건 key-value가 아니라 문자 하나하나로 인식했다. 근데 왜 object? json형태의 string을 알아서 json형태로 만들어준다.
	}
		
	//즐겨찾기 목록 화면
	@RequestMapping("/lesson06/bookmark_list_view")
	public String bookmarkList(Model model) { //model 객체는 뷰의 경로가 리턴될때만 사용가능하다.
		
		//select
		List<Bookmark> bookmark = bookmarkBO.getBookmarkList();
				
		model.addAttribute("bookmark", bookmark);
		
		return "lesson06/bookmarkAdd";
	}
	
	//주소 중복 확인 - AJAX 통신 호출
	@PostMapping("/lesson06/bookmark_isDuplicate")
	@ResponseBody
	public Map<String, Boolean> isDuplpicate(
			@RequestParam("url") String url) {

		// DB 중복확인
		Bookmark bookmark = bookmarkBO.getBookmarkByUrl(url); //중복이면 값이 있고 없으면 null이 담겨있다.
		
		
		Map<String, Boolean> result = new HashMap<>();
		result.put("result", true);
		
		if (bookmark == null) {
			//중복되지 않음
			result.put("result", false);
		}
		
		return result;
	}
	
	@PostMapping("/lesson06/bookmark_delete")
	@ResponseBody
	public Map<String, String> bookmarkDelete(
			@RequestParam("id") String id) {
		
		int number = Integer.valueOf(id);
		
		bookmarkBO.deleteBookmark(number);
		
		Map<String, String> result = new HashMap<>();
		result.put("result", "success");
		
		return result;
	}
	
	
}
