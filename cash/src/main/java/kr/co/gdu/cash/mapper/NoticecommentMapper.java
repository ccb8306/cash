package kr.co.gdu.cash.mapper;

import org.apache.ibatis.annotations.Mapper;

import kr.co.gdu.cash.vo.Noticecomment;

@Mapper
public interface NoticecommentMapper {
	int insertNoticecomment(Noticecomment noticecomment);
	int deleteNoticecommentOne(int commentId);
	int deleteNoticecommentList(int noticeId);
}
