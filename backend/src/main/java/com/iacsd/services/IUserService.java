package com.iacsd.services;

import java.util.List;

import com.iacsd.converter.ToSimpleUserInfoConverter;
import com.iacsd.entities.Address;
import com.iacsd.entities.OrderDetail;
import com.iacsd.entities.User;
import com.iacsd.models.requestDto.ResetPasswordDto;
import com.iacsd.models.requestDto.UserSignupDto;
import com.iacsd.models.responseDto.AddressDto;
import com.iacsd.models.responseDto.OrderDetailDto;

public interface IUserService {
	User getUserByName(String name);
	ToSimpleUserInfoConverter getUserById(Long id);
	User getUserByEmail(String email);
	User registerUser(UserSignupDto userSignupDto);
	List<ToSimpleUserInfoConverter> getAllUser();
	boolean deleteUserById(Long id);
	User getUserByToken();
	String resetPassword(ResetPasswordDto resetPasswordDto);
	ToSimpleUserInfoConverter getUserDetailsByToken();
	List<AddressDto> getAllAddressByUserId(Long userId);
	//List<OrderDetailDto> getOrderDetailByUserId(long userId);
}
