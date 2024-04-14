package com.spring.bookers.controllers;


import com.spring.bookers.models.ChatMessage;

import com.spring.bookers.models.User;

import com.spring.bookers.services.ChatService;
import com.spring.bookers.services.UserService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;


import java.security.Principal;


@Controller
@RequiredArgsConstructor
public class ChatController {

    private final ChatService chatService;
    private final UserService userService;

    @GetMapping("/chat")
    public String index(Model model, User user, Principal principal) {
        model.addAttribute("user", chatService.getUserByPrincipal(principal));
        model.addAttribute("chat", chatService.getAllMessage());
        return "chat";
    }


    @PostMapping("/send")
    public String Send(Principal principal,ChatMessage message) {
        User sender = userService.getUserByEmail(principal.getName());
        chatService.addMessage(message,sender);
        return "redirect:/chat";
    }
    @PostMapping("/deleteChat/{messageId}")
    public String deleteTask(@PathVariable Long messageId) {
        chatService.deleteMessage(messageId);
        return "redirect:/chat";
    }
}
