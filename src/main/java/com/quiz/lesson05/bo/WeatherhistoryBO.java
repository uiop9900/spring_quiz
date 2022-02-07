package com.quiz.lesson05.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.quiz.lesson05.dao.WeatherhistoryDAO;
import com.quiz.lesson05.model.Weatherhistory;

@Service
public class WeatherhistoryBO {
	
	@Autowired
	private WeatherhistoryDAO weatherhistoryDAO;//이름 길어도 관례적으로 다 써준다. 함부로 축약 X
	
	public List<Weatherhistory> getweatherhistoryList() { //list이면 뒤에 list로 붙여주기
		return weatherhistoryDAO.selectweatherhistoryList();
	}
	
	public void addWeatherhistory(String date, String weather, String microDust, double temperatures, double precipitation, double windSpeed) {
		weatherhistoryDAO.insertWeatherhistory(date, weather, microDust, temperatures, precipitation, windSpeed);
	}
	
}
