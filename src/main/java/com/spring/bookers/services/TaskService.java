package com.spring.bookers.services;

import com.spring.bookers.models.Task;
import com.spring.bookers.models.User;
import com.spring.bookers.repositories.TaskRepository;

import com.spring.bookers.repositories.UserRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.security.Principal;
import java.util.List;
@Service
@Slf4j
@RequiredArgsConstructor
public class TaskService {
    private final UserRepository userRepository;
    private final TaskRepository taskRepository;

    public List<Task> getAllTasks() {
        return taskRepository.findAll();
    }

    public void addTask(Task task) {
        taskRepository.save(task);
    }
    public void deleteTask(Long taskId) {
        taskRepository.deleteById(taskId);
    }
    public void updateTaskStatus(Long taskId, String newStatus) {
        Task task = taskRepository.findById(taskId).orElse(null);
        if (task != null) {
            task.setStatus(newStatus);
            taskRepository.save(task);
        }
    }

    public User getUserByPrincipal(Principal principal) {
        if (principal == null) return new User();
        return userRepository.findByEmail(principal.getName());
    }
}