package com.jaspreet.money.planner.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.jaspreet.money.planner.entity.User;

/**
 * @author jaspreet
 *
 */
public interface UserRepository extends JpaRepository<User, Long> {
	
    public User findByEmailAddressAndEnabled(String emailAddress,boolean enabled);
    
    @Modifying
    @Query("update User u set u.password = :password where u.id = :id")
    public void updatePassword(@Param("password") String password, @Param("id") Long id);

}