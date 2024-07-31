package com.yourcaryourway.back.repository;

import com.yourcaryourway.back.entity.Status;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public interface StatusRepository extends JpaRepository<Status, String> {
    Optional<Status> findByName(String name);
}
