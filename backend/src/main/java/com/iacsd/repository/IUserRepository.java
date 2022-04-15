package com.iacsd.repository;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;

import com.iacsd.entities.User;

public interface IUserRepository extends JpaRepository<User, Long>{
	//added on 04-03-2022 by Hanumant
	User findByUserId(long userId);
	
	
	User findByUsername(String name);
	User findByUserEmail(String email);
}
