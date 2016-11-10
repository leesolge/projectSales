package com.sales.erp.member.vo;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.sales.erp.member.dao.MemberMapper;

@Service
public class MemberUserDetailsService implements UserDetailsService {
	
	@Autowired
	private SqlSession sqlSession;

	@Override
	public UserDetails loadUserByUsername(String empno) throws UsernameNotFoundException {

		MemberVO vo = new MemberVO();
		MemberMapper memberMapper = sqlSession.getMapper(MemberMapper.class);
		vo = memberMapper.selectMember(empno);
		if(vo == null) throw new UsernameNotFoundException(empno);
		
		List<GrantedAuthority> auth = new ArrayList<>();
		auth.add(new SimpleGrantedAuthority(vo.getAuth()));		
		
		return new User(empno, vo.getPwd(), auth);
	}

}
