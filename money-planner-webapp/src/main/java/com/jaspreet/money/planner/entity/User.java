package com.jaspreet.money.planner.entity;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;

import lombok.Data;

/**	
 * @author jaspreet
 *
 */
@Entity
@Data
public class User {
	
	@Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;
    private String name;
    private String emailAddress;
    private String password;
    private boolean enabled;
    @ManyToOne
    private Role role;

    
}