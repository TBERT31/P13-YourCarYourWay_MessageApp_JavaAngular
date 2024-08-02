package com.yourcaryourway.back.dto;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonIgnore;
import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Size;
import lombok.*;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.Set;

@Getter
@Setter
@Builder
@AllArgsConstructor
public class UserDto {
    private int id;

    @NotBlank(message = "Email is required")
    @Size(max = 50)
    @Email
    private String email;

    @NotBlank(message = "Firstname is required")
    @Size(max = 50)
    private String firstname;

    @NotBlank(message = "Lastname is required")
    @Size(max = 50)
    private String lastname;

    @JsonIgnore
    @Size(max = 255)
    private String password;

    @NotBlank(message = "Address is required")
    @Size(max = 255)
    private String address;

    @JsonFormat(pattern = "yyyy-MM-dd")
    private LocalDate birthDate;

    private boolean admin;

    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private LocalDateTime createdAt;

    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private LocalDateTime updatedAt;

    private Set<Integer> messageIds;

    private Set<Integer> discussionIds;
}
