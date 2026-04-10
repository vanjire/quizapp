package com.example.demo;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

public interface takeQuizRepository extends JpaRepository<takeQUiz,Long> {
 List<takeQUiz> findAllByOrderByIdDesc();
 takeQUiz findTopByOrderByIdDesc();
 Page<takeQUiz> findAllByOrderByIdDesc(Pageable pageable);
 Page<takeQUiz> findByTitleContainingIgnoreCase(
	        String title,
	        Pageable pageable
	);
}
