package com.iacsd.controller;

import java.util.List;
import java.util.Optional;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.iacsd.entities.Cart;
import com.iacsd.entities.CartItem;
import com.iacsd.models.responseDto.*;
import com.iacsd.services.CartItemServiceImpl;
import com.iacsd.services.CartServiceImpl;

@RestController
@CrossOrigin(origins = "*")
public class CartController {

	
	@Autowired
	private CartServiceImpl cartService;
	
	@Autowired
	private CartItemServiceImpl cartItemService;
	
	@GetMapping("/cart/{id}")
	public @ResponseBody CartDto findById(@PathVariable("id") int id) {
		return cartService.findById(id);
	}
	
	@GetMapping("/cart/price/{id}")
	public double getTotalPriceOfCart(@PathVariable int id) {
		return cartService.getTotalPriceOfCart(id);
	}
	
}
