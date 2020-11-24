package kr.co.gdu.cash.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import kr.co.gdu.cash.service.MemberService;
import kr.co.gdu.cash.vo.Member;

@Controller
public class MemberController {
	@Autowired MemberService memberService;
	int type=5;
	// 사용자 추가 폼
	@GetMapping("/admin/addMember")
	public String addMember(Model model) {
		
		model.addAttribute("type", type);
		return "addMember";
	}
	
	// 사용자 추가 액션
	@PostMapping("/admin/addMember")
	public String addMember(Member member) {
		memberService.addMember(member);
		
		return "redirect:/admin/index";
	}
}
