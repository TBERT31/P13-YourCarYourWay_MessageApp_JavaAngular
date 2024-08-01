package com.yourcaryourway.back.controller;

import com.yourcaryourway.back.config.services.JwtService;
import com.yourcaryourway.back.dto.UserDto;
import com.yourcaryourway.back.entity.User;
import com.yourcaryourway.back.mapper.UserMapper;
import com.yourcaryourway.back.payload.request.LoginRequest;
import com.yourcaryourway.back.payload.response.JwtResponse;
import com.yourcaryourway.back.service.AuthService;
import com.yourcaryourway.back.service.UserService;
import io.swagger.v3.oas.annotations.tags.Tag;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/api/auth")
@RequiredArgsConstructor
@CrossOrigin(origins = "http://localhost:4200", maxAge = 3600)
@Tag(name = "Auth")
public class AuthController {

    private final JwtService jwtService;
    private final AuthService authService;
    private final UserMapper userMapper;

    @PostMapping("/register")
    public ResponseEntity<UserDto> register(
            @Valid @RequestBody UserDto userDto
    ) {
        User registeredUser = authService.register(userDto);

        return ResponseEntity.ok(userMapper.toDto(registeredUser));
    }

    @PostMapping("/login")
    public ResponseEntity<JwtResponse> login(
            @Valid @RequestBody LoginRequest loginRequest
    ) {
        User authenticatedUser = authService.login(loginRequest);

        String jwtToken = jwtService.generateToken(authenticatedUser);

        JwtResponse jwtResponse = new JwtResponse(jwtToken, loginRequest.getEmail(), authenticatedUser.getId());

        return ResponseEntity.ok(jwtResponse);
    }

}
