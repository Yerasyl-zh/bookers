package com.spring.bookers.services;

import com.spring.bookers.models.Event;
import com.spring.bookers.models.User;
import com.spring.bookers.repositories.EventRepository;
import com.spring.bookers.repositories.UserRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.security.Principal;
import java.util.List;

@Service
@Slf4j
@RequiredArgsConstructor
public class EventService {
    private final EventRepository eventRepository;
    private final UserRepository userRepository;


    public List<Event> getAllEvents() {return eventRepository.findAll();
    }
    public User getUserByPrincipal(Principal principal) {
        if (principal == null) return new User();
        return userRepository.findByEmail(principal.getName());
    }
    public void addEvent(Event event) {
        eventRepository.save(event);
    }
    public void deleteEvent(Long eventId) {
        eventRepository.deleteById(eventId);
    }

}
