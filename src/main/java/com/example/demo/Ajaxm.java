package com.example.demo;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import jakarta.servlet.http.HttpSession;

@RestController
@RequestMapping("/api")
public class Ajaxm {
	@Autowired
	R4sRepository r4srp;
	@Autowired
	notifiRepo nrp;
	@Autowired
	quizRepository qrp;
	@Autowired
	submittedUsersRepository subrp;
	@Autowired
	calculate cl;
	@Autowired
	takeQuizRepository tqrp;
@GetMapping("/leaders")
	
	public Page<R4s> leaders( @RequestParam int page,HttpSession session) {
int size = 10; // 10 users per page also update in rank calculation
		
	    Pageable pageable = PageRequest.of(page, size,Sort.by(Sort.Order.desc("score"),Sort.Order.asc("id")));
	    
	   R4s us=r4srp.findByUserEmail((String) session.getAttribute("uemail") );
	    
	   us.setLastActive(System.currentTimeMillis());
	   r4srp.save(us);
	  
		return  r4srp.findAll(pageable);
	}
@GetMapping("/NotificationsCount")
public Long count(HttpSession session) {
String usId=(String) session.getAttribute("uemail");
long count=nrp.countUnread(usId);
return count;
}
@GetMapping("/NotificationsList")
public List<notifiUsers> notiList(HttpSession session){
	String usId=(String) session.getAttribute("uemail");
	
	return nrp.messages(usId);
}
@PostMapping("/NotificationsMarkRead")
public void notiRead(HttpSession session){
	String usId=(String) session.getAttribute("uemail");
	nrp.markAsRead(usId);
	return ;
}
@GetMapping("/getqStatus")
public Map<String ,Object>getqstatus(HttpSession session){
	 String ue=(String)session.getAttribute("uemail");
		//if(ue==null) {return "redirect:/uLogin";}
		R4s user=r4srp.findByUserEmail(ue);
		long totaluser=r4srp.countAllUsers();
		long participants=subrp.countDistinctUsers();
		long totalquizzes=qrp.totalQuizzes();
		long topscore=r4srp.findTopScore();
		Map<String , Object> response=new HashMap<>();
		response.put("totaluser", totaluser);
		response.put("participants", participants);
		response.put("totalquizzes",totalquizzes);
		response.put("topscore", topscore);
		response.put("rank", cl.rank(ue));
		return response;
}

@GetMapping("/quizPage")

public Page<takeQUiz> getQuizPage(
        @RequestParam int page,
        @RequestParam(required=false) String search){

    Pageable pageable = PageRequest.of(page,1);


    if(search == null || search.trim().isEmpty()||search.equalsIgnoreCase("null")){
    	Page<takeQUiz> tk=tqrp.findAll(pageable);
    	
        return tqrp.findAll(pageable);
    }

    return tqrp.findByTitleContainingIgnoreCase(search, pageable);
}

@GetMapping("/leadersquiz")
public Page<submittedUsers> getQuizLeaderPage(long qid,int page){
	Pageable pageable=PageRequest.of(page, 1,Sort.by(Sort.Order.desc("score"),Sort.Order.asc("id")));
	return subrp.findByQuizId(qid, pageable);
}
@GetMapping("/statusquiz")
public Map<String,Object> statusQuiz(long qid,HttpSession session){
	String em=(String)session.getAttribute("uemail");
	Quiz q=qrp.findById(qid).get();
	long rank=subrp.findUserRank(em,qid);
	long participants=subrp.countByQuizId(qid);
	long maxScore=subrp.getMaxScoreOfQuiz(qid);
	long sumOfAll=subrp.sumOfQuiz(qid);
	Map<String , Object> mp=new HashMap<>();
	mp.put("averagescore",participants==0?0: sumOfAll/participants);
	
	mp.put("topscore", maxScore);
	mp.put("participants", participants);
	mp.put("qnum", q.getNumOfQuestion());
	 mp.put("urank", rank);
	 return mp;
}
}
