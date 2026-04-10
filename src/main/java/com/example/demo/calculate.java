package com.example.demo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class calculate {
	@Autowired
	private StudentAnswerRepository sarp;
	@Autowired
	
	private QuestionRepository querp;
	@Autowired
	submittedUsersRepository subrp;
	@Autowired
	R4sRepository r4srp;
	public long totalScore(String uemail) {
		Long total=subrp.getTotalScore(uemail);
		return total == null ?0:total;
	}
	public long maxScore(String uemail) {
		Long total=subrp.getMaxScore(uemail);
		return total==null?0:total;
	}
	public Long totalQuizzesSolved(String uemail) {
		Long total=subrp.getTotalSolvedQuizzes(uemail);
		return total==null?0:total;
	}
	public double averageScore(String uemail) {
		Long solved=totalQuizzesSolved(uemail);
		if(solved==0) {return 0;}
		
		long total=totalScore(uemail);
		return (double) total/solved;
	}
	public long rank(String uemail) {
		List<R4s> users=r4srp.findAllByOrderByScoreDesc();
		
		long rank =1;
		for(R4s u:users) {
			if(u.getUserEmail().equals(uemail)) {
				
				if(rank<=3){u.setTier("Diamond");}
				else if(rank<=10){u.setTier("Platinum");}
				else if(rank<=30){u.setTier("Gold");}
				else if(rank<=100){u.setTier("Silver");}
				else if(rank<=150){u.setTier("Bronze");}
				else {u.setTier("Rookie");}
				r4srp.save(u);
				break;
			}
			rank+=1;
		}
		
		return rank;
	}
	
}
