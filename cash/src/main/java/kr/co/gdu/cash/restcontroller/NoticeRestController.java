package kr.co.gdu.cash.restcontroller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

import kr.co.gdu.cash.service.NoticeService;

@RestController
public class NoticeRestController {
	@Autowired NoticeService noticeService;
	
	// 공지사항 파일 한개 삭제
	@GetMapping("/admin/removeNoticefileOne/{noticefileId}")
	public void removeNoticefileOne(
			@PathVariable(name="noticefileId") int noticefileId) {
		
		noticeService.removeNoticefileOne(noticefileId);

		return;
	}
}
