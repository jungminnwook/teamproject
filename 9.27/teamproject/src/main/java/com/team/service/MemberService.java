package com.team.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.team.domain.Criteria;
import com.team.domain.MemberVO;
import com.team.mapper.MemberMapper;

@Service // @Component �迭 �ֳ����̼�
//@Transactional
public class MemberService {
	
	private MemberMapper memberMapper;

	// @Autowired �ֳ����̼��� �����ڿ����� �������� 
	public MemberService(MemberMapper memberMapper) {
		this.memberMapper = memberMapper;
	}
	
	// ȸ�������ϱ�
	public void register(MemberVO memberVO) {
		
//		long beginTime = System.currentTimeMillis();
		
		memberMapper.insert(memberVO);
		
//		long endTime = System.currentTimeMillis();
		
//		long diff = endTime - beginTime;
//		System.out.println("�޼ҵ� ����ð� : " + diff + "ms");
	}
	
	public MemberVO getMemberById(String id) {
		MemberVO memberVO = memberMapper.getMemberById(id);
		return memberVO;
	}
	
	public List<MemberVO> getMembers() {
		return memberMapper.getMembers();
	}
	
	public int getCountById(String id) {
		return memberMapper.getCountById(id);
	}
	
	public int deleteMemberById(String id) {
		int rowCount = memberMapper.deleteMemberById(id);
		return rowCount;
	}
	
	//�� ���� �����ϱ�
		public void updateMember(MemberVO memberVO) {
			memberMapper.updateMember(memberVO);
		}
		//��й�ȣ �����ϱ�
		public void updatePasswd(MemberVO memberVO) {
			memberMapper.updatePasswd(memberVO);
		}
		

}





