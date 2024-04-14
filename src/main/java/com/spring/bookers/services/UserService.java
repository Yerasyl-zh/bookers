package com.spring.bookers.services;



import com.spring.bookers.models.User;
import com.spring.bookers.models.enums.Role;
import com.spring.bookers.repositories.UserRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.util.UUID;
import java.io.File;
import java.io.IOException;
import java.security.Principal;
import java.util.*;
import java.util.stream.Collectors;

@Service
@Slf4j
@RequiredArgsConstructor
public class UserService {
    private final UserRepository userRepository;
    private final PasswordEncoder passwordEncoder;

    @Value("${upload.path}")
    private String uploadPath;


    public boolean createUser(User user, MultipartFile file) throws IOException {
        String email = user.getEmail();
        if (userRepository.findByEmail(email) != null) return false;
        user.setActive(true);
        user.setPassword(passwordEncoder.encode(user.getPassword()));
        user.getRoles().add(Role.ROLE_ADMIN);
        if (file!= null && !file.getOriginalFilename().isEmpty()){
            File uploadDir= new File(uploadPath);
            if  (!uploadDir.exists()){
                uploadDir.mkdir();
            }
            String uuidFile=UUID.randomUUID().toString();
            String resultPhotoPath = uuidFile+"."+file.getOriginalFilename();
            file.transferTo(new File(uploadPath+"/" +resultPhotoPath));
            user.setPhotoPath(resultPhotoPath);
        }
        log.info("Saving new User with email: {}", email);
        userRepository.save(user);
        return true;
    }
    public void saveAdditionalInfo(User user) {
        User existingUser = userRepository.findById(user.getId()).orElse(null);
        if (existingUser != null) {
            // Обновляем только те поля, которые были изменены в переданном объекте user
            existingUser.setBirthday(user.getBirthday());
            existingUser.setEducation(user.getEducation());
            existingUser.setDepartment(user.getDepartment());
            existingUser.setMale(user.isMale());
            existingUser.setMaritalStatus(user.getMaritalStatus());
            existingUser.setAge(user.getAge());
            existingUser.setStrengths(user.getStrengths());
            existingUser.setGithub(user.getGithub());
            existingUser.setAddress(user.getAddress());
            existingUser.setCity(user.getCity());
            existingUser.setNationality(user.getNationality());

            // Сохраняем обновленного пользователя
            userRepository.save(existingUser);
        } else {
            throw new RuntimeException("Пользователь не найден");
        }

    }

    public List<User> list() {
        return userRepository.findAll();
    }

    public void banUser(Long id) {
        User user = userRepository.findById(id).orElse(null);
        if (user != null) {
            if (user.isActive()) {
                user.setActive(false);
                log.info("Ban user with id = {}; email: {}", user.getId(), user.getEmail());
            } else {
                user.setActive(true);
                log.info("Unban user with id = {}; email: {}", user.getId(), user.getEmail());
            }
        }
        userRepository.save(user);
    }

    public void changeUserRoles(User user, Map<String, String> form) {
        Set<String> roles = Arrays.stream(Role.values())
                .map(Role::name)
                .collect(Collectors.toSet());
        user.getRoles().clear();
        for (String key : form.keySet()) {
            if (roles.contains(key)) {
                user.getRoles().add(Role.valueOf(key));
            }
        }
        userRepository.save(user);
    }

    public User getUserByPrincipal(Principal principal) {
        if (principal == null) return new User();
        return userRepository.findByEmail(principal.getName());
    }
    public User getUserByEmail(String email) {
        return userRepository.findByEmail(email);
    }
}


