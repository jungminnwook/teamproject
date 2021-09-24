package com.team.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class Criteria {

	private int pageNum;	//페이지 번호
	private int amount;		//�� ������ �� �� ����
	private int startRow;	//������ ��ȣ
	
	public Criteria() {
		this(1,12);	//�⺻���� 1������, ���������� �� 10���� ������
	}

	public Criteria(int pageNum, int amount) {
		this.pageNum = pageNum;
		this.amount = amount;
		
	
	}
	
	
}