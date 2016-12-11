package com.sales.erp.member.vo;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Component;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import com.sales.erp.member.dao.MemberDAO;


@Component
public class MemberAuthenticationProvider implements AuthenticationProvider {

	@Autowired
	private MemberDAO dao;
	
	@Autowired
    private MemberUserDetailsService sc;

//	@Autowired
//    private BCryptPasswordEncoder passwordEncoder;

	@Override
	public Authentication authenticate(Authentication authentication) throws AuthenticationException {

		String id=(String)authentication.getPrincipal();
        String pw=(String)authentication.getCredentials();

        User user=(User)sc.loadUserByUsername(id);
        
        if(!pw.equals(user.getPassword())){
            throw new BadCredentialsException("패스워드가 일치하지 않습니다.");
        }
        HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
        MemberVO memberInfo = dao.getMemberEmpno(id);
        HttpSession session = request.getSession();
        session.setMaxInactiveInterval(3600);
        session.setAttribute("memberInfo", memberInfo);
        return new UsernamePasswordAuthenticationToken(id, pw, user.getAuthorities());
    }
/////
    
	@Override
	public boolean supports(Class<?> authentication) {
		return UsernamePasswordAuthenticationToken.class.isAssignableFrom(authentication);
	}
}
