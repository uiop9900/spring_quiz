package com.quiz.lesson03.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.quiz.lesson03.model.realEstate;

@Repository
public interface RealEstateDAO {
	
	public realEstate selectrealEstate(@Param("id") int id);
	
	
	public realEstate seletrealEstate(@Param("rentPrice") Integer rentPrice);
}
