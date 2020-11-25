package kr.co.gdu.cash.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.co.gdu.cash.mapper.VisitorbookMapper;
import kr.co.gdu.cash.vo.Visitorbook;

@Service
@Transactional
public class VisitorbookService {
	@Autowired VisitorbookMapper visitorbookMapper;
	
	// 방명록 리스트 불러오기
	public List<Visitorbook> getVisitorbookListByPage(Map<String, Object> map){
		return visitorbookMapper.selectVisitorbookListByPage(map);
	}
	// 방명록 최대페이지 구하기
	public int getVisitorbookListEndPage(int rowPage) {
		int endPage = visitorbookMapper.selectVisitorbookListEndPage();

		System.out.println(rowPage);
		if(endPage % rowPage == 0) {
			endPage = (int)(endPage/rowPage);
		}else {
			endPage = (int)(endPage/rowPage) + 1;
			System.out.println("+1");
		}
		System.out.println(endPage);
		return endPage;
	}
	
	// 방명록 추가
	public int addVisitorbook(Visitorbook visitorbook) {
		return visitorbookMapper.insertVisitorbook(visitorbook);
	}
	// 방명록 삭제
	public int removeVisitorbook(int visitorbookId) {
		return visitorbookMapper.deleteVisitorbook(visitorbookId);
	}
}
