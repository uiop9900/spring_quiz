package com.quiz.lesson06.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.quiz.lesson06.dao.BookMarkDAO;
import com.quiz.lesson06.model.Bookmark;

@Service
public class BookMarkBO {
	
	@Autowired
	private BookMarkDAO bookmarkDAO;
	
	public void addBookmark(String name, String url) {
		bookmarkDAO.insertBookmark(name, url);
	}
	
	public List<Bookmark> getBookmarkList() {
		return bookmarkDAO.selectBookmarkList();
	}
}
