package com.quiz.lesson03.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.quiz.lesson03.dao.RealEstateDAO;
import com.quiz.lesson03.model.realEstate;

@Service
public class RealEstateBO {
	
	@Autowired
	private RealEstateDAO realEstateDAO;
	
	public realEstate getRealEstateById(int id) {//Integer로 받으면 nullable, id로 메소드 하나를 리턴한다. -> 필수값이다. int
		return realEstateDAO.selectrealEstateById(id);
	}
	

//	@Autowired
//	private RealEstateDAO realEstateDAO2; -> 또 다시 선언안해도 된다. 같은 곳에서 가져올거면!
	//실제 rentPrice는 nullable이지만, 메소드만 보았을대 무조건 값을 받아서 반환할 것이기 때문에 int로 선언한다.
	public List<realEstate> getRealEstateListByRentPrice(int rentPrice) { //by뒤가 조건임, 관례적으로 이름을 짓는다.
		return realEstateDAO.seletrealEstateListByRentPrice(rentPrice);
	}
	
	
	public List<realEstate> getRealEstateListByAreaPrice(int area, int price) {
		return realEstateDAO.selectEstateListByAreaPrice(area, price); //자동완성시 input값이 잘 못 채워질수있기때문에 꼭 본인이 쓰면서 확인한다.
	}
	
	public int addRealEstate(realEstate realestate) { //성공한 열의 개수 반환
		return realEstateDAO.insertRealEstate(realestate);
	}
	
}
