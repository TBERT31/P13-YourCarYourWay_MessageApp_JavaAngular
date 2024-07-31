package com.yourcaryourway.back.service.impl;



import com.yourcaryourway.back.dto.UserDto;
import com.yourcaryourway.back.entity.User;
import com.yourcaryourway.back.exception.NotFoundException;
import com.yourcaryourway.back.payload.request.LoginRequest;
import com.yourcaryourway.back.repository.UserRepository;
import com.yourcaryourway.back.service.AuthService;
import lombok.RequiredArgsConstructor;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import java.util.Collections;

@Service
@RequiredArgsConstructor
public class AuthServiceImpl implements AuthService {
    private final UserRepository userRepository;

    private final PasswordEncoder passwordEncoder;

    private final AuthenticationManager authenticationManager;

    public User signup(UserDto userDto) {
        User user = new User()
                .setEmail(userDto.getEmail())
                .setFirstname(userDto.getFirstname())
                .setLastname(userDto.getLastname())
                .setPassword(passwordEncoder.encode(userDto.getPassword()))
                .setBirthDate(userDto.getBirthDate())
                .setAddress(userDto.getAddress())
                .setAdmin(false)
                .setMessages(Collections.emptySet())
                .setDiscussions_participants(Collections.emptySet());
        return userRepository.save(user);
    }

    public User authenticate(LoginRequest loginRequest) {
        authenticationManager.authenticate(
                new UsernamePasswordAuthenticationToken(
                        loginRequest.getEmail(),
                        loginRequest.getPassword()
                )
        );

        User userToSave = userRepository.findByEmail(loginRequest.getEmail());

        if(userToSave == null){
            throw new NotFoundException("User with Email : "+loginRequest.getEmail()+" not found");
        }

        return userToSave;
    }
}