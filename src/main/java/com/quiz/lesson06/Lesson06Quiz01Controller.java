package com.quiz.lesson06;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

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
	
	@PostMapping("/lesson06/bookmark_add")
	public String bookmarkAdd(
			@RequestParam("name") String name,
			@RequestParam("url") String url,
			Model model
			) {
		//insert DB
		bookmarkBO.addBookmark(name, url);
		
		//select
		List<Bookmark> bookmark = bookmarkBO.getBookmarkList();
				
		model.addAttribute("bookmark", bookmark);
				
		return "lesson06/bookmarkAdd_view";
	}
		

}
