package com.yourcaryourway.back.controller;

import com.yourcaryourway.back.dto.UserDto;
import com.yourcaryourway.back.entity.User;
import com.yourcaryourway.back.mapper.UserMapper;
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
    private final UserMapper userMapper;

    @GetMapping("/{userId}")
    public ResponseEntity<UserDto> getUserById(
            @PathVariable Integer userId
    ){
        try{
            User user = userService.getUserById(userId);
            if(user != null){
                UserDto userDto = userMapper.toDto(user);
                return ResponseEntity.ok(userDto);
            }else{
                return ResponseEntity.notFound().build();
            }
        }catch (NumberFormatException e){
            return ResponseEntity.badRequest().build();
        }
    }

    @GetMapping("/email/{email}")
    public ResponseEntity<UserDto> getUserByEmail(
            @PathVariable String email
    ){
        try{
            User user = userService.getUserByEmail(email);
            if(user != null){
                UserDto userDto = userMapper.toDto(user);
                return ResponseEntity.ok(userDto);
            }else{
                return ResponseEntity.notFound().build();
            }
        }catch (NumberFormatException e){
            return ResponseEntity.badRequest().build();
        }
    }

}
