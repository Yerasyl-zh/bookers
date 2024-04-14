package com.spring.bookers.services;

import com.spring.bookers.models.Image;
import com.spring.bookers.models.Project;
import com.spring.bookers.models.User;
import com.spring.bookers.repositories.ProjectRepository;
import com.spring.bookers.repositories.UserRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.security.Principal;
import java.util.List;

@Service
@Slf4j
@RequiredArgsConstructor
public class ProjectService {
    private final ProjectRepository projectRepository;
    private final UserRepository userRepository;

    public List<Project> listProject(String title) {
        if (title != null) return projectRepository.findByTitle(title);
        return projectRepository.findAll();
    }

    public void saveProject(Principal principal, Project project, MultipartFile file1, MultipartFile file2, MultipartFile file3) throws IOException {
        project.setUser(getUserByPrincipal(principal));
        Image image1;
        Image image2;
        Image image3;
        if (file1.getSize() != 0) {
            image1 = toImageEntity(file1);
            image1.setPreviewImage(true);
            project.addImageToProject(image1);
        }
        if (file2.getSize() != 0) {
            image2 = toImageEntity(file2);
            project.addImageToProject(image2);
        }
        if (file3.getSize() != 0) {
            image3 = toImageEntity(file3);
            project.addImageToProject(image3);
        }
        log.info("Saving new project. Title: {}; Author email: {}", project.getTitle(), project.getUser().getEmail());
        Project projectFromDb = projectRepository.save(project);
        projectFromDb.setPreviewImageId(projectFromDb.getImages().get(0).getId());
        projectRepository.save(project);
    }

    public User getUserByPrincipal(Principal principal) {
        if (principal == null) return new User();
        return userRepository.findByEmail(principal.getName());
    }

    private Image toImageEntity(MultipartFile file) throws IOException {
        Image image = new Image();
        image.setName(file.getName());
        image.setOriginalFileName(file.getOriginalFilename());
        image.setContentType(file.getContentType());
        image.setSize(file.getSize());
        image.setBytes(file.getBytes());
        return image;
    }

    public void deleteProject(Long id) {
        projectRepository.deleteById(id);
    }
    public Project getProjectById(Long id) {
        return projectRepository.findById(id).orElse(null);
    }


}