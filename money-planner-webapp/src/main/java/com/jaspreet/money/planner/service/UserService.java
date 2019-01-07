package com.jaspreet.money.planner.service;

import com.jaspreet.money.planner.entity.User;

/**
 * @author jaspreet
 *
 */
public interface UserService {
	
    public User save(User user);
    
    public User findByEmailAddressAndEnabled(String emailAddress, boolean enabled);

	public void update(User user);
    
}
