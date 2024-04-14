package com.spring.bookers.controllers;

import org.springframework.ui.Model;
import com.spring.bookers.models.Event;
import com.spring.bookers.models.User;
import com.spring.bookers.services.EventService;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;


import java.security.Principal;


@Controller
@RequiredArgsConstructor
public class EventController {

    private final EventService eventService;

    @GetMapping("/event")
    public String index(Model model, User user, Principal principal) {
        model.addAttribute("user", eventService.getUserByPrincipal(principal));
        model.addAttribute("events",eventService.getAllEvents());
        return "event";
    }

    @PostMapping("/addEvent")
    public String addEvent(Event event) {
        eventService.addEvent(event);
        return "redirect:/event";
    }
    @PostMapping("/deleteEvent/{eventId}")
    public String deleteTask(@PathVariable Long eventId) {
        eventService.deleteEvent(eventId);
        return "redirect:/event";
    }
}
