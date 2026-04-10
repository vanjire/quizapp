package com.example.demo;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

public interface quizRepository extends JpaRepository<Quiz,Long> {
	@Query("SELECT COUNT(q) FROM Quiz q")
	Long totalQuizzes();
	Page<Quiz> findByTitleContainingIgnoreCase(
	        String title,
	        Pageable pageable
	);
}
