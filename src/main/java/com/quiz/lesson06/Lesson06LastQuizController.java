package com.quiz.lesson06;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

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
	
	//예약목록화면 http://localhost/booking/reserve_list
	@RequestMapping("/booking/reserve_list")
	public String bookingList(Model model) {
		
		//select해서 내려주기
		List<Booking> bookingList = bookingBO.getBookingList();
		
		model.addAttribute("bookingList", bookingList);
		
		return "lesson06/booking_list";
	}
	
	//삭제버튼을 누르면 삭제하는 메소드
	@PostMapping("/booking/delete")
	@ResponseBody
	public Map<String,String> bookingDelete(
			@RequestParam("id") int id) {
		
		//db delete
		bookingBO.deleteBooking(id);
		
		Map<String, String> result = new HashMap<>();
		result.put("result", "success");
		
		return result;
	}
	
	//예약하기 화면 http://localhost/booking/reserve_view
	@RequestMapping("/booking/reserve_view")
	public String bookingReserveView() {
		return "lesson06/booking_reserve";
	}
	
	@PostMapping("/booking/reserve")
	@ResponseBody
	public Map<String, String> bookingReserve(
			@RequestParam("name") String name,
			@RequestParam("date") String date,
			@RequestParam("day") int day,
			@RequestParam("headcount") int headcount,
			@RequestParam("phoneNumber") String phoneNumber
			
			) {
		
		//db insert
		bookingBO.addBooking(name, date, day, headcount, phoneNumber);
		
		Map<String, String> insertResult = new HashMap<>();
		insertResult.put("result", "success");
		
		return insertResult;
	}
	
}
