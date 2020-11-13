package kr.co.gdu.cash.restmapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ChartRestMapper {
	// 연도별 평균 수입
	List<Map<String, Object>> selectYearAvgRevenue();
	// 연도별 평균 지출
	List<Map<String, Object>> selectYearAvgExpenditure();
	// 연도별 평균 수익(수입 - 지출)
	List<Map<String, Object>> selectYearAvgProfit();
	
	// 연도별 총 수입
	List<Map<String, Object>> selectYearTotalRevenue();
	// 연도별 총 지출
	List<Map<String, Object>> selectYearTotalExpenditure();
	// 연도별 총 수익(수입 - 지출)
	List<Map<String, Object>> selectYearTotalProfit();
}
