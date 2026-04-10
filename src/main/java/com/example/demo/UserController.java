package com.example.demo;

import java.io.File;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;



import jakarta.servlet.http.HttpSession;

@Controller
public class UserController {
	@Autowired
	R4sRepository r4srp;
	@Autowired
	submittedUsersRepository subrp;
@GetMapping("/UserProfile")
public String userProf(HttpSession session,ModelMap mp) {
	R4s us=r4srp.findByUserEmail((String)session.getAttribute("uemail"));
	mp.put("username", us.getName());
	mp.put("fullname", us.getFullName());
	mp.put("useremail", us.getUserEmail());
	mp.put("userbio",us.getBio());
	mp.put("userjoinedDate", us.getJoinDate().toString());
	mp.put("userlocation", us.getCountry());
	return "profile";
}
@PostMapping("/saveProfile")

public String userProfile(String name,String fullName,String bio,String country,MultipartFile file,HttpSession session) throws Exception{
	String uploadDir="/upload";
	
	R4s u=r4srp.findByUserEmail((String)session.getAttribute("uemail"));
	
	
	String ue=(String)session.getAttribute("uemail");
	
	long ui=u.getId();
	 File folder = new File("upload");
	    if (!folder.exists()) {
	        folder.mkdirs();
	    }

	    // Create filename
	    String filename = ui+" "+System.currentTimeMillis()+ "_" + file.getOriginalFilename();

	    // Save file
	    Path path = Paths.get("upload", filename);
	   Files.write(path,file.getBytes());

	u.setName(name);      
	u.setFullName(fullName);
	u.setBio(bio);
	u.setCountry(country);
	u.setProfilePhoto(filename);
	submittedUsers subuser=subrp.findByUserEmail(ue);
	
	if(subuser!=null) {
		subuser.setProfilePhoto(filename);
	subrp.save(subuser);}
	r4srp.save(u);
	return "redirect:/dashboard";
}
@GetMapping("/viewProfile")
public String viewProf(HttpSession session,ModelMap mp) {
	R4s us=r4srp.findByUserEmail((String)session.getAttribute("uemail"));
	mp.put("username", us.getName());
	mp.put("fullname", us.getFullName());
	mp.put("useremail", us.getUserEmail());
	mp.put("userbio",us.getBio());
	mp.put("userjoinedDate", us.getJoinDate().getDayOfMonth());
	mp.put("userlocation", us.getCountry());
	mp.put("profileImage", us.getProfilePhoto());
	return "viewProfile";
}
@GetMapping("/userInfo")
public String friendProf(String uId,ModelMap mp) {
	R4s us=r4srp.findByUserEmail(uId);
	mp.put("name", us.getName());
	mp.put("fullname", us.getFullName());
	mp.put("location", us.getCountry());
	mp.put("bio", us.getBio());
	mp.put("joinedTime", us.getJoinDate().getDayOfMonth());
	mp.put("profileImage", us.getProfilePhoto());
	mp.put("userId", uId);
	return "friendProf";
}
}
