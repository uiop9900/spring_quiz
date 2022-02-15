package com.quiz.lesson06;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
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
	
	//main화면(3번) http://localhost/booking/main
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
		//ajax를 통해 받으면 @ResponseBody이기에 model사용할수없음, 그냥 data(String)받는것임
		// 뷰로 내릴때만 model사용가능하다.
	}
	
	//삭제버튼을 누르면 삭제하는 메소드 - ajax호출
	@DeleteMapping("/booking/delete") //type: "delete" 일때 mapping으로 이렇게 한다.
	@ResponseBody
	public Map<String,String> bookingDelete(
			@RequestParam("id") int id) {
		
		//db delete - void로 해도 되지만 int로 받아서 삭제를 성공했는지 알아본다.
		int count =bookingBO.deleteBookingById(id);
		
		Map<String, String> result = new HashMap<>();
		result.put("result", "success");
		if (count < 1) { //제대로 삭제되지않음
			result.put("result", "fail");
		}
		
		return result;
	}
	
	//예약하기 화면 http://localhost/booking/reserve_view
	@RequestMapping("/booking/reserve_view")
	public String bookingReserveView() {
		return "lesson06/booking_reserve";
	}
	
	// 예약하기 추가 - ajax
	@PostMapping("/booking/reserve")
	@ResponseBody
	public Map<String, String> bookingReserve(
			@RequestParam("name") String name,
			@RequestParam("date") String date,//String으로 넘어온다. 아니면 @Datetype이라는 걸로 명시해서 Date객체로 받을수도 있다. 셀렉트 할때는 Date로 하고 받을때는 String한다.
			@RequestParam("day") int day,
			@RequestParam("headcount") int headcount,
			@RequestParam("phoneNumber") String phoneNumber
			
			) {//state컬럼은 받지는 않지만 꼭 넣어줘야 한다 -> 대기중으로 넣는다. ->xml에서 해결한다.(너무나 고정값이라 그냥 xml에서 넣는다)
		
		//db insert
		int count = bookingBO.addBooking(name, date, day, headcount, phoneNumber);
		
		Map<String, String> insertResult = new HashMap<>();
		insertResult.put("result", "success"); //오픈 API를 한번 찾아보기. json이 어떻게 정의되어있는지 봐본다.
		insertResult.put("code", "1"); //오픈 API를 한번 찾아보기. json이 어떻게 정의되어있는지 봐본다.
		if (count < 1) {
			insertResult.put("result", "fail"); 
		}
		
		return insertResult;
	}
	
	@PostMapping("/booking/check_reserve")
	@ResponseBody
	public Map<String, Object> checkReserve(
			@RequestParam("name") String name,
			@RequestParam("phoneNumber") String phoneNumber){
		
		//db select by name, phoneNumber - input과 output이 뭔지 항상 끊어서 생각해야한다.
		
		Booking booking = bookingBO.getBookingByNameAndPhoneNumber(name, phoneNumber);
		
		//결과 map -> json(String)
		Map<String, Object> result = new HashMap<>();
		// 성공 시
		// {"result": "sucess", 	booking 그 자체를 통으로 담아서 넘긴다.
		// "code":"1" 				-> 어떠한 형태로 json을 만들지는 개발자 마음대로이다.
		// {"name":"이지아", "phoneNumber":"010-9973-5424"}}
		if (booking != null) {
			result.put("result", "success");
			result.put("code", 1);
			result.put("booking", booking);
		} else {
			// 실패 시
			// {"result":"fail", "code":500} 
			result.put("result", "fail");
			result.put("code", 500);
		}
		
		return result;
	}
	
}
