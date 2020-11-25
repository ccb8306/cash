package kr.co.gdu.cash.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import kr.co.gdu.cash.vo.Visitorbook;

@Mapper
public interface VisitorbookMapper {
	// 방명록 리스트
	List<Visitorbook> selectVisitorbookListByPage(Map<String, Object> map);
	// 방명록 리스트 최대 페이지
	int selectVisitorbookListEndPage();
	// 방명록 추가
	int insertVisitorbook(Visitorbook visitorbook);
	// 방명록 삭제
	int deleteVisitorbook(int visitorbookId);
}
