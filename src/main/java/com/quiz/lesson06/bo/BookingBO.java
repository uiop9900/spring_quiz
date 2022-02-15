package com.quiz.lesson06.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.quiz.lesson06.dao.BookingDAO;
import com.quiz.lesson06.model.Booking;

@Service
public class BookingBO {
	
	@Autowired
	private BookingDAO bookingDAO;
	
	public List<Booking> getBookingList() {
		return bookingDAO.selectBookingList();
	}
	
	public int deleteBookingById(int id) {
		return bookingDAO.deleteBookingById(id);
	}
	
	public int addBooking(String name, String date, int day, int headcount, String phoneNumber) {
		return bookingDAO.insertBooking(name, date, day, headcount, phoneNumber);
	}
	
	// 중복되는 data가 있을수있어서 list로 가지고 오는게 좋다. -> 이 풀이에서는 중복data가 없다는 걸 가정으로 일단 하나만 가지고 오는걸로!
	public Booking getBookingByNameAndPhoneNumber(String name, String phoneNumber) { //메소드명 길어도 된다.
		//가공로직은 여기서, List<booking> -> list로 리턴,   input은 list지만 return은 하나의 booking객체만 넘긴다.
		List<Booking> bookingList =  bookingDAO.selectBookingByNameAndPhoneNumber(name, phoneNumber);
		Booking booking = null;
		
		//마지막꺼 하나만 꺼내서
		  if (bookingList.isEmpty() == false) { //데이터가 있을때, 비워져 있으면 오류난다. -> 비워지면 []이렇게 반환, null값이 아니라 비워진 값이 반환된다. -> empty를 사용해야한다.
			  booking = bookingList.get(bookingList.size() - 1); //마지막 인덱스
		  }
		 
		//위에서 booking을 null로 선언했기때문에 data가 없으면 booking이 null로 반환된다. -> Controller - jsp에서 null로 값을 검사할수있다.
		return booking;
	}
}
