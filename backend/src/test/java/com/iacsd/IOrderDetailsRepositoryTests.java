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
import com.iacsd.models.responseDto.OrderDetailDto;
import com.iacsd.models.responseDto.OrderItemDto;
import com.iacsd.repository.IOrderDetailRepository;
import com.iacsd.repository.IUserRepository;
import com.iacsd.services.OrderDetailServiceImpl;

@SpringBootTest
class IOrderDetailsRepositoryTests {
	@Autowired
	private IOrderDetailRepository iOrderRepository;
	
	@Autowired
	private OrderDetailServiceImpl orderDetailService;
	
	@Test
	void testFindAll() {
		List<OrderDetail> list= iOrderRepository.findAll();
		list.forEach(System.out::println);
	}
	
	@Transactional
	@Test
	void testFindByOrderId() {
		OrderDetail orderDetail = iOrderRepository.findByOrderId(2);
		System.out.println("Found by Id: "+orderDetail);
		for(OrderItem orderItem : orderDetail.getOrderItemList()) {
			System.out.println(orderItem);
		}
	}
	
	@Test
	void testFindByOrderStatus() {
		List<OrderDetail> list = iOrderRepository.findByOrderStatus("ordered");
		list.forEach(System.out::println);
	}
	
	@Rollback(false)
	@Transactional
	@Test
	void testSave() {
		OrderDetail orderDetail = new OrderDetail(0, 105, "ordered", new Date(), 1243.00, 1);
		iOrderRepository.save(orderDetail);
	}
	
	@Test
	void testFindByOrderNumber() {
		OrderDetail orderDetail = iOrderRepository.findByOrderNumber(102);
		System.out.println("Found by Number: "+orderDetail);
	}
	
	//added on 04-03-2022 by Hanumant
	@Test
	void testGetOrderDetailByUserId() {
		List<OrderDetailDto> list = orderDetailService.getOrderDetailByUserId(10);
		list.forEach(System.out::println);
	}
	
	@Test
	void testfindOrderItemByOrderId() {
		List<OrderItemDto> list = orderDetailService.findOrderItemByOrderId(2L);
		list.forEach(System.out::println);
	}
	
	@Rollback(false)
	@Transactional
	@Test
	void testUpdateOrderStatusByOrderId() {
		int result = orderDetailService.updateOrderStatusByOrderId(1);
		System.out.println(result);
	}
	
	
}
