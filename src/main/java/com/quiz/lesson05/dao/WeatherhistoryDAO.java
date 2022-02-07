package com.quiz.lesson05.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.quiz.lesson05.model.Weatherhistory;

@Repository
public interface WeatherhistoryDAO {
	
	public List<Weatherhistory> selectweatherhistoryList();
	
	public void insertWeatherhistory(
			@Param("date") String date, 
			@Param("weather") String weather, 
			@Param("microDust") String microDust, 
			@Param("temperatures") double temperatures, 
			@Param("precipitation") double precipitation, 
			@Param("windSpeed") double windSpeed);
}
