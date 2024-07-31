package com.yourcaryourway.back.controller;

import com.yourcaryourway.back.dto.UserDto;
import com.yourcaryourway.back.service.UserService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/api/users")
@RequiredArgsConstructor
@CrossOrigin(origins = "http://localhost:4200", maxAge = 3600)
public class UserController {

    private final UserService userService;



}
