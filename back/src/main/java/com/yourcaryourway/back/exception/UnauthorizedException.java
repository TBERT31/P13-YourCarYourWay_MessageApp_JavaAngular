package com.yourcaryourway.back.exception;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.ResponseStatus;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ResponseStatus(value= HttpStatus.UNAUTHORIZED)
public class UnauthorizedException extends RuntimeException {
    private String message;
}
