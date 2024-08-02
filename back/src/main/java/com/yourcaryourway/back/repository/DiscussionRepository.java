package com.yourcaryourway.back.repository;

import com.yourcaryourway.back.entity.Discussion;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface DiscussionRepository extends JpaRepository<Discussion, Integer> {

    @Query(value = "SELECT * FROM discussions AS d " +
            "LEFT JOIN discussion_participants AS dp ON d.id = dp.discussion_id " +
            "WHERE dp.user_id = :userId", nativeQuery = true)
    List<Discussion> findAllByUserId(Integer userId);

    @Query(value = "SELECT CONCAT(u.firstname, ' ', u.lastname) AS full_name " +
            "FROM users u " +
            "JOIN discussion_participants dp ON u.id = dp.user_id " +
            "WHERE dp.discussion_id = :discussionId " +
            "ORDER BY u.created_at ASC " +
            "LIMIT 1;", nativeQuery = true)
    String findFirstParticipantNameById(Integer discussionId);
}
