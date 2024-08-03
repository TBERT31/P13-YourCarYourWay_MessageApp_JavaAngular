package com.yourcaryourway.back.dto;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonIgnore;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Size;
import lombok.*;

import java.time.LocalDateTime;

@Getter
@Setter
@Builder
@AllArgsConstructor
public class MessageDto {
    private int id;

    @NotBlank(message = "Firstname is required")
    @Size(max = 2000)
    private String content;

    @NotNull(message = "Discussion ID is required")
    private int discussion_id;

    @NotNull(message = "Author email is required")
    private String author;

    private boolean direct;

    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private LocalDateTime createdAt;

    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private LocalDateTime updatedAt;
}
