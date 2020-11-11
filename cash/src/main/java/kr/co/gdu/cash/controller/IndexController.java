package kr.co.gdu.cash.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import kr.co.gdu.cash.service.IndexService;
import kr.co.gdu.cash.service.NoticeService;
import kr.co.gdu.cash.vo.Notice;

@Controller
public class IndexController {
	@Autowired private IndexService indexService; 
	@Autowired private NoticeService noticeService;
	int type=1;
	
	@GetMapping(value="/admin/index")
	public String index(Model model) {
		List<Map<String, Object>> inOutList = indexService.getInOutList();
		List<Notice> noticeList = noticeService.getLatestNoticeList();
		
		model.addAttribute("noticeList", noticeList);
		model.addAttribute("inOutList", inOutList);

		// 페이지 타입 - 1 = home, 2 = cash, 3 = notice
		model.addAttribute("type", type);
		return "index";
	}
}
