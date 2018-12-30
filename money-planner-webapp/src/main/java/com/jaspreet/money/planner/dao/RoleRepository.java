package com.jaspreet.money.planner.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import com.jaspreet.money.planner.entity.Role;

/**
 * @author jaspreet
 *
 */
public interface RoleRepository extends JpaRepository<Role, Long> {

	 public Role findByName(String name);
}