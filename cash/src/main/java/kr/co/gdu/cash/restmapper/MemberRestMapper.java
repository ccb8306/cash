package kr.co.gdu.cash.restmapper;

import org.apache.ibatis.annotations.Mapper;

import kr.co.gdu.cash.vo.Member;

@Mapper
public interface MemberRestMapper {
	public String selectMemberId(String id);
	public String selectMemberCk(Member member);
}
