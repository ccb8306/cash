package kr.co.gdu.cash.service;

import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.co.gdu.cash.mapper.CashbookMapper;

@Service
@Transactional
public class CashbookService {
	@Autowired private CashbookMapper cashbookMapper;
	
	
	public int getSumCashbookPriceByInOut(String cashbookKind, int currentYear, int currentMonth) {
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("cashbookKind", cashbookKind);
		map.put("year", currentYear);
		map.put("month", currentMonth);
		
		int sum = cashbookMapper.selectSumCashbookPriceByInOut(map);
		return sum;
	}
}
