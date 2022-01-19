package com.quiz.lesson03.dao;

import org.springframework.stereotype.Repository;

import com.quiz.lesson03.model.realEstate;

@Repository
public interface RealEstateDAO {
	
	public realEstate selectrealEstate(int id);
}
