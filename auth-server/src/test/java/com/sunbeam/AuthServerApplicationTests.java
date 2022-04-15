package com.sunbeam;

import com.sunbeam.repository.UserRepository;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
class AuthServerApplicationTests {

	@Autowired
	private UserRepository userRepository;

	@Test
	void contextLoads() {
		System.out.println(userRepository.findByEmail("adi@gmail.com"));
	}

}
