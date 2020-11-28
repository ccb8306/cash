package kr.co.gdu.cash.restcontroller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import kr.co.gdu.cash.restservice.MemberRestService;
import kr.co.gdu.cash.vo.Member;

@RestController
public class MemberRestController {
	@Autowired MemberRestService memberRestService;
	
	@PostMapping("/admin/idCheck")
	public boolean idCheck(@RequestParam("id") String id) {
		return memberRestService.isMemberId(id);
	}
	
	@PostMapping("/memberCk")
	public boolean memberCk(Member member) {
		return memberRestService.memberCk(member);
	}
}
