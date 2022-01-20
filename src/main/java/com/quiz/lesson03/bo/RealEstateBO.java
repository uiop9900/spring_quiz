package com.quiz.lesson03.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.quiz.lesson03.dao.RealEstateDAO;
import com.quiz.lesson03.model.realEstate;

@Service
public class RealEstateBO {
	
	@Autowired
	private RealEstateDAO realEstateDAO;
	
	public realEstate getRealEstate(int id) {
		return realEstateDAO.selectrealEstate(id);
	}
	
	
	@Autowired
	private RealEstateDAO realEstateDAO2;
	private realEstate getRealEstate(Integer rentPrice) {
		return realEstateDAO2.selectrealEstate(rentPrice);
	}
}
