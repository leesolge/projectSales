package com.sales.erp.smemberDao;

import java.util.ArrayList;
import org.springframework.stereotype.Repository;
import com.sales.erp.smember.SMemberVO;
import com.sales.erp.smember.SearchMember;

@Repository
public interface SMemberDAO {
	public void insertMember(SMemberVO member); // 회원등록
	public SMemberVO selectMember(String empno); // empno에 따른 개인정보 추출
	public ArrayList<SMemberVO> Admin_Ok_Member(); // 승인대기 목록
	public ArrayList<SMemberVO> Admin_Approved_Member(SearchMember vo); // 사원목록
	public void Update_Approve_Member(String empno); // 가입승인
	public void Update_Cancel_Member(String empno); // 반려, 사원정보 삭제
	public void Admin_Update_Member(SMemberVO vo); // 사원정보 수정
	public int Count_Approved_Member(SearchMember vo); // 사원 수
	public int Count_Ok_Member(); // 승인 대기자 수
}
