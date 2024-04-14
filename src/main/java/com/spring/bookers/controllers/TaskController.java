package com.spring.bookers.controllers;

import com.spring.bookers.models.Task;
import com.spring.bookers.repositories.TaskRepository;
import com.spring.bookers.services.TaskService;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import com.spring.bookers.models.User;
import org.springframework.web.bind.annotation.RequestParam;

import java.security.Principal;

@Controller
@RequiredArgsConstructor
public class TaskController {

    private final TaskService taskService;

    @GetMapping("/task")
    public String index(Model model, User user, Principal principal) {
        model.addAttribute("user", taskService.getUserByPrincipal(principal));
        model.addAttribute("tasks", taskService.getAllTasks());
        return "task";
    }

    @PostMapping("/addTask")
    public String addTask(Task task) {
        taskService.addTask(task);
        return "redirect:/task";
    }

    @PostMapping("/updateTaskStatus")
    public String updateTaskStatus(@RequestParam Long taskId, @RequestParam String newStatus) {
        taskService.updateTaskStatus(taskId, newStatus);
        return "redirect:/task";
    }
    @PostMapping("/deleteTask/{taskId}")
    public String deleteTask(@PathVariable Long taskId) {
        taskService.deleteTask(taskId);
        return "redirect:/task";
    }
}