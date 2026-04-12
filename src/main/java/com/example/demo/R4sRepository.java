package com.example.demo;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

public interface R4sRepository extends JpaRepository<R4s,Long> {
	List<R4s> findAllByOrderByScoreDesc();
	R4s findByUserEmail(String userEmail);
	List<R4s> findTop10ByOrderByScoreDesc();
	 Page<R4s> findAllByOrderByScoreDesc(Pageable pageable);
	 @Query("SELECT COUNT(u) FROM R4s u")
	 Long countAllUsers();
	 @Query("SELECT MAX(s.score) FROM R4s s")
	 long findTopScore();
	 List<R4s> findByNameContainingIgnoreCaseOrUserEmailContainingIgnoreCase(
			    String name,
			    String userEmail
			);
	 
	
	 @Query("SELECT COUNT(s) + 1 " +
		       "FROM R4s s " +
		       "WHERE s.score > (" +
		       "   SELECT s2.score " +
		       "   FROM R4s s2 " +
		       "   WHERE s2.userEmail = :uemail" +
		       ")")
		long getUserRank(@Param("uemail") String uemail);
}
