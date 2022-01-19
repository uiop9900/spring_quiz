package com.quiz.lesson02.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.quiz.lesson02.model.Store;

@Repository
public interface StoreDAO {
	
	public List<Store> selectStoreList();//여기서부터는 쿼리 -> select로 지어준다. 여러개가져올때 List, 아니면 안 붙임
}
