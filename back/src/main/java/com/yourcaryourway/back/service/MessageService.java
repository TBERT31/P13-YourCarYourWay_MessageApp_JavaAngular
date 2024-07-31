package com.yourcaryourway.back.service;

import com.yourcaryourway.back.entity.Message;

import java.util.List;

public interface MessageService {
    Message createMessage(Message message);
    Message getMessageById(int messageId);
    List<Message> getMessagesByDiscussionId(int discussionId);
    List<Message> getMessagesByUserId(int userId);
}
