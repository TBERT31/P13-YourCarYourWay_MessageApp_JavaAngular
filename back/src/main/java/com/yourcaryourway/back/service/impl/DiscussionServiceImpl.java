package com.yourcaryourway.back.service.impl;

import com.yourcaryourway.back.entity.Discussion;
import com.yourcaryourway.back.entity.Status;
import com.yourcaryourway.back.repository.DiscussionRepository;
import com.yourcaryourway.back.repository.StatusRepository;
import com.yourcaryourway.back.service.DiscussionService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class DiscussionServiceImpl implements DiscussionService {


    private final DiscussionRepository discussionRepository;
    private final StatusRepository statusRepository;

    @Override
    public Discussion createDiscussion(Discussion discussion){
        return discussionRepository.save(discussion);
    }

    @Override
    public List<Discussion> getAllDiscussions(){
        return discussionRepository.findAll();
    };

    @Override
    public Discussion getDiscussionById(int discussionId){
        return discussionRepository.findById(discussionId)
                .orElse(null);
    }

    @Override
    public Discussion updateDiscussionStatusById(String statusName, int discussionId){
        Discussion discussionUpdated = discussionRepository.findById(discussionId)
                .orElse(null);

        Status newStatus = statusRepository.findByName(statusName)
                .orElse(null);

        if(discussionUpdated != null){
            discussionUpdated.setStatus(newStatus);
            discussionRepository.save(discussionUpdated);
        }

        return discussionUpdated;
    }
}
