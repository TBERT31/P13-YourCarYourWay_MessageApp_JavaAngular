package com.yourcaryourway.back.service;

import com.yourcaryourway.back.dto.UserDto;
import com.yourcaryourway.back.entity.User;
import com.yourcaryourway.back.payload.request.LoginRequest;

public interface AuthService {
    User register(UserDto userDto);
    User login(LoginRequest loginRequest);
}
