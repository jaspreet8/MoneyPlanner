package com.jaspreet.money.planner.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import com.jaspreet.money.planner.entity.PasswordResetToken;

/**
 * @author jaspreet
 *
 */
public interface PasswordResetTokenRepository extends JpaRepository<PasswordResetToken, Long> {

	public PasswordResetToken findByToken(String token);
}
