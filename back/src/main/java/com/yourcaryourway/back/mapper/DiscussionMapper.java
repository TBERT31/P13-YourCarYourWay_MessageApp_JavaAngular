package com.yourcaryourway.back.mapper;

import com.yourcaryourway.back.dto.DiscussionDto;
import com.yourcaryourway.back.entity.Discussion;
import com.yourcaryourway.back.entity.Message;
import com.yourcaryourway.back.entity.User;
import com.yourcaryourway.back.repository.MessageRepository;
import com.yourcaryourway.back.repository.StatusRepository;
import com.yourcaryourway.back.repository.UserRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.stream.Collectors;

@Service
@RequiredArgsConstructor
public class DiscussionMapper {

    private final UserRepository userRepository;
    private final MessageRepository messageRepository;
    private final StatusRepository statusRepository;

    public DiscussionDto fromEntity(Discussion discussion){
        return DiscussionDto.builder()
                .id(discussion.getId())
                .title(discussion.getTitle())
                .status(discussion.getStatus().getName())
                .createdAt(discussion.getCreatedAt())
                .updatedAt(discussion.getUpdatedAt())
                .messageIds(
                    discussion.getMessages().stream()
                            .map(Message::getId)
                            .collect(Collectors.toSet())
                )
                .participantIds(
                    discussion.getUsers_participants().stream()
                            .map(User::getId)
                            .collect(Collectors.toSet())
                )
                .build();
    }

    public Discussion toEntity(DiscussionDto discussionDto){
        return Discussion.builder()
                .id(discussionDto.getId())
                .title(discussionDto.getTitle())
                .status(
                    statusRepository.findByName(discussionDto.getStatus())
                            .orElse(null)
                )
                .createdAt(discussionDto.getCreatedAt())
                .updatedAt(discussionDto.getUpdatedAt())
                .messages(
                    discussionDto.getMessageIds().stream()
                            .map(id -> messageRepository.findById(id).orElse(null))
                            .collect(Collectors.toSet())
                )
                .users_participants(
                    discussionDto.getParticipantIds().stream()
                            .map(id -> userRepository.findById(id).orElse(null))
                            .collect(Collectors.toSet())
                )
                .build();
    }
}
