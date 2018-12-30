package com.jaspreet.money.planner.service;

import com.jaspreet.money.planner.entity.User;

/**
 * @author jaspreet
 *
 */
public interface UserService {
	
    public void save(User user);
    
    public User findByEmailAddress(String emailAddress);
    
}
