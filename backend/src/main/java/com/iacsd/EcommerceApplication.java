package com.iacsd;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.jdbc.DataSourceAutoConfiguration;
import org.springframework.boot.autoconfigure.security.servlet.SecurityAutoConfiguration;

import com.iacsd.entities.OrderDetail;
import com.iacsd.services.OrderDetailServiceImpl;
import com.iacsd.services.UserServiceImpl;

@SpringBootApplication
public class EcommerceApplication implements CommandLineRunner{

	public static void main(String[] args) {
		SpringApplication.run(EcommerceApplication.class, args);
	}
@Autowired
	private OrderDetailServiceImpl obj;
	
	@Override
	public void run(String... args) throws Exception {
		System.out.println("Hello World"); 
		System.out.println("this is sample");
		System.out.println("this is from localpc branch");
		
		
		
//		for (OrderDetail e : obj.findByOrderId(1)) {
//			System.out.println(e);
//		}
		
		
	}
	
	 
	
	

}
