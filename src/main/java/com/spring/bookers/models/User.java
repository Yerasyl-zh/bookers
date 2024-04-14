package com.spring.bookers.models;

import com.spring.bookers.models.enums.Role;
import jakarta.persistence.*;
import lombok.Data;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import java.time.LocalDateTime;
import java.util.*;

@Entity
@Table(name = "users")
@Data
public class User implements UserDetails {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private Long id;
    @Column(name = "email", unique = true)
    private String email;
    @Column(name = "phone_number")
    private String phoneNumber;
    @Column(name = "firstName")
    private String firstName;
    @Column(name = "lastName")
    private String lastName;
    @Column(name = "birthday")
    private String birthday;
    @Column(name = "education")
    private String education;
    @Column(name = "department")
    private String department;
    @Column(name = "male")
    private boolean male;
    @Column(name = "maritalStatus")
    private String maritalStatus;
    @Column(name = "age")
    private int age;
    @Column(name = "strengths")
    private String strengths;
    @Column(name = "github")
    private String github;
    @Column(name = "address")
    private String address;
    @Column(name = "city")
    private String city;
    @Column(name = "nationality")
    private String nationality;
    @Column(name = "active")
    private boolean active;
    @Column(name ="photo_Url")
    private String photoPath;
    @Column(name = "password", length = 1000)
    private String password;
    @Column(name = "job_title")
    private String jobTitle;

    @Column(name = "online")
    private boolean online;
    private LocalDateTime lastOnlineTime;
    @ElementCollection(targetClass = Role.class, fetch = FetchType.EAGER)
    @CollectionTable(name = "user_role",
            joinColumns = @JoinColumn(name = "user_id"))
    @Enumerated(EnumType.STRING)
    private Set<Role> roles = new HashSet<>();
    @OneToMany(cascade = CascadeType.ALL, fetch = FetchType.EAGER, mappedBy = "user")
    private List<Project> projects = new ArrayList<>();
    private LocalDateTime dateOfCreated;


    @PrePersist
    private void init() {
        dateOfCreated = LocalDateTime.now();
    }

    // security

    public boolean isAdmin() {
        return roles.contains(Role.ROLE_ADMIN);
    }

    @Override
    public Collection<? extends GrantedAuthority> getAuthorities() {
        return roles;
    }

    @Override
    public String getUsername() {
        return email;
    }

    @Override
    public boolean isAccountNonExpired() {
        return true;
    }

    @Override
    public boolean isAccountNonLocked() {
        return true;
    }

    @Override
    public boolean isCredentialsNonExpired() {
        return true;
    }

    @Override
    public boolean isEnabled() {
        return active;
    }
}