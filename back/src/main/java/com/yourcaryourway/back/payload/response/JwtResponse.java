package com.yourcaryourway.back.payload.response;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class JwtResponse {
    private String token;
    private String type = "Bearer";
    private int id;
    private String email;

    public JwtResponse(String token, String email, int id) {
        this.token = token;
        this.id = id;
        this.email = email;
    }
}