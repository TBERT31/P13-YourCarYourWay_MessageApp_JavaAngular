package com.yourcaryourway.back.service.impl;

import com.yourcaryourway.back.entity.User;
import com.yourcaryourway.back.exception.NotFoundException;
import com.yourcaryourway.back.repository.UserRepository;
import com.yourcaryourway.back.service.UserService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class UserServiceImpl implements UserService {

    private final UserRepository userRepository;

    @Override
    public User getUserById(int userId){
        return userRepository.findById(userId)
                .orElseThrow(() -> new NotFoundException("User with ID " + userId + " not found"));
    }

    @Override
    public User getUserByEmail(String email){
        return userRepository.findByEmail(email);
    }
}
