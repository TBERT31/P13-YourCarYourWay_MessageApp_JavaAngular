package com.yourcaryourway.back.service;

import com.yourcaryourway.back.entity.User;

public interface UserService {
    User getUserById(int id);
    User getUserByEmail(String email);
    User registerUser(User user);
}
