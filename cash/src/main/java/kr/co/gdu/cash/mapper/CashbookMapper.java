package kr.co.gdu.cash.mapper;

import java.util.*;

import org.apache.ibatis.annotations.Mapper;

import kr.co.gdu.cash.vo.Cashbook;

@Mapper
public interface CashbookMapper {
	List<Map<String, Object>> selectCashInOutList();
	int selectSumCashbookPriceByInOut(Map<String, Object> map);
	List<Map<String, Object>> selectCashListByMonth(Map<String, Object> map);
	List<Cashbook> selectCashListByDay(Map<String, Object> map);
	
	int insertCashbook(Cashbook cashbook);
	int deleteCashbook(int cashbookId);
	
	Cashbook selectCashbookOne(int cashbookId);
	int updateCashbook(Cashbook cashbook);
	
	// 전체
	List<Cashbook> selectCashbookListByPage(Map<String, Object> map);
	int selectCashbookListEndPage();
	
	List<Cashbook> selectCashbookListAll();
}
