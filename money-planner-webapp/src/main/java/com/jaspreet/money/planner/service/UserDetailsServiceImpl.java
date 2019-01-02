package com.jaspreet.money.planner.service;

import java.util.ArrayList;
import java.util.Collection;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.jaspreet.money.planner.dao.UserRepository;
import com.jaspreet.money.planner.entity.User;
/**
 * @author jaspreet
 *
 */
@Service
public class UserDetailsServiceImpl implements UserDetailsService{
    @Autowired
    private UserRepository userRepository;

    @Override
    @Transactional(readOnly = true)
    public UserDetails loadUserByUsername(String emailAddress) throws UsernameNotFoundException {
        User user = userRepository.findByEmailAddress(emailAddress);

        Collection<GrantedAuthority> grantedAuthorities = new ArrayList<GrantedAuthority>();
        GrantedAuthority grantedAuthority = (GrantedAuthority)new GrantedAuthority() {
            private static final long serialVersionUID = 1L;
            
            public String getAuthority() {
                return "ROLE_USER";
            }
        };
        grantedAuthorities.add(grantedAuthority);
        if(user != null){
        	return new org.springframework.security.core.userdetails.User(user.getEmailAddress(), user.getPassword(), grantedAuthorities);
        }else{
        	return new org.springframework.security.core.userdetails.User("dummy","dummy",grantedAuthorities);
        }
    }
}
