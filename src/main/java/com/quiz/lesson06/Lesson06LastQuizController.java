package com.quiz.lesson06;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.quiz.lesson06.bo.BookingBO;
import com.quiz.lesson06.model.Booking;

@Controller
public class Lesson06LastQuizController {

	@Autowired
	private BookingBO bookingBO;
	
	//http://localhost/booking/main
	@RequestMapping("/booking/main")
	public String bookingMain() {
		return "lesson06/booking_main";
	}
	
	//예약목록화면
	@RequestMapping("/booking/reserve_list")
	public String bookingList(Model model) {
		
		//select해서 내려주기
		List<Booking> bookingList = bookingBO.getBookingList();
		
		model.addAttribute("bookingList", bookingList);
		
		return "lesson06/booking_list";
	}
}
