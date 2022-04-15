package com.iacsd.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.iacsd.entity.MyUser;

import java.util.Optional;

public interface UserRepository extends JpaRepository<MyUser,Long> {
    Optional<MyUser> findByEmail(String email);
}
