package com.yourcaryourway.back.mapper;

import com.yourcaryourway.back.dto.UserDto;
import com.yourcaryourway.back.entity.User;
import com.yourcaryourway.back.repository.DiscussionRepository;
import com.yourcaryourway.back.repository.MessageRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.stream.Collectors;

@Service
@RequiredArgsConstructor
public class UserMapper {

    private final MessageRepository messageRepository;

    private final DiscussionRepository discussionRepository;

    public UserDto fromEntity(User user){
        return UserDto.builder()
                .id(user.getId())
                .email(user.getEmail())
                .firstname(user.getFirstname())
                .lastname(user.getLastname())
                .password(user.getPassword())
                .address(user.getAddress())
                .birthDate(user.getBirthDate())
                .createdAt(user.getCreatedAt())
                .updatedAt(user.getUpdatedAt())
                .messageIds(
                        user.getMessages().stream()
                                .map(message -> message.getId()) // Convert each Message to its ID
                                .collect(Collectors.toSet()) // Collect IDs into a Set
                )
                .discussionIds(
                        user.getDiscussions_participants().stream()
                                .map(discussion -> discussion.getId()) // Convert each Discussion to its ID
                                .collect(Collectors.toSet()) // Collect IDs into a Set
                )
                .build();
    }

    public User toEntity(UserDto userDto){
        return User.builder()
                .id(userDto.getId())
                .email(userDto.getEmail())
                .firstname(userDto.getFirstname())
                .lastname(userDto.getLastname())
                .password(userDto.getPassword())
                .address(userDto.getAddress())
                .birthDate(userDto.getBirthDate())
                .createdAt(userDto.getCreatedAt())
                .updatedAt(userDto.getUpdatedAt())
                .messages(
                        userDto.getMessageIds().stream()
                                .map(messageId -> messageRepository.findById(messageId).orElse(null)) // Convert each ID to a Message
                                .collect(Collectors.toSet()) // Collect Messages into a Set
                )
                .discussions_participants(
                        userDto.getDiscussionIds().stream()
                                .map(discussionId -> discussionRepository.findById(discussionId).orElse(null)) // Convert each ID to a Discussion
                                .collect(Collectors.toSet()) // Collect Discussions into a Set
                )
                .build();
    }
}
