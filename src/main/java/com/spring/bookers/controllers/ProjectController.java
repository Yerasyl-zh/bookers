package com.spring.bookers.controllers;

import com.spring.bookers.models.Project;
import com.spring.bookers.models.User;
import com.spring.bookers.services.ProjectService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.security.Principal;

@Controller
@RequiredArgsConstructor
public class ProjectController {
    private final ProjectService projectService;

    @GetMapping("/")
    public String projects(@RequestParam(name = "searchWord", required = false) String title, Principal principal, Model model) {
        model.addAttribute("projects", projectService.listProject(title));
        model.addAttribute("user", projectService.getUserByPrincipal(principal));
        model.addAttribute("searchWord", title);
        return "projects";
    }

    @GetMapping("/project/{id}")
    public String projectInfo(@PathVariable Long id, Model model, Principal principal) {
        Project project = projectService.getProjectById(id);
        model.addAttribute("user", projectService.getUserByPrincipal(principal));
        model.addAttribute("project", project);
        model.addAttribute("images", project.getImages());
        model.addAttribute("authorProject", project.getUser());
        return "project-info";
    }

    @PostMapping("/project/create")
    public String createProject(@RequestParam("file1") MultipartFile file1, @RequestParam("file2") MultipartFile file2,
                                @RequestParam("file3") MultipartFile file3, Project project, Principal principal) throws IOException {
        projectService.saveProject(principal, project, file1, file2, file3);
        return "redirect:/my/projects";
    }

    @PostMapping("/project/delete/{id}")
    public String deleteProject(@PathVariable Long id) {
        projectService.deleteProject(id);
        return "redirect:/my/projects";
    }

    @GetMapping("/my/projects")
    public String userProjects(Principal principal, Model model) {
        User user = projectService.getUserByPrincipal(principal);
        model.addAttribute("user", user);
        model.addAttribute("projects", user.getProjects());
        return "my-projects";
    }
}