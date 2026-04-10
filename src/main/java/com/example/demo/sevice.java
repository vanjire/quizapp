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
	    message.setSubject("Your Login Password");
	    message.setText("Your generated password is: " + password +
	                    "\nPlease change it after login.");

	    mailsender.send(message);
	    return "Please check your email for the verification code";
	    }
	   catch(MailException e) {
		   return "Sending failed";
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
}
