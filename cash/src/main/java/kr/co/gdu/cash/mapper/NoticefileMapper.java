package kr.co.gdu.cash.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.co.gdu.cash.vo.Noticefile;

@Mapper
public interface NoticefileMapper {
	// 공지사항 파일 첨부하기
	int insertNoticefile(Noticefile noticefile);
	// 공지사항 파일 한개 삭제
	int deleteNoticefileOne(int noticefileId);
	// 공지사항 파일 여러개 삭제 (공지사항 게시글 삭제시)
	int deleteNoticefileList(int noticeId);
	// 선택한 공지사항의 파일 이름들 가져오기
	List<String> selectNoticefileNameList(int noticeId);
	// 공지사항 파일 한개 이름 가져오기
	String selectNoticefileNameOne(int noticefileId);
	
}
