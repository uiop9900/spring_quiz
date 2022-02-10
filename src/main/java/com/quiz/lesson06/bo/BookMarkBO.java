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
	
	public Bookmark getBookmarkByUrl(String url) { //단, bookmark의 리스트가 다 다른값을 가진다. (중복된 url은 없다)
		return bookmarkDAO.getBookmarkByUrl(url);
	}
	
	public void deleteBookmark(int id) {
		bookmarkDAO.deleteBookmark(id);
	}
	
}
