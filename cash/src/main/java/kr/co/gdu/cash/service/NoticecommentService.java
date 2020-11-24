package kr.co.gdu.cash.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.co.gdu.cash.mapper.NoticecommentMapper;
import kr.co.gdu.cash.vo.Noticecomment;

@Service
@Transactional
public class NoticecommentService {
	@Autowired NoticecommentMapper noticecommentMapper;
	
	// 댓글 추가
	public int addNoticecomment(Noticecomment noticecomment) {
		return noticecommentMapper.insertNoticecomment(noticecomment);
	}
	
	// 댓글 한개 삭제
	public int removeNoticecommentOne(int commentId) {
		return noticecommentMapper.deleteNoticecommentOne(commentId);		
	}
	
}
