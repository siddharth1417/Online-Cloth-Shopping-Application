package com.iacsd.services;

import java.util.List;
import java.util.stream.Collectors;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.iacsd.entities.OrderDetail;
import com.iacsd.entities.OrderItem;
import com.iacsd.exception.customexceptions.OrderItemNotFoundException;
import com.iacsd.exception.customexceptions.UserNotFoundException;
import com.iacsd.models.responseDto.DtoEntityConverter;
import com.iacsd.models.responseDto.OrderDetailDto;
import com.iacsd.models.responseDto.OrderItemDto;
import com.iacsd.repository.IOrderDetailRepository;
import com.iacsd.repository.IOrderItemRepository;
import com.iacsd.repository.IUserRepository;

@Transactional
@Service
public class OrderDetailServiceImpl implements IOrderDetail{
	@Autowired
	private IOrderDetailRepository orderDetailRepository;
	@Autowired
	private IOrderItemRepository orderItemRepository;
	@Autowired
	private IUserRepository userRepository;
	@Autowired
	private DtoEntityConverter converter;
	
	public List<OrderDetailDto> findAllOrderDetails() {
		List<OrderDetail> orderDetailList = orderDetailRepository.findAll();
		return orderDetailList.stream()
				.map(orderdetail -> converter.toOrderDetailDto(orderdetail))
				.collect(Collectors.toList());
	}
	
	public OrderDetailDto findOrderDetailByOrderId(long orderId) {
		OrderDetail orderDetail = orderDetailRepository.findByOrderId(orderId);
		return converter.toOrderDetailDto(orderDetail);
	}

	public OrderDetailDto findOrderDetailByOrderNumber(long orderNumber) {
		OrderDetail orderDetail = orderDetailRepository.findByOrderNumber(orderNumber);
		return converter.toOrderDetailDto(orderDetail);
	}
	
	public List<OrderDetailDto> findOrderDetailByOrderStatus(String orderStatus) {	
		List<OrderDetail> orderDetailList = orderDetailRepository.findAll();
		return orderDetailList.stream()
				.map(orderdetail -> converter.toOrderDetailDto(orderdetail))
				.collect(Collectors.toList());
	}
	
	public OrderDetail saveOrderDetail(OrderDetail orderDetail) {
		return orderDetailRepository.save(orderDetail);
	}
	
	public int deleteOrderDetailByOrderId(long orderId) {
		if (orderDetailRepository.existsById(orderId)) {
			orderDetailRepository.deleteById(orderId);
			return 1;
		}
		return 0;
			
	}

	public List<OrderItemDto> findOrderItemByOrderId(long orderId){
		OrderDetail orderDetail = orderDetailRepository.findByOrderId(orderId);
		if(orderDetail == null)
			 throw new OrderItemNotFoundException("OrderItems Not Found");
		List<OrderItem> orderItemList = orderDetail.getOrderItemList();
		
		return orderItemList.stream()
		.map(orderitem -> converter.toOrderItemDto(orderitem))
		.collect(Collectors.toList());
	}
	
	//ADDED BY HANUMANT on 04-03-2022
    //get order details by user Id
	public List<OrderDetailDto> getOrderDetailByUserId(long userId){
		List<OrderDetail> orderDetailList = userRepository.findByUserId(userId).getOrderDetailList();
		return orderDetailList.stream()
				.map(orderdetail -> converter.toOrderDetailDto(orderdetail))
				.collect(Collectors.toList());
	}
	
	public int updateOrderStatusByOrderId(long orderId) {
		if (orderDetailRepository.existsById(orderId)) {
			orderDetailRepository.updateOrderStatusByOrderId(orderId);
			return 1;
		}
		return 0;
	}
//	
//	public String getProductNameByOrderItemId(int productId) {
//		orderItemRepository.fi
//	}

}
