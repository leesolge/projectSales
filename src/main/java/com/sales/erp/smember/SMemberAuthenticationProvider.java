package com.sales.erp.smember;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Component;

@Component
public class SMemberAuthenticationProvider implements AuthenticationProvider {

	@Autowired
    private SMemberUserDetailsService sc;

//	@Autowired
//    private BCryptPasswordEncoder passwordEncoder;

	
	@Override
	public Authentication authenticate(Authentication authentication) throws AuthenticationException {
		UsernamePasswordAuthenticationToken authToken = (UsernamePasswordAuthenticationToken) authentication;

		String id=(String)authentication.getPrincipal();
        String pw=(String)authentication.getCredentials();

        User user=(User)sc.loadUserByUsername(id);
        
        if(!pw.equals(user.getPassword())){
            throw new BadCredentialsException("틀렸어!!패스워드가 일치하지 않습니다.");
        }

        return new UsernamePasswordAuthenticationToken(id, pw, user.getAuthorities());
    }

    
	@Override
	public boolean supports(Class<?> authentication) {
		return UsernamePasswordAuthenticationToken.class.isAssignableFrom(authentication);
	}
}
