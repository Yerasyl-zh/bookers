package com.spring.bookers.services;

import com.spring.bookers.models.ChatMessage;
import com.spring.bookers.models.Project;
import com.spring.bookers.models.User;
import com.spring.bookers.repositories.ChatMessageRepository;
import com.spring.bookers.repositories.UserRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.security.Principal;
import java.time.LocalDateTime;
import java.util.List;

@Service
@Slf4j
@RequiredArgsConstructor
public class ChatService {
    private final UserRepository userRepository;
    private final ChatMessageRepository chatMessageRepository;
    public List<ChatMessage> getAllMessage(){return chatMessageRepository.findAll();}
    public void addMessage(ChatMessage message, User sender) {
        message.setTimestamp(LocalDateTime.now());
        message.setSender(sender);
        chatMessageRepository.save(message);
    }
    public void deleteMessage(Long messageId) {
        chatMessageRepository.deleteById(messageId);
    }


    public User getUserByPrincipal(Principal principal) {
        if (principal == null) return new User();
        return userRepository.findByEmail(principal.getName());
    }

}
