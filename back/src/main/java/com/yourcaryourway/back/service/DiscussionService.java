package com.yourcaryourway.back.service;

import com.yourcaryourway.back.entity.Discussion;

import java.util.List;

public interface DiscussionService {
    Discussion createDiscussion(Discussion discussion);
    List<Discussion> getAllDiscussion();
    Discussion getDiscussionById(int id);
    Discussion updateDiscussionStatusById(Discussion discussion);
    void deleteDiscussionById(int id);
}
