package com.iacsd.services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.iacsd.entities.Cart;
import com.iacsd.entities.CartItem;
import com.iacsd.models.requestDto.*;
import com.iacsd.models.responseDto.CartDto;
import com.iacsd.repository.ICartRepository;



public interface ICartService {

	
	CartDto findById(int id);
	Void save(Cart cart);
	
	void updateQuantity(int id,int quantity);
	//List<CartItem> getCartItemByCartId(int id);
}

