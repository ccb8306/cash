package kr.co.gdu.cash.restservice;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.co.gdu.cash.restmapper.ChartRestMapper;
import kr.co.gdu.cash.vo.Category;

@Service
@Transactional
public class ChartRestService {
	@Autowired ChartRestMapper chartRestMapper; 
	// 카테고리 리스트
	public List<Category> getCategoryList(String cashbookKind){
		return chartRestMapper.selectCategoryList(cashbookKind);
	}
	
	// 연도별 카테고리별 수입
	public List<Map<String, Object>> getYearCategoryRevenue(String categoryName){
		return chartRestMapper.selectYearCategoryRevenue(categoryName);
	}
	
	// 연도별 카테고리별 지출
	public List<Map<String, Object>> getYearCategoryExpenditure(String categoryName){
		return chartRestMapper.selectYearCategoryExpenditure(categoryName);
	}
	
	// 연도별 최소 최대 수입
	public List<Map<String, Object>> getYearMinMaxRevenue(){
		return chartRestMapper.selectYearMinMaxRevenue();
	}
	// 연도별 최소 최대 지출
	public List<Map<String, Object>> getYearMinMaxExpenditure(){
		return chartRestMapper.selectYearMinMaxExpenditure();
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
	// 월별 카테고리별 수입
	public List<Map<String, Object>> getMonthCategoryRevenue(Map<String, Object> map){
		return chartRestMapper.selectMonthCategoryRevenue(map);
	}
	
	// 월별 카테고리별 지출
	public List<Map<String, Object>> getMonthCategoryExpenditure(Map<String, Object> map){
		return chartRestMapper.selectMonthCategoryExpenditure(map);
	}

	// 월별 최소 최대 수입
	public List<Map<String, Object>> getMonthMinMaxRevenue(int year){
		return chartRestMapper.selectMonthMinMaxRevenue(year);
	}
	// 월별 최소 최대 지출
	public List<Map<String, Object>> getMonthMinMaxExpenditure(int year){
		return chartRestMapper.selectMonthMinMaxExpenditure(year);
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
