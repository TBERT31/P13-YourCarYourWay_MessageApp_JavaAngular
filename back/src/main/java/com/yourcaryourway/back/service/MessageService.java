package com.yourcaryourway.back.service;

import com.yourcaryourway.back.entity.Message;

import java.util.List;

public interface MessageService {
    Message createMessage(Message message);
    Message getMessageById(int id);
    List<Message> getMessageByDiscussionId(int discussionId);
    List<Message> getMessageByUserId(int userId);
}
