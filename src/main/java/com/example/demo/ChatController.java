package com.example.demo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import jakarta.servlet.http.HttpSession;

@Controller
public class ChatController {

@Autowired
private SimpMessagingTemplate messagingTemplate;

@MessageMapping("/private")
public void send(ChatMessage message){
System.out.println(message.getReceiver());

messagingTemplate.convertAndSendToUser(
message.getReceiver(),
"/queue/messages",
message
);

}
@GetMapping("/chat")
public String chatBox(@RequestParam("id") String id,HttpSession session,ModelMap mp) {
	String uid=(String)session.getAttribute("uemail");
	mp.put("sender", uid);
	mp.put("receiver", id);
	return "chat";
}
}