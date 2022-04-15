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
import com.iacsd.repository.IUserRepository;
import com.iacsd.services.OrderDetailServiceImpl;
import com.iacsd.services.UserServiceImpl;

@SpringBootTest
class FeedbackRepositoryTests {
	@Autowired
	private IFeedbackRepository feedback;
	
	@Transactional
	@Test
	void testfindAllFeedback() {
		List<Feedback> list = feedback.findAll();
		list.forEach(System.out::println);
	}
	
	@Transactional
	@Test
	void testfindAllCommentByProductId() {
		List<Object[]> list = feedback.findAllCommentByProductId(4);
		list.forEach(arr -> System.out.println(arr[0] + " - " + arr[1]));
	}
	
	@Transactional
	@Test
	void testfindAllRatingByProductId() {
		List<Object[]> list = feedback.findAllRatingByProductId(4);
		list.forEach(arr -> System.out.println(arr[0]));
	}
	
//	@Transactional
//	@Test
//	void testaddCommentByProductId() {
//		list = feedback.addCommentByProductId();
//		list.forEach(arr -> System.out.println(arr[0]));
//	}
}
