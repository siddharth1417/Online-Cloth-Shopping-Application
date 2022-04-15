package com.iacsd.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.iacsd.entities.CartItem;
import com.iacsd.services.CartItemServiceImpl;

@RestController
@CrossOrigin(origins = "*")
public class CartItemController {

	@Autowired
	private CartItemServiceImpl cartItemService;
	
	@PostMapping("/cartItem/add")
	public void addCartItem(@RequestBody CartItem cartItem) {
		cartItemService.addCartItem(cartItem);
	}
	@DeleteMapping("/cartItem/delete/{id}")
	public void deleteCartItem(@PathVariable int id) {
		cartItemService.deleteCartItemById(id);
	}
	
	@PutMapping("/cartItem/update/{id}/{quantity}")
	public void updateCartItemQuantity(@PathVariable int id, @PathVariable int quantity) {
		cartItemService.updateCartItemQuantity(id, quantity);
	}
	
	@GetMapping("/cartItem/{id}")
	public CartItem getCartItemById(@PathVariable int id) {
		return cartItemService.findById(id);
	}
	
	@GetMapping("/cartItem/price/{id}")
	public  double getCartItemProductPrice(@PathVariable int id) {
		return cartItemService.getcartItemProductPrice(id);
	}
}
