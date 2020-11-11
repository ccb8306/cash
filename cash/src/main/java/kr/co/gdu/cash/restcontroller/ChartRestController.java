package kr.co.gdu.cash.restcontroller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

import kr.co.gdu.cash.restservice.ChartRestService;

@RestController
public class ChartRestController {
	@Autowired ChartRestService chartRestService;
	// 연도별 평균 수입
	@GetMapping("/admin/yearAvgRevenue")
	public List<Map<String, Object>> yearAvgRevenue(Model model) {
		return chartRestService.getYearAvgRevenue();
	}
	// 연도별 평균 수입
	@GetMapping("/admin/yearAvgExpenditure")
	public List<Map<String, Object>> yearAvgExpenditure(Model model) {
		return chartRestService.getYearAvgExpenditure();
	}
	// 연도별 평균 수익
	@GetMapping("/admin/yearAvgProfit")
	public List<Map<String, Object>> yearAvgProfit(Model model){
		return chartRestService.getYearAvgProfit();
	}
}
