package kr.co.gdu.cash.service;

import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.co.gdu.cash.mapper.*;
import kr.co.gdu.cash.vo.*;

@Service
@Transactional
public class IndexService {
	@Autowired private CashbookMapper cashbookMapper;
	
	public List<Map<String, Object>> getInOutList() {
		List<Map<String,Object>> inOutList = cashbookMapper.selectCashInOutList();
		return inOutList;
	}
}
