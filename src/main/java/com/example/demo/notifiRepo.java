package com.example.demo;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.transaction.annotation.Transactional;

public interface notifiRepo extends JpaRepository<notifiUsers,Long> {
	@Query("SELECT COUNT(n) FROM notifiUsers n WHERE (n.userId = :userId OR n.userId IS NULL) AND n.isRead=false")
	long countUnread(@Param("userId") String userId);
	@Query("SELECT n FROM notifiUsers n WHERE (n.userId = :userId OR n.userId IS NULL) AND n.isRead=false")
	List<notifiUsers> messages(@Param("userId") String userId);
	@Modifying
	@Transactional
	@Query("UPDATE notifiUsers n SET n.isRead = true WHERE (n.userId = :userId OR n.userId IS NULL) AND n.isRead = false")
	int markAsRead(@Param("userId") String userId);
}


