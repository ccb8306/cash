package kr.co.gdu.cash.restcontroller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

import kr.co.gdu.cash.restservice.ChartRestService;
import kr.co.gdu.cash.vo.Category;

@RestController
public class ChartRestController {
	@Autowired ChartRestService chartRestService;
	// 카테고리 리스트
	@GetMapping("/admin/categoryList/{cashbookKind}")
	public List<Category> categoryList(@PathVariable(name="cashbookKind") String cashbookKind){
		return chartRestService.getCategoryList(cashbookKind);
	}
	
	// 연도별 카테고리별 수입
	@GetMapping("/admin/yearCategoryRevenue/{categoryName}")
	public List<Map<String, Object>> yearCategoryRevenue(@PathVariable(name="categoryName") String categoryName) {
		return chartRestService.getYearCategoryRevenue(categoryName);
	}
	// 연도별 카테고리별 지출
	@GetMapping("/admin/yearCategoryExpenditure/{categoryName}")
	public List<Map<String, Object>> yearCategoryExpenditure(@PathVariable(name="categoryName") String categoryName) {
		return chartRestService.getYearCategoryExpenditure(categoryName);
	}
	// 연도별 최소 최대 수입
	@GetMapping("/admin/yearMinMaxRevenue")
	public List<Map<String, Object>> yearMinMaxRevenue(){
		return chartRestService.getYearMinMaxRevenue();
	}
	// 연도별 최소 최대 지출
	@GetMapping("/admin/yearMinMaxExpenditure")
	public List<Map<String, Object>> yearMinMaxExpenditure(){
		return chartRestService.getYearMinMaxExpenditure();
	}
	// 연도별 총 수입
	@GetMapping("/admin/yearTotalRevenue")
	public List<Map<String, Object>> yearTotalRevenue() {
		return chartRestService.getYearTotalRevenue();
	}
	// 연도별 총 지출
	@GetMapping("/admin/yearTotalExpenditure")
	public List<Map<String, Object>> yearTotalExpenditure() {
		return chartRestService.getYearTotalExpenditure();
	}
	// 연도별 총 수익(수입-지출)
	@GetMapping("/admin/yearTotalProfit")
	public List<Map<String, Object>> yearTotalProfit(){
		return chartRestService.getYearTotalProfit();
	}
	
	// 연도 가져오기
	@GetMapping("/admin/yearList")
	public List<Integer> yearList(){
		return chartRestService.getYears();
	}
	// 월별 카테고리별 수입
	@GetMapping("/admin/monthCategoryRevenue/{year}/{categoryName}")
	public List<Map<String, Object>> monthCategoryRevenue(
			@PathVariable(name="year") int year,
			@PathVariable(name="categoryName") String categoryName) {
		Map<String, Object> map = new HashMap<>();
		map.put("year", year);
		map.put("categoryName", categoryName);
		
		System.out.println(year + " : " + categoryName);
		return chartRestService.getMonthCategoryRevenue(map);
	}
	// 월별 카테고리별 지출
	@GetMapping("/admin/monthCategoryExpenditure/{year}/{categoryName}")
	public List<Map<String, Object>> monthCategoryExpenditure(
			@PathVariable(name="year") int year,
			@PathVariable(name="categoryName") String categoryName) {
		Map<String, Object> map = new HashMap<>();
		map.put("year", year);
		map.put("categoryName", categoryName);
		
		System.out.println(year + " : " + categoryName);
		return chartRestService.getMonthCategoryExpenditure(map);
	}
	// 연도별 최소 최대 수입
	@GetMapping("/admin/monthMinMaxRevenue/{year}")
	public List<Map<String, Object>> monthMinMaxRevenue(
			@PathVariable(name="year") int year){
		return chartRestService.getMonthMinMaxRevenue(year);
	}
	// 연도별 최소 최대 지출
	@GetMapping("/admin/monthMinMaxExpenditure/{year}")
	public List<Map<String, Object>> monthMinMaxExpenditure(
			@PathVariable(name="year") int year){
		return chartRestService.getMonthMinMaxExpenditure(year);
	}
	// 월별 총 수입
	@GetMapping("/admin/monthTotalRevenue/{year}")
	public List<Map<String, Object>> monthTotalRevenue(@PathVariable(name="year") int year) {
		return chartRestService.getMonthTotalRevenue(year);
	}
	// 월별 총 지출
	@GetMapping("/admin/monthTotalExpenditure/{year}")
	public List<Map<String, Object>> monthTotalExpenditure(@PathVariable(name="year") int year) {
		return chartRestService.getMonthTotalExpenditure(year);
	}
	// 월별 총 수익(수입-지출)
	@GetMapping("/admin/monthTotalProfit/{year}")
	public List<Map<String, Object>> monthTotalProfit(@PathVariable(name="year") int year){
		return chartRestService.getMonthTotalProfit(year);
	}
	
	
}
