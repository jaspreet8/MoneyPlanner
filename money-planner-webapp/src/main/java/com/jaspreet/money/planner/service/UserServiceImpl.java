package com.jaspreet.money.planner.service;

import java.util.stream.Collectors;
import java.util.stream.Stream;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.jaspreet.money.planner.dao.RoleRepository;
import com.jaspreet.money.planner.dao.UserRepository;
import com.jaspreet.money.planner.entity.User;
/**
 * @author jaspreet
 *
 */
@Service
public class UserServiceImpl implements UserService {
    @Autowired
    private UserRepository userRepository;
    @Autowired
    private RoleRepository roleRepository;
    @Autowired
    private BCryptPasswordEncoder bCryptPasswordEncoder;

    @Override
    public void save(User user) {
        user.setPassword(bCryptPasswordEncoder.encode(user.getPassword()));
        user.setRoles(Stream.of(roleRepository.findByName("ROLE_USER")).collect(Collectors.toSet()));
        userRepository.save(user);
    }

    @Override
    public User findByEmailAddress(String username) {
        return userRepository.findByEmailAddress(username);
    }
}
