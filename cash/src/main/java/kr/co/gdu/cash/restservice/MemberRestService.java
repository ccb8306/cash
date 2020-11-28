package kr.co.gdu.cash.restservice;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.co.gdu.cash.restmapper.MemberRestMapper;
import kr.co.gdu.cash.vo.Member;

@Service
@Transactional
public class MemberRestService {
	@Autowired MemberRestMapper memberRestMapper;
	
	public boolean isMemberId(String id) {
		
		// 아이디 존재 시 false
		if(memberRestMapper.selectMemberId(id) != null) {
			return false;
		}
		
		return true;
	}

	// 사용자 확인
	public boolean memberCk(Member member) {

		if(memberRestMapper.selectMemberCk(member) == null) {
			return false;
		}
		return true;
	}
}
