package com.iacsd;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import com.iacsd.entities.User;
import com.iacsd.repository.IUserRepository;

@SpringBootTest
class EcommerceApplicationTests {
	@Autowired
	private IUserRepository iUserRepository;
	@Test
	void getUser() {
		User user = iUserRepository.findByUsername("Aditya");
		System.out.println(user.getUserEmail());
	}

}
