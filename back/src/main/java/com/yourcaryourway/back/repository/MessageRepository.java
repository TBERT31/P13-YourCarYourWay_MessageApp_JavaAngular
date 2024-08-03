package com.yourcaryourway.back.repository;

import com.yourcaryourway.back.entity.Message;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface MessageRepository extends JpaRepository<Message, Integer> {
    List<Message> findAllByDiscussionIdOrderByCreatedAtAsc(int discussionId);
    List<Message> findAllByAuthorIdOrderByCreatedAtAsc(int authorId);
}
