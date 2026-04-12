package com.example.demo;

import java.io.File;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@Controller
public class UserController {
	@Autowired
	R4sRepository r4srp;
	@Autowired
	submittedUsersRepository subrp;
@GetMapping("/UserProfile")
public String userProf(@RequestParam(required=false)String msg,HttpSession session,ModelMap mp,HttpServletResponse response) {
	if((String)session.getAttribute("uemail")==null) {return "redirect:/uLogin";}
	R4s us=r4srp.findByUserEmail((String)session.getAttribute("uemail"));
	mp.put("username", us.getName());
	mp.put("fullname", us.getFullName());
	mp.put("useremail", us.getUserEmail());
	mp.put("userbio",us.getBio());
	mp.put("userjoinedDate", us.getJoinDate().toString());
	mp.put("userlocation", us.getCountry());
	response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
	response.setHeader("Pragma", "no-cache");
	response.setDateHeader("Expires", 0);
	if(msg!=null) {
	mp.put("ferror", msg);}
	return "profile";
}
@PostMapping("/saveProfile")

public String userProfile(String name,String fullName,String bio,String country,
        MultipartFile file,HttpSession session,HttpServletResponse response,ModelMap mp) throws Exception {
	if((String)session.getAttribute("uemail")==null) {return "redirect:/uLogin";}
	
	
if(file!=null && !file.isEmpty()) {
	// Check MIME
	if (!file.getContentType().startsWith("image/")) {
		
	    return "redirect:/UserProfile?msg=Only images allowed";
	}

	// Check extension
	String fileName = file.getOriginalFilename().toLowerCase();

	if (!(fileName.endsWith(".png") || 
	      fileName.endsWith(".jpg") || 
	      fileName.endsWith(".webp")||
	      fileName.endsWith(".jpeg"))) {
		
	    return "redirect:/UserProfile?msg=Only PNG, JPG, JPEG , WEBP allowed";
	}
	if (file.getSize() > 2 * 1024 * 1024) {
		
	    return "redirect:/UserProfile?msg=file must be less than 2Mb";
	}
	
}
if(bio.length()>300) {
	 return "redirect:/UserProfile?msg=Bio must be less than 300 characters";
}
if(name.length()>20) {
	return "redirect:/UserProfile?msg=Name must be less than 20 characters";
}
if(fullName.length()>50) {
	return "redirect:/UserProfile?msg=FullName must be less than 50 characters";
}
if(country.length()>56) {
	return "redirect:/UserProfile?msg=Country must be less than 56 characters";
}
    String uploadDir = "upload";

    R4s u = r4srp.findByUserEmail((String)session.getAttribute("uemail"));

    long ui = u.getId();

    if (file != null && !file.isEmpty()) {

       
        String oldImage = u.getProfilePhoto();

        if (oldImage != null) {
            File oldFile = new File(uploadDir + File.separator + oldImage);
            if (oldFile.exists()) {
                oldFile.delete();
                
            }
        }

        // Create folder if not exists
        File folder = new File(uploadDir);
        if (!folder.exists()) {
            folder.mkdirs();
        }

        // Create new filename
        String filename = ui + "_" + System.currentTimeMillis() + "_" + file.getOriginalFilename();

        // Save new file
        Path path = Paths.get(uploadDir, filename);
        Files.write(path, file.getBytes());

        // Set new image
        u.setProfilePhoto(filename);
    }

    u.setName(name);
    u.setFullName(fullName);
    u.setBio(bio);
    u.setCountry(country);

    r4srp.save(u);
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
    response.setHeader("Pragma", "no-cache");
    response.setDateHeader("Expires", 0);
    return "redirect:/dashboard";
}
@GetMapping("/viewProfile")
public String viewProf(HttpSession session,ModelMap mp,HttpServletResponse response) {
	if((String)session.getAttribute("uemail")==null) {return "redirect:/uLogin";}
	R4s us=r4srp.findByUserEmail((String)session.getAttribute("uemail"));
	mp.put("username", us.getName());
	mp.put("fullname", us.getFullName());
	mp.put("useremail", us.getUserEmail());
	mp.put("userbio",us.getBio());
	mp.put("userjoinedDate", us.getJoinDate().getDayOfMonth());
	mp.put("userlocation", us.getCountry());
	mp.put("profileImage", us.getProfilePhoto());
	response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
	response.setHeader("Pragma", "no-cache");
	response.setDateHeader("Expires", 0);
	return "viewProfile";
}
@GetMapping("/userInfo")
public String friendProf(String uId,ModelMap mp,HttpServletResponse response,HttpSession session) {
	if((String)session.getAttribute("uemail")==null) {return "redirect:/uLogin";}
	R4s us=r4srp.findByUserEmail(uId);
	mp.put("name", us.getName());
	mp.put("fullname", us.getFullName());
	mp.put("location", us.getCountry());
	mp.put("bio", us.getBio());
	mp.put("joinedTime", us.getJoinDate().getDayOfMonth());
	mp.put("profileImage", us.getProfilePhoto());
	mp.put("userId", uId);
	mp.put("rank", r4srp.getUserRank(uId));
	mp.put("score", r4srp.findByUserEmail(uId).getScore());
	response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
	response.setHeader("Pragma", "no-cache");
	response.setDateHeader("Expires", 0);
	return "friendProf";
}
@GetMapping("/logout")
public String logoutl(HttpSession session,HttpServletResponse response) {
	if((String)session.getAttribute("uemail")==null) {return "redirect:/uLogin";}
	session.removeAttribute("uemail");
	response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
	response.setHeader("Pragma", "no-cache");
	response.setDateHeader("Expires", 0);
	return "redirect:/dashboard";
}
@GetMapping("/searchUsers")
public String searchPage(HttpSession session) {
	if((String)session.getAttribute("uemail")==null) {return "redirect:/uLogin";}
    return "searchUsers";
}
@GetMapping("/searchUsers2")
public String searchPage2(long qid,HttpSession session,ModelMap mp) {
	if((String)session.getAttribute("uemail")==null) {return "redirect:/uLogin";}
	mp.put("qid", qid);
    return "searchUser2";
}
@GetMapping("/api/searchUsers")
@ResponseBody
public List<R4s> searchUsers(@RequestParam String query) {
	
    return r4srp
        .findByNameContainingIgnoreCaseOrUserEmailContainingIgnoreCase(query, query);
}
@GetMapping("/api/searchUsers2")
@ResponseBody
public List<submittedUsers> searchUsers2(@RequestParam String query) {
	
    return subrp
        .findByNameContainingIgnoreCaseOrUserEmailContainingIgnoreCase(query, query);
}
@GetMapping("/userInfo2")
public String friendProf2(String uId,long qid,ModelMap mp,HttpServletResponse response,HttpSession session) {
	if((String)session.getAttribute("uemail")==null) {return "redirect:/uLogin";}
	R4s us=r4srp.findByUserEmail(uId);
	mp.put("name", us.getName());
	mp.put("fullname", us.getFullName());
	mp.put("location", us.getCountry());
	mp.put("bio", us.getBio());
	mp.put("joinedTime", us.getJoinDate().getDayOfMonth());
	mp.put("profileImage", us.getProfilePhoto());
	mp.put("userId", uId);
	mp.put("rank", subrp.findUserRank(uId, qid));
	mp.put("qid", qid);
	mp.put("score", subrp.findByUserEmailAndQuizId(uId, qid).getScore());
	response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
	response.setHeader("Pragma", "no-cache");
	response.setDateHeader("Expires", 0);
	return "friendProf";
}
}
