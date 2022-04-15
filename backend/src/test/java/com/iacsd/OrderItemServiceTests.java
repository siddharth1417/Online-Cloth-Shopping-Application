package com.iacsd;

import java.util.Date;
import java.util.List;

import javax.transaction.Transactional;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.annotation.Rollback;

import com.iacsd.entities.OrderDetail;
import com.iacsd.entities.OrderItem;
import com.iacsd.entities.User;
import com.iacsd.models.responseDto.OrderItemDto;
import com.iacsd.repository.IOrderDetailRepository;
import com.iacsd.repository.IOrderItemRepository;
import com.iacsd.repository.IUserRepository;
import com.iacsd.services.OrderDetailServiceImpl;

@SpringBootTest
class OrderItemServiceTests {
	@Autowired
	private OrderDetailServiceImpl orderDetail;
	
	@Transactional
	@Test
	void testfindOrderItemByOrderId() {
		List<OrderItemDto> list = orderDetail.findOrderItemByOrderId(2);
		list.forEach(System.out::println);
	}

	
	
	
}
