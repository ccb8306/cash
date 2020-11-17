package kr.co.gdu.cash.restcontroller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

import kr.co.gdu.cash.restservice.ChartRestService;

@RestController
public class ChartRestController {
	@Autowired ChartRestService chartRestService;
	// 연도별 평균 수입
	@GetMapping("/admin/yearAvgRevenue")
	public List<Map<String, Object>> yearAvgRevenue() {
		return chartRestService.getYearAvgRevenue();
	}
	// 연도별 평균 지출
	@GetMapping("/admin/yearAvgExpenditure")
	public List<Map<String, Object>> yearAvgExpenditure() {
		return chartRestService.getYearAvgExpenditure();
	}
	// 연도별 평균 수익(수입-지출)
	@GetMapping("/admin/yearAvgProfit")
	public List<Map<String, Object>> yearAvgProfit(){
		return chartRestService.getYearAvgProfit();
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
	// 월별 평균 수입
	@GetMapping("/admin/monthAvgRevenue/{year}")
	public List<Map<String, Object>> monthAvgRevenue(@PathVariable(name="year") int year) {
		return chartRestService.getMonthAvgRevenue(year);
	}
	// 월별 평균 지출
	@GetMapping("/admin/monthAvgExpenditure/{year}")
	public List<Map<String, Object>> monthAvgExpenditure(@PathVariable(name="year") int year) {
		return chartRestService.getMonthAvgExpenditure(year);
	}
	// 월별 평균 수익(수입-지출)
	@GetMapping("/admin/monthAvgProfit/{year}")
	public List<Map<String, Object>> monthAvgProfit(@PathVariable(name="year") int year){
		return chartRestService.getMonthAvgProfit(year);
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
