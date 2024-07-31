package com.yourcaryourway.back.repository;

import com.yourcaryourway.back.entity.Discussion;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface DiscussionRepository extends JpaRepository<Discussion, Integer> {

//    @Query("select * from discussions AS d" +
//            "left join discussion_participants AS dp ON d.id = dp.discussion_id" +
//            "WHERE dp.user_id = :userId"
//    )
//    List<Discussion> findAllByUserId(Integer userId);
}
