package com.example.service;

import java.util.List;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.example.domain.MemberVO;
import com.example.domain.ProfilePicVO;
import com.example.mapper.MemberMapper;

//트랜젝션 처리 하기 위함
@Service //@Component 계열 애노테이션
@Transactional
public class MemberService {
	
	
	private MemberMapper memberMapper;
	
	//alt+shift+s generate member method
	//@Autowired 애노테이션이 생성자에서는 생략 가능
	public MemberService(MemberMapper memberMapper) {
		this.memberMapper = memberMapper;
	}
	
	//회원가입하기
	public void register(MemberVO memberVO) {
		
//		long beginTime = System.currentTimeMillis();
		
		memberMapper.insert(memberVO);
		
//		long endTime = System.currentTimeMillis();
	
//		long diff = endTime - beginTime;
//		System.out.println("메소드 실행시간 : " + diff + "ms");
	}
	
	public MemberVO getMemberById(String id) {
		MemberVO memberVO = memberMapper.getMemberById(id);
		return memberVO;
	}
	
	public List<MemberVO> getMembers(){
		return memberMapper.getMembers();
	}
	
	
	public int getCountById(String id) {
		return memberMapper.getCountById(id);
	}
	
	public int deleteMemberById(String id) {
		int rowCount =  memberMapper.deleteMemberById(id);
		return rowCount;
	}
	
	public void updateMember(MemberVO memberVO) {
		memberMapper.updateMember(memberVO);
	}
	public void updatePasswd(MemberVO memberVO) {
		memberMapper.updatePasswd(memberVO);
	}
   /* 나의 정보 업데이트 */
   public void updateMyInfo(MemberVO memberVO,ProfilePicVO profilePicVO) {
      memberMapper.updateMember(memberVO);

   }

}
