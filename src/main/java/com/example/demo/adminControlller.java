package com.example.demo;


import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@Controller
public class adminControlller {
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
R4sRepository r4srp;
@Autowired
calculate cl;
@Autowired
notifiRepo nrp;
@Autowired
sevice sv;
@GetMapping("/createQuiz")
public String createQuiz(HttpServletResponse response) {
	response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
	response.setHeader("Pragma", "no-cache");
	response.setDateHeader("Expires", 0);
	return "quizForm";
}
@GetMapping("/adminPannel")
public String adminPannel(HttpSession session,HttpServletResponse response) {
	if((String)session.getAttribute("adminName")==null) {return "redirect:/adminLog";}
	response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
	response.setHeader("Pragma", "no-cache");
	response.setDateHeader("Expires", 0);
	return "admin";
}
@PostMapping("/saveQuize")
public String saveQuiz(String title,String description,int timeq,String []question,String []option1,String []option2,
		String []option3,String []option4,int []correctOption,HttpServletResponse response,HttpSession session)
		
{		if((String)session.getAttribute("uemail")==null) {return "redirect:/uLogin";}
	int numberq=question.length;
	Quiz q=new Quiz();
		q.setTitle(title);
		q.setDescription(description);
		q.setNumOfQuestion(numberq);
		q.setTimeOfq(timeq);
		
		for(int i=0;i<question.length;i++) {
			Question qn=new Question();
			qn.setQuestion(question[i]);
			qn.setOption1(option1[i]);
			qn.setOption2(option2[i]);
			qn.setOption3(option3[i]);
			qn.setOption4(option4[i]);
			qn.setCorrectOption(correctOption[i]);
			qn.setQuiz(q);
			//qn.setQuizId(q.getId());
			q.getQuestions().add(qn);
			//querp.save(qn);
		}
		qrp.save(q);
		response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
		response.setHeader("Pragma", "no-cache");
		response.setDateHeader("Expires", 0);
		return "admin";
}
@GetMapping("/startQuiz")

public String startQuiz(long qid,ModelMap mp,HttpSession session,HttpServletResponse response) {
	if((String)session.getAttribute("uemail")==null) {return "redirect:/uLogin";}
	List<Question> questions=(List<Question>)querp.findByQuizId(qid);
	submittedUsers usub=subrp.findByUserEmailAndQuizId((String)session.getAttribute("uemail"), qid);
	if(usub!=null) {
		response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
		response.setHeader("Pragma", "no-cache");
		response.setDateHeader("Expires", 0);
		return "redirect:/result?qid="+qid;
	}
	Quiz q=qrp.findById(qid).get();
	
	mp.put("timeq", q.getTimeOfq());
	mp.put("title", q.getTitle());
	mp.put("qid", q.getId());
	mp.put("questions", questions);
	response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
	response.setHeader("Pragma", "no-cache");
	response.setDateHeader("Expires", 0);
	return "start_quiz";
}
@GetMapping("/getQuiz")
public String getQuiz(HttpSession session,HttpServletResponse response) {
	if((String)session.getAttribute("uemail")==null) {return "redirect:/uLogin";}
	response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
	response.setHeader("Pragma", "no-cache");
	response.setDateHeader("Expires", 0);
	return "getq";
}
//students
@PostMapping("/getAnswers")

public String getAnswer(@RequestParam("questionID") String[] questionID,@RequestParam("quizeID") String quizeID,HttpServletRequest request,HttpSession session,HttpServletResponse resp, HttpServletResponse response) {
	if((String)session.getAttribute("uemail")==null) {return "redirect:/uLogin";}
	long quizid=Long.parseLong(quizeID);
	int selectedOpt;
	String email=(String)session.getAttribute("uemail");
	submittedUsers suse=subrp.findByUserEmailAndQuizId(email, quizid);
	if(suse!=null) {
		response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
		response.setHeader("Pragma", "no-cache");
		response.setDateHeader("Expires", 0);
		return "redirect:/result?qid="+quizid;
	}
	
	for(String id:questionID) {
		String uemail=(String)session.getAttribute("uemail");
		String selectedValue= request.getParameter("answer"+id);
		if (selectedValue==null) {selectedOpt=0;}
		else { selectedOpt=Integer.parseInt(selectedValue);}
		Question question=querp.findById(Long.parseLong(id)).get();
		StudentAnswer sa=new StudentAnswer();
		sa.setQuestionId(Long.parseLong(id));
		
		sa.setSelectedOption(selectedOpt);
		sa.setUserEmail(uemail);
		sa.setQuizId(quizid);
		sarp.save(sa);
	}
	
submittedUsers us=new submittedUsers();
us.setQuizId(quizid);
us.setUserEmail(email);
us.setName(r4srp.findByUserEmail(email).getName());
int mark=sr.result(email, quizid);

us.setScore(mark);

subrp.save(us);
	R4s user=r4srp.findByUserEmail(email);
	
	if(user==null) {user=new R4s(); user.setUserEmail(email);}
	user.setAverageScore(cl.averageScore(email));
	user.setHighestScore(cl.maxScore(email));
	user.setQuizzesSolved(cl.totalQuizzesSolved(email));
	user.setScore(cl.totalScore(email));
	r4srp.save(user);
	
	
	
	response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
	response.setHeader("Pragma", "no-cache");
	response.setDateHeader("Expires", 0);
	
	return "redirect:/result?qid="+quizid;
	
	

	}
@GetMapping("/result")

public String result(@RequestParam(defaultValue = "0") int page,long qid,HttpSession session,ModelMap mp,HttpServletResponse response) {
	if((String)session.getAttribute("uemail")==null){return "redirect:/uLogin";}
	String em=(String) session.getAttribute("uemail");
	//int mark=sr.result(em, qid);
	
	R4s user=r4srp.findByUserEmail(em);
	submittedUsers s=subrp.findByUserEmailAndQuizId(em,qid);
	s.setName(user.getName());
	if(user.getProfilePhoto()!=null) {
	s.setProfilePhoto(user.getProfilePhoto());
	subrp.save(s);}
	long mark=subrp.findByUserEmailAndQuizId(em, qid).getScore();
	
	Quiz q=qrp.findById(qid).get();
	
	mp.put("marks", mark);
	mp.put("qid", qid);
	mp.put("qnum", q.getNumOfQuestion());
	
	int size =2;//two also update in rank calculation
	Pageable pageable=PageRequest.of(page, size);
	Page<submittedUsers> leaders=subrp.findByQuizIdOrderByScoreDesc(qid, pageable);
	
	long rank=subrp.findUserRank(em,qid);
	 
	long participants=subrp.countByQuizId(qid);

	long maxScore=subrp.getMaxScoreOfQuiz(qid);
	
	long sumOfAll=subrp.sumOfQuiz(qid);
	
	mp.put("averagescore", sumOfAll/participants);
	
	mp.put("topscore", maxScore);
	mp.put("participants", participants);
	mp.put("leaders", leaders.getContent());
	mp.addAttribute("currentPage", page);
    mp.addAttribute("totalPages", leaders.getTotalPages());
    mp.put("urank", rank);
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
	response.setHeader("Pragma", "no-cache");
	response.setDateHeader("Expires", 0);
    return "result";
	
}
@GetMapping("/viewDetail")
public String viewde(long qid,HttpSession session,ModelMap mp,HttpServletResponse response) {
	if((String)session.getAttribute("uemail")==null){return "redirect:/uLogin";}
	String em=(String) session.getAttribute("uemail");
	mp.put("answers", sr.getanswers(em, qid));
	mp.put("questions", sr.getquestions(qid));
	response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
	response.setHeader("Pragma", "no-cache");
	response.setDateHeader("Expires", 0);
	return "viewDetail";
}
@GetMapping("/uLogin")
public String login() {
	return "userLogin";
}
	

	@PostMapping("/loginEmail")
	public String loginEmail(String email,RedirectAttributes ra,HttpServletResponse response) {
		if (!email.matches("^[A-Za-z0-9+_.-]+@[A-Za-z0-9.-]+$")) {
	        ra.addFlashAttribute("msg","Invalid Email");
	        response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
	    	response.setHeader("Pragma", "no-cache");
	    	response.setDateHeader("Expires", 0);
	        return "redirect:/uLogin";
	    }
		if(email.length()>150) {
			 ra.addFlashAttribute("msg","Email must be less than 150 characters");
		        response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
		    	response.setHeader("Pragma", "no-cache");
		    	response.setDateHeader("Expires", 0);
		        return "redirect:/uLogin";
		}
		String pass=sr.generateAutoPassword();
		Otp ot=otrp.findByEmail(email);
		if(ot!=null) {
			otrp.delete(ot);
		}
		Otp otp=new Otp();
		otp.setEmail(email);
		otp.setOtp(pass);
		
		otrp.save(otp);
		String msg=sr.sendPasswordToEmail(email, pass);
		 ra.addFlashAttribute("email", email);
		 ra.addFlashAttribute("showVerify",true);
		 ra.addFlashAttribute("msg", msg);
		
		 response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
			response.setHeader("Pragma", "no-cache");
			response.setDateHeader("Expires", 0);
		return "redirect:/uLogin";
	}
	@PostMapping("/verify")

	public String verify(String vcode,String email,HttpSession session,RedirectAttributes ra,HttpServletResponse response) {
		
		try{if(!sr.isNumber(vcode)) {
			 ra.addFlashAttribute("email", email);
			
			 ra.addFlashAttribute("msg", "Invalid Quizora code");
			 response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
				response.setHeader("Pragma", "no-cache");
				response.setDateHeader("Expires", 0);
			return "redirect:/uLogin";
		}
		Otp otp=otrp.findByEmail(email);
		
		if(vcode.equals(otp.getOtp())&& vcode!=null) {
			session.setAttribute("uemail", email);
			R4s ru=r4srp.findByUserEmail(email);
			if(ru==null) {
			R4s r=new R4s();
			//r.setName(name);
			r.setUserEmail(email);
			r.setJoinDate(LocalDateTime.now());
			r4srp.save(r);}
			otp.setOtp(null);
			otrp.save(otp);
			response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
			response.setHeader("Pragma", "no-cache");
			response.setDateHeader("Expires", 0);
			if(ru==null) {return "redirect:/getname";}
			return "redirect:/dashboard";
		}
		 ra.addFlashAttribute("msg", "Invalid Quizora code");
		 ra.addFlashAttribute("email", email);
		
		 response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
			response.setHeader("Pragma", "no-cache");
			response.setDateHeader("Expires", 0);
		return "redirect:/uLogin";}
		catch(Exception e) {
			 ra.addFlashAttribute("msg", "Invalid Quizora code");
			
			 ra.addFlashAttribute("email", email);
			 response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
				response.setHeader("Pragma", "no-cache");
				response.setDateHeader("Expires", 0);
			 return "redirect:/uLogin";
		}
		
	}
	@GetMapping("/getname")
	public String getNAme(@RequestParam(required=false)String msg,HttpSession session,ModelMap mp) {
		if((String)session.getAttribute("uemail")==null){return "redirect:/uLogin";}
		mp.put("msg",msg);
		return "getname";
	}
	@PostMapping("/saveName")
	public String saveName(String name,ModelMap mp,HttpSession session) {
		if((String)session.getAttribute("uemail")==null){return "redirect:/uLogin";}
		if(name==null) {
			
			return "redirect:/getname?msg=Name required";
		}
		if(name.length()>20) {
			
			return "redirect:/getname?msg=Name must be less than 20 characters";
		}
		R4s ru=r4srp.findByUserEmail((String)session.getAttribute("uemail"));
		ru.setName(name);
		r4srp.save(ru);
		return "redirect:/dashboard";
	}
	@PostMapping("/addQuiz")
	@ResponseBody
	public String addQui(long qid,HttpServletResponse response) {
		takeQUiz tk=new takeQUiz();
		Quiz q=qrp.findById(qid).get();
		
		tk.setQuiz(q);
		tk.setTitle(q.getTitle());
		tk.setNumOfQuestion(q.getNumOfQuestion());
		trp.save(tk);
		notifiUsers noty=new notifiUsers();
		noty.setType("announcement");
		noty.setMassage("🆕 New Quiz Added: “"+q.getTitle()+"” – Test your skills now!");
		noty.setRead(false);
		noty.setCreatedAt(LocalDateTime.now());
		noty.setUserId(null);
		nrp.save(noty);
		response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
		response.setHeader("Pragma", "no-cache");
		response.setDateHeader("Expires", 0);
		return "sucess";
	}
	@GetMapping("/home")
	
	public String Home(ModelMap mp,HttpSession session,HttpServletResponse response) {
		if((String)session.getAttribute("uemail")==null){return "redirect:/uLogin";}
		takeQUiz tk=trp.findTopByOrderByIdDesc();
		mp.put("quiz", tk);
		response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
		response.setHeader("Pragma", "no-cache");
		response.setDateHeader("Expires", 0);
		return "home";
	}
	
	@GetMapping("/toStarts")
	public String toStart(ModelMap mp,HttpSession session,HttpServletResponse response) {
		if((String)session.getAttribute("uemail")==null){return "redirect:/uLogin";}
		List<takeQUiz> tk=trp.findAllByOrderByIdDesc();
		mp.put("quiz", tk);
		response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
		response.setHeader("Pragma", "no-cache");
		response.setDateHeader("Expires", 0);
		return "toStart";
		
	}
	@GetMapping("/dashboard")
	public String dashboard( Model model,ModelMap mp,HttpSession session,HttpServletResponse response) {
		String ue=(String)session.getAttribute("uemail");
		if(ue==null) {return "redirect:/uLogin";}
		R4s user=r4srp.findByUserEmail(ue);
		long totaluser=r4srp.countAllUsers();
		long participants=subrp.countDistinctUsers();
		long totalquizzes=qrp.totalQuizzes();
		long topscore=r4srp.findTopScore();
		mp.put("topscore", topscore);
		mp.put("totalquizzes", totalquizzes);
		mp.put("participants", participants);
		mp.put("rank", cl.rank(ue));
		mp.put("totalScore",user.getScore() );
		mp.put("averageScore", user.getAverageScore());
		mp.put("highestScore", user.getHighestScore());
		mp.put("solvedQuizzes", user.getQuizzesSolved());
		mp.put("totaluser", totaluser);
		mp.put("tier", user.getTier());
		mp.put("name", user.getName());
		mp.put("profileImage", user.getProfilePhoto());
		mp.put("username", user.getName());
		mp.put("userId", user.getUserEmail());
		/*int size = 1; // 10 users per page also update in rank calculation
		
	    Pageable pageable = PageRequest.of(page, size);
	    
	    Page<R4s> leaderPage = r4srp.findAllByOrderByScoreDesc(pageable);
	    
	    model.addAttribute("leaders", leaderPage.getContent());
	    model.addAttribute("currentPage", page);
	    model.addAttribute("totalPages", leaderPage.getTotalPages());*/
		response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
		response.setHeader("Pragma", "no-cache");
		response.setDateHeader("Expires", 0);
		return "dashboard";
	}
	@GetMapping("/")
	public String dashboardhome( Model model,ModelMap mp,HttpSession session,HttpServletResponse response) {
		String ue=(String)session.getAttribute("uemail");
		if(ue==null) {return "redirect:/uLogin";}
		R4s user=r4srp.findByUserEmail(ue);
		long totaluser=r4srp.countAllUsers();
		long participants=subrp.countDistinctUsers();
		long totalquizzes=qrp.totalQuizzes();
		long topscore=r4srp.findTopScore();
		mp.put("topscore", topscore);
		mp.put("totalquizzes", totalquizzes);
		mp.put("participants", participants);
		mp.put("rank", cl.rank(ue));
		mp.put("totalScore",user.getScore() );
		mp.put("averageScore", user.getAverageScore());
		mp.put("highestScore", user.getHighestScore());
		mp.put("solvedQuizzes", user.getQuizzesSolved());
		mp.put("totaluser", totaluser);
		mp.put("tier", user.getTier());
		mp.put("name", user.getName());
		mp.put("profileImage", user.getProfilePhoto());
		mp.put("username", user.getName());
		mp.put("userId", user.getUserEmail());
		/*int size = 1; // 10 users per page also update in rank calculation
		
	    Pageable pageable = PageRequest.of(page, size);
	    
	    Page<R4s> leaderPage = r4srp.findAllByOrderByScoreDesc(pageable);
	    
	    model.addAttribute("leaders", leaderPage.getContent());
	    model.addAttribute("currentPage", page);
	    model.addAttribute("totalPages", leaderPage.getTotalPages());*/
		response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
		response.setHeader("Pragma", "no-cache");
		response.setDateHeader("Expires", 0);
		return "dashboard";
	}
	
}
