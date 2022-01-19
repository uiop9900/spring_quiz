package com.quiz.lesson02.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.quiz.lesson02.dao.StoreDAO;
import com.quiz.lesson02.model.Store;

@Service
public class StoreBO {
	
	@Autowired
	private StoreDAO storeDAO; //DAO를 부른다. : 필드객체를 선언
	
	public List<Store> getStoreList(){ //관례적으로 get으로 메소드 짓는다.
		return storeDAO.selectStoreList(); //DAO에 있던 interface
	}
}
