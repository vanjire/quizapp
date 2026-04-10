package com.example.demo;
import org.springframework.context.annotation.Configuration;
import org.springframework.messaging.simp.config.MessageBrokerRegistry;
import org.springframework.web.socket.config.annotation.*;
import org.springframework.web.socket.server.support.HttpSessionHandshakeInterceptor;

@Configuration
@EnableWebSocketMessageBroker
public class WebSocketConfig implements WebSocketMessageBrokerConfigurer {

    @Override
    public void configureMessageBroker(MessageBrokerRegistry config) {

    	config.enableSimpleBroker("/topic", "/queue"); // Remove /user from here
    	config.setApplicationDestinationPrefixes("/app");
    	config.setUserDestinationPrefix("/user");
    }

    @Override
    public void registerStompEndpoints(StompEndpointRegistry registry) {
        registry.addEndpoint("/chat")
                .addInterceptors(new HttpSessionHandshakeInterceptor()) // THIS IS THE BRIDGE
                .setHandshakeHandler(new MyHandshakeHandler()) 
                .withSockJS();
    }
}