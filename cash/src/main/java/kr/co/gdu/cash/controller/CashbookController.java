package kr.co.gdu.cash.controller;

import java.util.Calendar;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.gdu.cash.service.CashbookService;
import kr.co.gdu.cash.service.CategoryService;
import kr.co.gdu.cash.vo.Cashbook;
import kr.co.gdu.cash.vo.Category;

@Controller
public class CashbookController {	
	@Autowired private CashbookService cashbookService;
	@Autowired private CategoryService CategoryService;
	
	@PostMapping("/addCashbook")
	public String addCashbook(Cashbook cashbook) {
		
		cashbookService.addCashbook(cashbook);
		return "redirect:/cashbookByMonth";
	}
	
	@GetMapping(value="/cashbookByMonth")
	public String cashbookByMonth(Model model,
			@RequestParam(name = "currentYear", defaultValue = "-1") int currentYear,
			@RequestParam(name = "currentMonth", defaultValue = "-1") int currentMonth) { 
		
		// 달력 생성
		Calendar currentDay = Calendar.getInstance(); // 2020년 11월 2일
		// currentYear 넘어오고, currentMonth도 넘어면
		if(currentYear != -1 && currentMonth != -1) {
			if(currentMonth == 0) {
				currentYear -= 1;
				currentMonth = 12;
			}
			if(currentMonth == 13) {
				currentYear += 1;
				currentMonth = 1;
			}
			currentDay.set(Calendar.YEAR, currentYear);
			currentDay.set(Calendar.MONTH, currentMonth-1);
		}
		currentDay.set(Calendar.DATE, 1); // 2020년 11월 1일
		
		currentYear = currentDay.get(Calendar.YEAR);
		currentMonth = currentDay.get(Calendar.MONTH) + 1;
		int lastDay = currentDay.getActualMaximum(Calendar.DATE);
		int firstDayOfWeek = currentDay.get(Calendar.DAY_OF_WEEK);
		
		// 해당 달의 총 수입 , 총 지출
		int sumIn = cashbookService.getSumCashbookPriceByInOut("수입", currentYear, currentMonth);
		int sumOut = cashbookService.getSumCashbookPriceByInOut("지출", currentYear, currentMonth);
		
		// 해당 달의 모든 cashbook 내역 
		List<Map<String, Object>> cashList = cashbookService.getCashListByMonth(currentYear, currentMonth);
		
		// 뷰 연결
		// 달력
		model.addAttribute("currentYear", currentYear); 
		model.addAttribute("currentMonth", currentMonth); 
		model.addAttribute("lastDay", lastDay);
		model.addAttribute("firstDayOfWeek", firstDayOfWeek);
		
		// 총 수입,지출
		model.addAttribute("sumIn", sumIn);
		model.addAttribute("sumOut", sumOut);
		
		// cashList
		model.addAttribute("cashList", cashList);  
		
		// 페이지 타입 - 1 = home, 2 = cash, 3 = notice
		model.addAttribute("type", 2);
		return "cashbookByMonth";
	}
	
	@GetMapping(value="/cashbookByDay")
	public String cashbookByDay(Model model,
			@RequestParam(name = "currentYear", required = true) int currentYear,
			@RequestParam(name = "currentMonth", required = true) int currentMonth,
			@RequestParam(name = "currentDay", required = true) int currentDay){
		
		// 해당 일의 cashbookList
		List<Cashbook> cashbookList = cashbookService.getCashListByDay(currentYear, currentMonth, currentDay);
		// 카테고리 목록 - cashList 추가 시 사용
		List<Category> categoryList = CategoryService.getCategoryList();
		
		
		model.addAttribute("cashbookList", cashbookList);
		model.addAttribute("currentYear", currentYear); 
		model.addAttribute("currentMonth", currentMonth); 
		model.addAttribute("currentDay", currentDay);
		
		model.addAttribute("categoryList", categoryList);
		
		model.addAttribute("type", 2);
		return "cashbookByDay";
	}
}