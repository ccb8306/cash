package kr.co.gdu.cash.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import kr.co.gdu.cash.service.VisitorbookService;
import kr.co.gdu.cash.vo.Visitorbook;

@Controller
public class VisitorbookController {
	int type = 6;
	@Autowired VisitorbookService visitorbookService;
	
	// 방명록 메인
	@GetMapping("/admin/visitorbook/{currentPage}")
	public String visitorbook(Model model,
				@PathVariable(name="currentPage") int currentPage) {
		
		int rowPage = 7;
		int endPage = visitorbookService.getVisitorbookListEndPage(rowPage);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("startPage", (int)(currentPage - 1) * rowPage );
		map.put("rowPage", rowPage );
		List<Visitorbook> visitorbookList = visitorbookService.getVisitorbookListByPage(map);
		
		model.addAttribute("visitorbookList", visitorbookList);
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("endPage", endPage);
		model.addAttribute("type", type);
		return "visitorbook";
	}
	
	// 방명록 추가
	@PostMapping("/admin/addVisitorbook")
	public String addVisitorbook(Visitorbook visitorbook) {
		visitorbookService.addVisitorbook(visitorbook);
		return "redirect:/admin/visitorbook/1";
	}
	
	// 방명록 삭제
	@GetMapping("/admin/removeVisitorbook/{visitorbookId}")
	public String removeVisitorbook(
			@PathVariable(name="visitorbookId") int visitorbookId) {
		
		visitorbookService.removeVisitorbook(visitorbookId);
		return "redirect:/admin/visitorbook/1";
	}
}
