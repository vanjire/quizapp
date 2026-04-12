
package com.example.demo;
import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

public interface submittedUsersRepository extends JpaRepository<submittedUsers,Long> {

    submittedUsers findByUserEmailAndQuizId(String userEmail,long quizId);

    List<submittedUsers> findByQuizId(long quizId);
    Page<submittedUsers> findByQuizIdOrderByScoreDesc(long quizId,Pageable pageable);
    // ✅ JPQL VERSION

    @Query("SELECT SUM(s.score) FROM submittedUsers s WHERE s.userEmail = :uemail")
    Long getTotalScore(@Param("uemail") String uemail);

    @Query("SELECT MAX(s.score) FROM submittedUsers s WHERE s.userEmail = :uemail")
    Long getMaxScore(@Param("uemail") String uemail);

    @Query("SELECT COUNT(s.quizId) FROM submittedUsers s WHERE s.userEmail = :uemail")
    Long getTotalSolvedQuizzes(@Param("uemail") String uemail);
    
    @Query("SELECT COUNT(s) + 1 FROM submittedUsers s " +
    	       "WHERE s.score > (" +
    	       "   SELECT s2.score FROM submittedUsers s2 " +
    	       "   WHERE s2.userEmail = :uemail AND s2.quizId = :quizId" +
    	       ") " +
    	       "AND s.quizId = :quizId")
    	long findUserRank(@Param("uemail") String uemail,
    	                  @Param("quizId") long quizId);
    
    @Query("SELECT COUNT(u) FROM submittedUsers u")
	 Long countAllUsers();
    @Query("SELECT COUNT(DISTINCT s.userEmail) FROM submittedUsers s")
    Long countDistinctUsers();
    @Query("SELECT COUNT(s) FROM submittedUsers s WHERE s.quizId = :quizId")
    Long countByQuizId(long quizId);
    
    @Query("SELECT MAX(s.score) FROM submittedUsers s WHERE s.quizId = :quizId")
    Integer getMaxScoreOfQuiz(@Param("quizId") long quizId);

    @Query("SELECT SUM(s.score) FROM submittedUsers s WHERE s.quizId = :quizId")
    Long sumOfQuiz(@Param("quizId") long quizId);
    
    submittedUsers findByUserEmail(String userEmail);
    Page<submittedUsers> findByQuizId(long quizId,Pageable pageable);
    List<submittedUsers> findAllByOrderByScoreDesc();
    
    List<submittedUsers> findByNameContainingIgnoreCaseOrUserEmailContainingIgnoreCase( String name,
		    String userEmail);
}