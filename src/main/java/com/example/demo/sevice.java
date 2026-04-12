package com.example.demo;

import java.security.SecureRandom;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailException;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

@Service
public class sevice {
	@Autowired
	private StudentAnswerRepository sarp;
	@Autowired
	private QuestionRepository querp;
	@Autowired
	private JavaMailSender mailsender;
	@Autowired
	private R4sRepository r4srp;
	@Autowired
	private submittedUsersRepository subrp;
	public String generateAutoPassword() {

	    String characters = "0123456789";
	    SecureRandom random = new SecureRandom();
	    StringBuilder password = new StringBuilder();

	    for (int i = 0; i < 6; i++) {
	        int index = random.nextInt(characters.length());
	        password.append(characters.charAt(index));
	    }

	    return password.toString();
	}
	
	public String sendPasswordToEmail(String toEmail, String password) {

	   try { SimpleMailMessage message = new SimpleMailMessage();
	    message.setTo(toEmail);
	    message.setSubject("Subject: Quizora Verification Code");
	    message.setText(
	    		"Your Quizora verification code is "+password+".\r\n"
	    		+ "\r\n"
	    		+ "Do not share this code with anyone.\r\n"
	    		+ "\r\n"
	    		+ "– Quizora Team");

	    mailsender.send(message);
	    return "Verification code sent from Quizora ";
	    }
	   catch(MailException e) {
		   return "Something went wrong";
	   }
	}
	public boolean isNumber(String str) {
		try{Integer.parseInt(str);return true;}catch(NumberFormatException e) {return false;}
	}
	
	
	public int result(String uemail,long qid) {
		List<StudentAnswer> ans=sarp.findByUserEmailAndQuizId(uemail, qid);
		int i=0;
		for(StudentAnswer a:ans) {
			
			Question q=querp.findById(a.getQuestionId()).get();
			int correct=q.getCorrectOption();
			if(a.getSelectedOption()==correct) {
				i++;
			}
		}
		return i;
	}
	public List<StudentAnswer> getanswers(String email,long qid){
		List<StudentAnswer> ans=sarp.findByUserEmailAndQuizId(email, qid);
		return ans;
	}
	public List<Question> getquestions(long qid){
		List<Question> qns=querp.findByQuizId(qid);
		return qns;
	}
	
	public void findRank() {
		long rank=0;
		List<R4s> u=r4srp.findAllByOrderByScoreDesc();
		long prev=0;
		for(R4s r:u) {
			if(prev!=r.getHighestScore()) {
			rank+=1;}
			r.setRank(rank);
			prev=r.getHighestScore();
		}
		return ;
	}
	public void findRanksub() {
		long rank=0;
		List<submittedUsers> u=subrp.findAllByOrderByScoreDesc();
		long prev=0;
		for(submittedUsers r:u) {
			if(prev!=r.getScore()) {
			rank+=1;}
			r.setRank(rank);
			prev=r.getScore();
		}
		return ;
	}
}
