package kr.co.gdu.cash.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.co.gdu.cash.mapper.NoticeMapper;
import kr.co.gdu.cash.vo.Notice;

@Service
@Transactional
public class NoticeService {
	@Autowired private NoticeMapper noticeMapper;
	
	// 공지사항 최신 5개
	public List<Notice> getLatestNoticeList(){
		return noticeMapper.selectLatestNoiceList();
	}
	
	// 공지사항 전체 리스트
	public List<Notice> getNoticeList(Map<String, Integer> map){
		return noticeMapper.selectNoiceList(map);
	}
	
	// 공지사항 마지막 페이지 구하기
	public int getEndPage(int rowPage) {
		int endPage = noticeMapper.selectNoticeCount();
		if(endPage%rowPage == 0) {
			return (int)(endPage/rowPage);
		}else {
			return (int)(endPage/rowPage) +1;
		}
	}
	
	// 공지사항 추가하기
	public int addNotice(Notice notice) {
		return noticeMapper.insertNotice(notice);
	}
	
	// 공지사항 상세보기
	public Notice getNoticeOne(int noticeId) {
		return noticeMapper.selectNoticeOne(noticeId);
	}
	
	// 공지사항 삭제
	public int removeNotie(int noticeId) {
		return noticeMapper.deleteNotice(noticeId);
	}
	
	// 공지사항 수정
	public int modifyNotice(Notice notice) {
		return noticeMapper.updateNotice(notice);
	}
}
