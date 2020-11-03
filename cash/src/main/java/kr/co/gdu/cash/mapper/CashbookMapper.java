package kr.co.gdu.cash.mapper;

import java.util.*;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface CashbookMapper {
	List<Map<String, Object>> selectCashInOutList();
	
	int selectSumCashbookPriceByInOut(Map<String, Object> map);
}
