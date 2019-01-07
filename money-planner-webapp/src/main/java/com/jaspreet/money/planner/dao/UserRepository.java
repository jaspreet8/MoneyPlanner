package com.jaspreet.money.planner.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import com.jaspreet.money.planner.entity.User;

/**
 * @author jaspreet
 *
 */
public interface UserRepository extends JpaRepository<User, Long> {
	
    public User findByEmailAddressAndEnabled(String emailAddress,boolean enabled);

}