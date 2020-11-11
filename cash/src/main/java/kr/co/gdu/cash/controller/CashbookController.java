package kr.co.gdu.cash.controller;

import java.util.Calendar;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
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
	int type1 = 2; // 가계부
	int type2 = 3; // 리스트
	
	// 캐쉬 내역 추가
	@PostMapping("/admin/addCashbook")
	public String addCashbook(Cashbook cashbook,
			@RequestParam(name = "currentYear", required = true) int currentYear,
			@RequestParam(name = "currentMonth", required = true) int currentMonth,
			@RequestParam(name = "currentDay", required = true) int currentDay) {
		
		cashbookService.addCashbook(cashbook);
		return "redirect:/admin/cashbookByDay/now/" + currentYear + "/" + currentMonth + "/" + currentDay;
	}
	
	// 캐쉬 내역 삭제
	@GetMapping("/admin/removeCashbook/{cashbookId}/{currentYear}/{currentMonth}/{currentDay}")
	public String removeCashbook(
			@PathVariable(name = "cashbookId") int cashbookId,
			@PathVariable(name = "currentYear", required = true) int currentYear,
			@PathVariable(name = "currentMonth", required = true) int currentMonth,
			@PathVariable(name = "currentDay", required = true) int currentDay) {
		
		cashbookService.removeCashbook(cashbookId);
		return "redirect:/admin/cashbookByDay/now/" + currentYear + "/" + currentMonth + "/" + currentDay;
	}
	
	// 해당 월의 캐쉬
	@GetMapping(value="/admin/cashbookByMonth/{target}/{currentYear}/{currentMonth}")
	public String cashbookByMonth(Model model,
			@PathVariable(name = "target") String target,
			@PathVariable(name = "currentYear") int currentYear,
			@PathVariable(name = "currentMonth") int currentMonth) { 
		
		// 달력 생성
		Calendar currentDay = Calendar.getInstance(); // 2020년 11월 2일	
		
		// currentYear 넘어오고, currentMonth도 넘어면
	   if (currentYear != -1 && currentMonth != -1) {	
			currentDay.set(Calendar.YEAR, currentYear);
			currentDay.set(Calendar.MONTH , currentMonth -1);
			// 이전 선택 시
			if(target.equals("pre")) {
				currentDay.add(Calendar.MONTH, -1);
			// 다음 선택 시
			}else if (target.equals("next")) {
				currentDay.add(Calendar.MONTH, +1);		
			}
		}	

		currentDay.set(Calendar.DATE, 1); // 2020년 11월 1일
		
		int lastDay = currentDay.getActualMaximum(Calendar.DATE);
		int firstDayOfWeek = currentDay.get(Calendar.DAY_OF_WEEK);
		
		// 해당 달의 총 수입 , 총 지출
		int sumIn = cashbookService.getSumCashbookPriceByInOut("수입", currentDay.get(Calendar.YEAR), currentDay.get(Calendar.MONTH)+1);
		int sumOut = cashbookService.getSumCashbookPriceByInOut("지출", currentDay.get(Calendar.YEAR), currentDay.get(Calendar.MONTH)+1);
		
		// 해당 달의 모든 cashbook 내역 
		List<Map<String, Object>> cashList = cashbookService.getCashListByMonth(currentDay.get(Calendar.YEAR), currentDay.get(Calendar.MONTH)+1);
		
		// 뷰 연결
		// 달력
		model.addAttribute("currentYear", currentDay.get(Calendar.YEAR)); 
		model.addAttribute("currentMonth", currentDay.get(Calendar.MONTH) +1); 
		model.addAttribute("lastDay", lastDay);
		model.addAttribute("firstDayOfWeek", firstDayOfWeek);
		
		// 총 수입,지출
		model.addAttribute("sumIn", sumIn);
		model.addAttribute("sumOut", sumOut);
		
		// cashList
		model.addAttribute("cashList", cashList);  
		
		model.addAttribute("type", type1);
		return "cashbookByMonth";
	}
	
	// 해당 일의 캐쉬
	@GetMapping(value="/admin/cashbookByDay/{target}/{currentYear}/{currentMonth}/{currentDay}")
	public String cashbookByDay(Model model,
			@PathVariable(name = "target") String target,
			@PathVariable(name = "currentYear", required = true) int currentYear,
			@PathVariable(name = "currentMonth", required = true) int currentMonth,
			@PathVariable(name = "currentDay", required = true) int currentDay){
		
		// 날짜 계산
		Calendar targetDay = Calendar.getInstance();
		targetDay.set(Calendar.YEAR, currentYear);	
		targetDay.set(Calendar.MONTH, currentMonth - 1);	
		targetDay.set(Calendar.DATE, currentDay);
			
		// 이전 선택 시
		if(target.equals("pre")) {
			targetDay.add(Calendar.DATE, -1);
		// 다음 선택 시
		}else if (target.equals("next")) {
			targetDay.add(Calendar.DATE, +1);		
		}
		
		// 캐쉬리스트
		List<Cashbook> cashbookList = cashbookService.getCashListByDay(targetDay.get(Calendar.YEAR), targetDay.get(Calendar.MONTH) +1, targetDay.get(Calendar.DATE));
		// 카테고리 목록 - cashList 추가 시 사용
		List<Category> categoryList = CategoryService.getCategoryList();
		
		// 뷰 연결
		model.addAttribute("currentYear", targetDay.get(Calendar.YEAR)); 
		model.addAttribute("currentMonth", targetDay.get(Calendar.MONTH) +1); 
		model.addAttribute("currentDay", targetDay.get(Calendar.DATE));

		model.addAttribute("cashbookList", cashbookList);
		model.addAttribute("categoryList", categoryList);
		
		model.addAttribute("type", type1);
		return "cashbookByDay";
	}
	
	// 캐쉬내역 수정 폼
	@GetMapping("/admin/modifyCashbook/{cashbookId}/{currentYear}/{currentMonth}/{currentDay}")
	public String modifyCashbook(Model model,
			@PathVariable(name = "cashbookId", required = true) int cashbookId,
			@PathVariable(name = "currentYear", required = true) int currentYear,
			@PathVariable(name = "currentMonth", required = true) int currentMonth,
			@PathVariable(name = "currentDay", required = true) int currentDay) {
		
		Cashbook cashbook = cashbookService.getCashbook(cashbookId);
		
		List<Category> categoryList = CategoryService.getCategoryList();
		
		model.addAttribute("categoryList", categoryList);
		model.addAttribute("cashbook", cashbook);
		
		model.addAttribute("currentYear", currentYear); 
		model.addAttribute("currentMonth", currentMonth); 
		model.addAttribute("currentDay", currentDay);
		
		model.addAttribute("type", type1);
		return "modifyCashbook";
	}
	
	// 캐쉬내역 수정 액션
	@PostMapping("/admin/modifyCashbook")
	public String modifyCashbook(Cashbook cashbook,
			@RequestParam(name = "currentYear", required = true) int currentYear,
			@RequestParam(name = "currentMonth", required = true) int currentMonth,
			@RequestParam(name = "currentDay", required = true) int currentDay) {
		
		cashbookService.modifyCashbook(cashbook);
		return "redirect:/admin/cashbookByDay/now/" + currentYear + "/" + currentMonth + "/" + currentDay;
	}
	
	// 캐쉬 리스트
	@GetMapping("/admin/cashbookList/{currentPage}")
	public String cashbookList(Model model,
			@PathVariable(name = "currentPage") int currentPage) {
		int rowPage = 8;
		int endPage = cashbookService.getCashbookListEndPage(rowPage);
		
		List<Cashbook> cashbookList = cashbookService.getCashbookListByPage(currentPage, rowPage);
		
		model.addAttribute("currentPage",currentPage);
		model.addAttribute("endPage",endPage);
		model.addAttribute("cashbookList",cashbookList);
		model.addAttribute("type", type2);
		return "cashbookList";
	}
}
