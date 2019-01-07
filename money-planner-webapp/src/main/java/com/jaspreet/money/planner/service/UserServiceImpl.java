package com.jaspreet.money.planner.service;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import com.jaspreet.money.planner.dao.UserRepository;
import com.jaspreet.money.planner.entity.User;
/**
 * @author jaspreet
 *
 */
@Service
@Transactional
public class UserServiceImpl implements UserService {
    @Autowired
    private UserRepository userRepository;
    @Autowired
    private BCryptPasswordEncoder bCryptPasswordEncoder;

    @Override
    public User save(User user) {
    	if(StringUtils.hasText(user.getPassword())){
    		user.setPassword(bCryptPasswordEncoder.encode(user.getPassword()));
    	}
        user.setEnabled(true);
        return userRepository.save(user); 
    }

    @Override
    public User findByEmailAddressAndEnabled(String emailAddress,boolean enabled) {
        return userRepository.findByEmailAddressAndEnabled(emailAddress, enabled);
    }

	@Override
	public void update(User user) {
		userRepository.save(user);		
	}
}
