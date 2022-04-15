package com.iacsd;

import java.util.Date;
import java.util.List;

import javax.transaction.Transactional;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.annotation.Rollback;

import com.iacsd.entities.Feedback;
import com.iacsd.entities.OrderDetail;
import com.iacsd.entities.OrderItem;
import com.iacsd.entities.User;
import com.iacsd.repository.IFeedbackRepository;
import com.iacsd.repository.IOrderDetailRepository;
import com.iacsd.repository.IOrderItemRepository;
import com.iacsd.repository.IProductRepository;
import com.iacsd.repository.IUserRepository;
import com.iacsd.services.OrderDetailServiceImpl;
import com.iacsd.services.ProductServiceImpl;
import com.iacsd.services.UserServiceImpl;

@SpringBootTest
class productRepositoryTests {
	@Autowired
	private IProductRepository product;
	
	@Transactional
	@Test
	void testgetAvgRatingByProductId(){
		double result = product.getAvgRatingByProductId(4);
		System.out.println(result);
	}
	
	@Transactional
	@Test
	void testgetSumOfRatingByProductId(){
		int result = product.getSumOfRatingByProductId(4);
		System.out.println(result);
	}
}
