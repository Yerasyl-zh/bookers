package com.spring.bookers.controllers;

import com.spring.bookers.models.User;
import com.spring.bookers.repositories.UserRepository;
import com.spring.bookers.services.UserService;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.security.Principal;
import java.time.format.DateTimeFormatter;


@Controller
@RequiredArgsConstructor
public class UserController {

    @Value("${upload.path}")
    private String uploadPath;

    private final UserService userService;
    private final UserRepository userRepository;

    @GetMapping("/login")
    public String login(Principal principal, Model model) {
        model.addAttribute("user", userService.getUserByPrincipal(principal));
        return "login";
    }

    @GetMapping("/registration")
    public String registration(Principal principal, Model model) {
        model.addAttribute("user", userService.getUserByPrincipal(principal));
        return "registration";
    }

    @PostMapping("/registration")
    public String createUser(User user, Model model, @RequestParam("file") MultipartFile file) throws IOException {
        if (!userService.createUser(user, file)) {
            model.addAttribute("errorMessage", "Пользователь с email: " + user.getEmail() + " уже существует");
            return "registration";
        }
        // Получаем идентификатор только что созданного пользователя
        Long userId = user.getId();
        // После успешной регистрации перенаправляем пользователя на страницу additionalInfo с передачей идентификатора пользователя в параметрах запроса
        return "redirect:/additionalInfo?id=" + userId;
    }

    @GetMapping("/additionalInfo")
    public String additionalInfoForm(@RequestParam(name = "id", required = false) Long id, Model model) {
        // Проверяем, был ли передан идентификатор пользователя
        if (id == null) {
            // Если идентификатор пользователя не передан, перенаправляем пользователя на страницу входа
            return "redirect:/login";
        }

        // Получаем пользователя по его идентификатору
        User user = userRepository.findById(id).orElse(null);

        // Проверяем, был ли найден пользователь
        if (user == null) {
            // Если пользователь не найден, также перенаправляем на страницу входа
            return "redirect:/login";
        }

        // Передаем пользователя в модель для отображения на странице additionalInfo
        model.addAttribute("user", user);
        return "addinfo";
    }

    @PostMapping("/additionalInfo")
    public String additionalInfoSubmit(@ModelAttribute User user,@RequestParam("id") Long userId, Model model) {
        // Сохраняем дополнительную информацию о пользователе
        user.setId(userId);
        userService.saveAdditionalInfo(user);
        return "redirect:/profile"; // Перенаправляем пользователя на страницу профиля
    }

    @GetMapping("/profile")
    public String profile(Principal principal, Model model) {
        User user = userService.getUserByPrincipal(principal);
        model.addAttribute("user", user);
        return "profile";
    }

    @GetMapping("/user/{user}")
    public String userInfo(@PathVariable("user") User user, Model model, Principal principal) {
        model.addAttribute("user", user);
        model.addAttribute("userByPrincipal", userService.getUserByPrincipal(principal));
        model.addAttribute("projects", user.getProjects());
        return "user-info";
    }
    @GetMapping("/user/list")
    public String getAllUsers(Model model, Principal principal) {
        User currentUser = userService.getUserByPrincipal(principal);
        model.addAttribute("users", userService.list());
        model.addAttribute("currentUserStatus", currentUser.isOnline() ? "Online" : "Offline");
        model.addAttribute("user", userService.getUserByPrincipal(principal));
        return "user-list";
    }

}