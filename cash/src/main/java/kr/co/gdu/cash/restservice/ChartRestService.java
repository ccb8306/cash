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
}
