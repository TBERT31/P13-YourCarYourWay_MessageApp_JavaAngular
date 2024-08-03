package com.yourcaryourway.back.service.impl;

import com.yourcaryourway.back.entity.Message;
import com.yourcaryourway.back.exception.NotFoundException;
import com.yourcaryourway.back.repository.MessageRepository;
import com.yourcaryourway.back.service.MessageService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class MessageServiceImpl implements MessageService {

    private final MessageRepository messageRepository;

    @Override
    public Message createMessage(Message message){
        return messageRepository.save(message);
    }

    @Override
    public Message getMessageById(int messageId){
        return messageRepository.findById(messageId)
                .orElseThrow(() -> new NotFoundException("Message with ID " + messageId + " not found"));
    }

    @Override
    public List<Message> getMessagesByDiscussionId(int discussionId){
        return  messageRepository.findAllByDiscussionIdOrderByCreatedAtAsc(discussionId);
    }

    @Override
    public List<Message> getMessagesByUserId(int userId){
        return  messageRepository.findAllByAuthorIdOrderByCreatedAtAsc(userId);
    }
}
