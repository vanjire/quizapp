package com.example.demo;

import java.security.Principal;
import java.util.Map;
import org.springframework.http.server.ServerHttpRequest;
import org.springframework.http.server.ServletServerHttpRequest;
import org.springframework.web.socket.WebSocketHandler;
import org.springframework.web.socket.server.support.DefaultHandshakeHandler;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

public class MyHandshakeHandler extends DefaultHandshakeHandler {
    @Override
    protected Principal determineUser(ServerHttpRequest request,
                                      WebSocketHandler wsHandler,
                                      Map<String, Object> attributes) {

        // The HttpSessionHandshakeInterceptor puts session attributes here automatically
        String user = (String) attributes.get("uemail");

        if (user == null) {
            // Log this to your console to see if it's failing!
            System.out.println("DEBUG: uemail not found in session attributes!");
            user = "guest_" + System.currentTimeMillis();
        } else {
            System.out.println("DEBUG: Handshake successful for: " + user);
        }

        String finalUser = user;
        return () -> finalUser;
    }
}
