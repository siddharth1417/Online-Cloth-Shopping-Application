package com.sunbeam;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import com.iacsd.repository.UserRepository;

@SpringBootTest
class AuthServerApplicationTests {

	@Autowired
	private UserRepository userRepository;

	@Test
	void contextLoads() {
		System.out.println(userRepository.findByEmail("adi@gmail.com"));
	}

}
