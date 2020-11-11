package kr.co.gdu.cash.service;

import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.co.gdu.cash.mapper.CashbookMapper;
import kr.co.gdu.cash.vo.Cashbook;

@Service
@Transactional
public class CashbookService {
	@Autowired private CashbookMapper cashbookMapper;
	
	// 해달 일의 캐쉬 리스트 가져오기
	public List<Cashbook> getCashListByDay(int currentYear, int currentMonth, int currentDay){
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("currentYear", currentYear);
		map.put("currentMonth", currentMonth);
		map.put("currentDay", currentDay);
		
		return cashbookMapper.selectCashListByDay(map);
	}
	
	// 해당 월의 총 수입,지출 액 가져오기
	public int getSumCashbookPriceByInOut(String cashbookKind, int currentYear, int currentMonth) {
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("cashbookKind", cashbookKind);
		map.put("currentYear", currentYear);
		map.put("currentMonth", currentMonth);
		
		int sum = cashbookMapper.selectSumCashbookPriceByInOut(map);
		return sum;
	}
	
	// 해당 월의 캐쉬 리스트 가져오기
	public List<Map<String, Object>> getCashListByMonth(int currentYear, int currentMonth){
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("currentYear", currentYear);
		map.put("currentMonth", currentMonth);
		
		return cashbookMapper.selectCashListByMonth(map);
	}
	
	// 캐쉬 내역 추가
	public int addCashbook(Cashbook cashbook) {
		return cashbookMapper.insertCashbook(cashbook);
	}
		
	// 캐쉬 내역 삭제
	public int removeCashbook(int cashbookId) {
		return cashbookMapper.deleteCashbook(cashbookId);
	}
	
	// 캐쉬 내역 한개 불러오기(상세보기)
	public Cashbook getCashbook(int cashbookId) {
		return cashbookMapper.selectCashbookOne(cashbookId);
	}
	
	// 캐쉬 내역 한개 수정
	public int modifyCashbook(Cashbook cashbook) {
		return cashbookMapper.updateCashbook(cashbook);
	}
	
	// 캐쉬리스트 
	public List<Cashbook> getCashbookListByPage(int currentPage, int rowPage){
		Map<String, Object> map = new HashMap<>();
		map.put("beginRow", (currentPage - 1) * rowPage);
		map.put("rowPage", rowPage);
		return cashbookMapper.selectCashbookListByPage(map);
	}
	public int getCashbookListEndPage(int rowPage) {
		int endPage = cashbookMapper.selectCashbookListEndPage();
		if(endPage%rowPage == 0) {
			return (int)(endPage/rowPage);
		}else {
			return (int)(endPage/rowPage) +1;
		}
	}
	
	// 캐쉬리스트 
	public List<Cashbook> getCashbookListAll(){
		return cashbookMapper.selectCashbookListAll();
	}
}

