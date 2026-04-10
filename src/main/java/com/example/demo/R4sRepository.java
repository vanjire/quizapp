package com.example.demo;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

public interface R4sRepository extends JpaRepository<R4s,Long> {
	List<R4s> findAllByOrderByScoreDesc();
	R4s findByUserEmail(String userEmail);
	List<R4s> findTop10ByOrderByScoreDesc();
	 Page<R4s> findAllByOrderByScoreDesc(Pageable pageable);
	 @Query("SELECT COUNT(u) FROM R4s u")
	 Long countAllUsers();
	 @Query("SELECT MAX(s.score) FROM R4s s")
	 long findTopScore();
}
