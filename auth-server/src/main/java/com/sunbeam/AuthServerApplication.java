package com.sunbeam;

import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
public class AuthServerApplication implements CommandLineRunner {

	public static void main(String[] args) {

		SpringApplication.run(AuthServerApplication.class, args);
	}

	@Override
	public void run(String... args) throws Exception {
		System.out.println("in authorization server");
	}
}
