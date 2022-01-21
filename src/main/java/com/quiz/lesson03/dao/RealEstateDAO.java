package com.quiz.lesson03.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.quiz.lesson03.model.realEstate;

@Repository
public interface RealEstateDAO {
	
	public realEstate selectrealEstateById(@Param("id") int id); //파라미터 하나일때는 굳이 param안해줘도 된다. -> 파라가 하나면 이름을 인식안하고 당연히 그거겠지 생각하고 Param선언안해도 된다.
	
	public List<realEstate> seletrealEstateListByRentPrice(@Param("rentPrice") int rentPrice); 
	
	public List<realEstate> selectEstateListByAreaPrice(@Param("area") int area, @Param("price")int price); 
	//@Param 어노테이션은 파라미터들을 하나의 맵으로 만든다.
	//@Param("key") value

	public int insertRealEstate(realEstate realestate); 
	
	
	public int insertRealEstateAsField(
			@Param("realtorId") int realtorId, 
			@Param("address") String address, 
			@Param("area") int area, 
			@Param("type") String type, 
			@Param("price") int price, 
			@Param("rentPrice") Integer rentPrice);
	
	public int updateRealEstateById(
			@Param("id") int id, 
			@Param("type") String type, 
			@Param("price") int price);

	public int deleteRealEstateById(int id); 
	
}
