package kr.co.gdu.cash.restmapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import kr.co.gdu.cash.vo.Category;

@Mapper
public interface ChartRestMapper {
	// 카테고리 리스트 가져오기
	List<Category> selectCategoryList(String cashbookKind);
	
	// 연도별 카테고리별 수입
	List<Map<String, Object>> selectYearCategoryRevenue(String categoryName);
	// 연도별 카테고리별 지출
	List<Map<String, Object>> selectYearCategoryExpenditure(String categoryName);
	// 연도별 최소 최대 수입
	List<Map<String, Object>> selectYearMinMaxRevenue();
	// 연도별 최소 최대 지출
	List<Map<String, Object>> selectYearMinMaxExpenditure();
	
	// 연도별 총 수입
	List<Map<String, Object>> selectYearTotalRevenue();
	// 연도별 총 지출
	List<Map<String, Object>> selectYearTotalExpenditure();
	// 연도별 총 수익(수입 - 지출)
	List<Map<String, Object>> selectYearTotalProfit();
	

	// 연도 가져오기
	List<Integer> selectYears();
	// 월별 카테고리별 수입
	List<Map<String, Object>> selectMonthCategoryRevenue(Map<String, Object> map);
	// 월별 카테고리별 지출
	List<Map<String, Object>> selectMonthCategoryExpenditure(Map<String, Object> map);
	// 월별 최소 최대 수입
	List<Map<String, Object>> selectMonthMinMaxRevenue(int year);
	// 월별 최소 최대 지출
	List<Map<String, Object>> selectMonthMinMaxExpenditure(int year);
	
	// 월별 총 수입
	List<Map<String, Object>> selectMonthTotalRevenue(int year);
	// 월별 총 지출
	List<Map<String, Object>> selectMonthTotalExpenditure(int year);
	// 월별 총 수익(수입 - 지출)
	List<Map<String, Object>> selectMonthTotalProfit(int year);
}
