package com.example.demo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import jakarta.servlet.http.HttpSession;

@Controller
public class adminController2 {
	@Autowired
	quizRepository qrp;
	@Autowired
	QuestionRepository querp;
	@Autowired
	StudentAnswerRepository sarp;
	@Autowired
	sevice sr;
	@Autowired
	OtpRepository otrp;
	@Autowired
	takeQuizRepository trp;
	@Autowired
	submittedUsersRepository subrp;
	@Autowired
	adminRepository arp;
	@GetMapping("/viewQuiz")
	public String ViewAllQuizzes(ModelMap mp,HttpSession session) {
		if((String)session.getAttribute("adminName")==null) {return "redirect:/adminLog";}
		List<Quiz> quizzes=qrp.findAll();
		mp.put("quizzes", quizzes);
		return "AllQuizzes";
	}
	@GetMapping("/questions")
	
	public String questionsGet(long qid,ModelMap mp,HttpSession session) {
		if((String)session.getAttribute("adminName")==null) {return "redirect:/adminLog";}
		Quiz q=qrp.findById(qid).get();
		List<Question> question=q.getQuestions();
		mp.put("questions", question);
		return "questions";
	}
	@GetMapping("/submittedstu")
	public String submitstu(long qid,ModelMap mp,HttpSession session) {
		if((String)session.getAttribute("adminName")==null) {return "redirect:/adminLog";}
		List<submittedUsers> userssub=subrp.findByQuizId(qid);
		mp.put("subuser", userssub);
		return "submitteduse";
	}
	@GetMapping("/deleteQuestion")
	public String deltequ(long id,long quizid,HttpSession session)
	{if((String)session.getAttribute("adminName")==null) {return "redirect:/adminLog";}
		Question q=querp.findById(id).get();
		querp.delete(q);
		return "redirect:/questions?qid="+quizid;
	}
	/*@GetMapping("/updateQ")
	public String updateque(long questionId,long quizid)
	{
		Question q=querp.findById(questionId).get();
		
		querp.delete(q);
		return "redirect:/questions?qid="+quizid;
	}*/
	
	@PostMapping("/deleteQuiz")
	public String deleteQui(long qid) {
		Quiz q=qrp.findById(qid).get();
		if(q!=null) {
			qrp.delete(q);
		}
		return "redirect:/viewQuiz";
	}
	@PostMapping("updateQ")
	public String updateQui(long id,long quizid,ModelMap mp) {
		Question q=querp.findById(id).get();
		mp.put("question", q.getQuestion());
		mp.put("option1",q.getOption1());
		mp.put("option2",q.getOption2());
		mp.put("option3",q.getOption3());
		mp.put("option4",q.getOption4());
		mp.put("correct",q.getCorrectOption());
		mp.put("queid", q.getId());
		mp.put("quizid", quizid);
		return "updatequestion";
	}
	@PostMapping("/doChangeQue")
	public String doChange(String question,String option1,String option2,String option3,String option4,int correct,long id,long quizid)
	{
		Question q=querp.findById(id).get();
		
		
		q.setOption1(option1);
		q.setOption2(option2);
		q.setOption3(option3);
		q.setOption4(option4);
		q.setCorrectOption(correct);
		q.setQuestion(question);
		
		querp.save(q);
		return "redirect:/questions?qid="+quizid;
	}
	@GetMapping("/updateQuiz")
	public String upqui(long qid,ModelMap mp,HttpSession session) {
		if((String)session.getAttribute("adminName")==null) {return "redirect:/adminLog";}
		Quiz qz=qrp.findById(qid).get();
		mp.put("qid", qid);
		mp.put("title",qz.getTitle() );
		mp.put("desc", qz.getDescription());
		return "updatequiz";
	}
	@PostMapping("/docq")
	public String docq(String title,String description,long qid) {
		
		Quiz qz=qrp.findById(qid).get();
		qz.setTitle(title);
		qz.setDescription(description);
		qrp.save(qz);
		return "redirect:/viewQuiz";
	}
	@GetMapping("/allUsers")
	public String allUsERS(ModelMap mp,HttpSession session) {
		if((String)session.getAttribute("adminName")==null) {return "redirect:/adminLog";}
		List<Otp> us=otrp.findAll();
		mp.put("usersall", us);
		return "allUsers";
	}
	@PostMapping("/adminChecking")
	public String checkAd(String username,String password,HttpSession session) {
		
		if(!username.equals("vanjireIves") || !password.equals("Vanjire@2003") || username==null || password==null) {
			return "redirect:/adminLog";
		}
		session.setAttribute("adminName", username);
		return "redirect:/adminPannel";
	}
	@PostMapping("/adminStore")
	public String registerAd(String username ,String passowrd) {
		admin a=new admin();
		a.setPassword(passowrd);
		a.setUsername(username);
		arp.save(a);
		return "redirect:/adminLog";
	}
	@GetMapping("/adminLog")
	public String adddminlo() {
		return "adminLogin";
	}
	
}
