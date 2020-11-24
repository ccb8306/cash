package kr.co.gdu.cash.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import kr.co.gdu.cash.service.NoticecommentService;
import kr.co.gdu.cash.vo.Noticecomment;

@Controller
public class NoticecommentController {
	@Autowired NoticecommentService noticecommentService;
	
	// 댓글 추가
	@PostMapping("/admin/addNoticecomment")
	public String addNoticecomment(Noticecomment noticecomment) {
		noticecommentService.addNoticecomment(noticecomment);
		return "redirect:/admin/noticeOne/" + noticecomment.getNoticeId();
	}
	
	// 댓글 한개 삭제
	@GetMapping("/admin/removeNoticecomment/{noticeId}/{commentId}")
	public String removeNoticecomment(
			@PathVariable(name="noticeId") int noticeId,
			@PathVariable(name="commentId") int commentId) {
		
		noticecommentService.removeNoticecommentOne(commentId);
		return "redirect:/admin/noticeOne/" + noticeId;
	}
}
