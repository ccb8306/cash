package kr.co.gdu.cash.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.gdu.cash.mapper.NoticeMapper;
import kr.co.gdu.cash.service.NoticeService;
import kr.co.gdu.cash.vo.Notice;

@Controller
public class NoticeController {
	@Autowired private NoticeService noticeService;
	
	// 공지사항 목록
	@GetMapping("/admin/noticeList")
	public String getNoticeList(Model model,
								@RequestParam(name="currentPage", defaultValue = "1") int currentPage){
		
		// 페이지
		int rowPage = 10;
		int startPage = (int)(currentPage -1) * rowPage;
		int endPage = noticeService.getEndPage(rowPage);
		
		// 공지사항 리스트 불러오기
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("startPage", startPage);
		map.put("rowPage", rowPage);
		List<Notice> noticeList =  noticeService.getNoticeList(map);
		
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("endPage", endPage);
		model.addAttribute("noticeList", noticeList);
		
		model.addAttribute("type", 3);
		return "noticeList";
	}
	
	// 공지사항 추가 폼
	@GetMapping("/admin/addNotice")
	public String addNotice(Model model) {
		model.addAttribute("type", 3);
		return "addNotice";
	}
	// 공지사항 추가 액션
	@PostMapping("/admin/addNotice")
	public String addNotice(Model model, Notice notice) {
		noticeService.addNotice(notice);
		model.addAttribute("type", 3);
		return "redirect:/admin/noticeList";
	}
	
	// 공지사항 상세보기
	@GetMapping("/admin/noticeOne")
	public String noticeOne(Model model,
			@RequestParam(name="noticeId", required = true) int noticeId){
		
		Notice notice = noticeService.getNoticeOne(noticeId);
		model.addAttribute("notice", notice);
		model.addAttribute("type", 3);
		return "noticeOne";
	}
	
	// 공지사항 삭제
	@GetMapping("/admin/removeNotice")
	public String removeNotice(Model model,
			@RequestParam(name="noticeId", required = true) int noticeId) {
		
		noticeService.removeNotie(noticeId);
		model.addAttribute("type", 3);
		return "redirect:/admin/noticeList";
	}
	
	// 공지사항 수정 폼
	@GetMapping("/admin/modifyNotice")
	public String modifyNotice(Model model, 
			@RequestParam(name="noticeId", required = true) int noticeId) {
		
		Notice notice = noticeService.getNoticeOne(noticeId);
		model.addAttribute("notice", notice);
		model.addAttribute("type", 3);
		return "modifyNotice";
	}
	// 공지사항 수정 액션
	@PostMapping("/admin/modifyNotice")
	public String modifyNotice(Model model, Notice notice) {
		noticeService.modifyNotice(notice);
		return "redirect:/admin/noticeOne?noticeId=" + notice.getNoticeId();
	}
}
