package kr.co.gdu.cash.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import kr.co.gdu.cash.vo.Notice;

@Mapper
public interface NoticeMapper {
	// index화면의 최근 5개공지를 보여주는 메서드
	List<Notice> selectLatestNoiceList(); 
	// 공지사항 목록
	List<Notice> selectNoiceList(Map<String, Integer> map); 
	// 공지사항 개수
	int selectNoticeCount();
	
	// 공지사항 추가
	int insertNotice(Notice notice);
	// 공지사항 상세보기
	Notice selectNoticeOne(int noticeId);
	
	// 공지사항 삭제
	int deleteNotice(int noticeId);
	
	// 공지사항 수정
	int updateNotice(Notice notice);
}
