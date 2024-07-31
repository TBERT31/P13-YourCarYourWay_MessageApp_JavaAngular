package com.yourcaryourway.back.mapper;

import com.yourcaryourway.back.dto.MessageDto;
import com.yourcaryourway.back.entity.Discussion;
import com.yourcaryourway.back.entity.Message;
import com.yourcaryourway.back.entity.User;
import com.yourcaryourway.back.repository.DiscussionRepository;
import com.yourcaryourway.back.repository.UserRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

@Service
@RequiredArgsConstructor
public class MessageMapper {

    private final UserRepository userRepository;
    private final DiscussionRepository discussionRepository;

    public MessageDto toDto(Message message){
        return MessageDto.builder()
                .id(message.getId())
                .content(message.getContent())
                .discussion_id(message.getDiscussion().getId())
                .author_id(message.getAuthor().getId())
                .direct(message.isDirect())
                .createdAt(message.getCreatedAt())
                .updatedAt(message.getUpdatedAt())
                .build();
    }

    public Message toEntity(MessageDto messageDto){

        Message build = Message.builder()
                .id(messageDto.getId())
                .content(messageDto.getContent())
                .discussion(
                        discussionRepository.findById(messageDto.getDiscussion_id())
                                //.orElse(null)
                                .orElseThrow(() -> new IllegalArgumentException("Invalid discussion ID: " + messageDto.getDiscussion_id()))
                )
                .author(
                        userRepository.findById(messageDto.getAuthor_id())
                                //.orElse(null)
                                .orElseThrow(() -> new IllegalArgumentException("Invalid author ID: " + messageDto.getAuthor_id()))
                )
                .direct(messageDto.isDirect()) // Mapping direct field
                .createdAt(messageDto.getCreatedAt())
                .updatedAt(messageDto.getUpdatedAt())
                .build();
        return build;
    }

    public List<MessageDto> toDtoList(List<Message> messages) {
        return messages.stream()
                .map(this::toDto) // Utilisation de la méthode toDto pour chaque élément
                .collect(Collectors.toList());
    }

    public List<Message> toEntityList(List<MessageDto> messageDtos) {
        return messageDtos.stream()
                .map(this::toEntity) // Utilisation de la méthode toEntity pour chaque élément
                .collect(Collectors.toList());
    }
}
