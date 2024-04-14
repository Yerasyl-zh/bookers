package com.spring.bookers.repositories;

import com.spring.bookers.models.Image;
import org.springframework.data.jpa.repository.JpaRepository;

public interface ImageRepository extends JpaRepository<Image, Long> {
}