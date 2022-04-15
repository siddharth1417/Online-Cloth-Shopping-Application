package com.iacsd.services;

import java.util.List;

import com.iacsd.entities.OrderDetail;
import com.iacsd.entities.OrderItem;
import com.iacsd.models.responseDto.OrderDetailDto;
import com.iacsd.models.responseDto.OrderItemDto;

public interface IOrderDetail {
	List<OrderDetailDto> findAllOrderDetails();
	OrderDetailDto findOrderDetailByOrderId(long orderId);
	OrderDetailDto findOrderDetailByOrderNumber(long orderNumber);
	List<OrderDetailDto> findOrderDetailByOrderStatus(String orderStatus);
	OrderDetail saveOrderDetail(OrderDetail orderDetail);
	int deleteOrderDetailByOrderId(long orderId);
	
	List<OrderItemDto> findOrderItemByOrderId(long orderId);
	
	
	//Added on 04-03-2022
	List<OrderDetailDto> getOrderDetailByUserId(long userId);
	int updateOrderStatusByOrderId(long orderId);
}
