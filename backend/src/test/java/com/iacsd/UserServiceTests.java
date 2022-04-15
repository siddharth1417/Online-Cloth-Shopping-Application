package com.iacsd;

import java.util.Date;
import java.util.List;

import javax.transaction.Transactional;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.annotation.Rollback;

import com.iacsd.entities.Address;
import com.iacsd.entities.OrderDetail;
import com.iacsd.entities.OrderItem;
import com.iacsd.entities.User;
import com.iacsd.models.responseDto.AddressDto;
import com.iacsd.models.responseDto.OrderDetailDto;
import com.iacsd.repository.IAddressRepository;
import com.iacsd.repository.IOrderDetailRepository;
import com.iacsd.repository.IOrderItemRepository;
import com.iacsd.repository.IUserRepository;
import com.iacsd.services.OrderDetailServiceImpl;
import com.iacsd.services.UserServiceImpl;

@SpringBootTest
class UserServiceTests {
    @Autowired
    private UserServiceImpl userService;

    @Autowired
    private IAddressRepository address;

    @Transactional
    @Test
    void testListAllAddress() {
//        List<Address> list = address.findByUser(new User(10L));
        List<AddressDto> list = userService.getAllAddressByUserId(10L);
        list.forEach(System.out::println);
    }

//	@Transactional
//	@Test
//	void testGetOrderDetailByUserId() {
//		List<OrderDetailDto> list = userService.getOrderDetailByUserId(9);
//		list.forEach(System.out::println);
//	}


}
