package kr.co.gdu.cash.restservice;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.co.gdu.cash.restmapper.ChartRestMapper;

@Service
@Transactional
public class ChartRestService {
	@Autowired ChartRestMapper chartRestMapper; 
	
	// 연도별 평균 수입
	public List<Map<String, Object>> getYearAvgRevenue(){
		return chartRestMapper.selectYearAvgRevenue();
	}
	
	// 연도별 평균 지출
	public List<Map<String, Object>> getYearAvgExpenditure(){
		return chartRestMapper.selectYearAvgExpenditure();
	}
	
	// 연도별 평균 수익
	public List<Map<String, Object>> getYearAvgProfit(){
		return chartRestMapper.selectYearAvgProfit();
	}
	
	
	// 연도별 총 수입
	public List<Map<String, Object>> getYearTotalRevenue(){
		return chartRestMapper.selectYearTotalRevenue();
	}
	
	// 연도별 총 지출
	public List<Map<String, Object>> getYearTotalExpenditure(){
		return chartRestMapper.selectYearTotalExpenditure();
	}
	
	// 연도별 총 수익
	public List<Map<String, Object>> getYearTotalProfit(){
		return chartRestMapper.selectYearTotalProfit();
	}
	

	
	// 연도 가져오기
	public List<Integer> getYears(){
		return chartRestMapper.selectYears();
	}
	// 월별 평균 수입
	public List<Map<String, Object>> getMonthAvgRevenue(int year){
		return chartRestMapper.selectMonthAvgRevenue(year);
	}
	
	// 월별 평균 지출
	public List<Map<String, Object>> getMonthAvgExpenditure(int year){
		return chartRestMapper.selectMonthAvgExpenditure(year);
	}
	
	// 월별 평균 수익
	public List<Map<String, Object>> getMonthAvgProfit(int year){
		return chartRestMapper.selectMonthAvgProfit(year);
	}
	
	
	// 월별 총 수입
	public List<Map<String, Object>> getMonthTotalRevenue(int year){
		return chartRestMapper.selectMonthTotalRevenue(year);
	}
	
	// 월별 총 지출
	public List<Map<String, Object>> getMonthTotalExpenditure(int year){
		return chartRestMapper.selectMonthTotalExpenditure(year);
	}
	
	// 월별 총 수익
	public List<Map<String, Object>> getMonthTotalProfit(int year){
		return chartRestMapper.selectMonthTotalProfit(year);
	}
}
