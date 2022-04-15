package com.iacsd.services;
import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.iacsd.entities.Cart;
import com.iacsd.entities.CartItem;
import com.iacsd.repository.*;

@Transactional
@Service
public class CartItemServiceImpl implements ICartItemService{

	@Autowired
	private ICartItemRepository cartItemRepository;

	@Override
	public void addCartItemByProduct(CartItem cart) {
		cartItemRepository.save(cart);
		
	}

	//This service deletes the cartItem
	@Override
	public void deleteCartItemById(int id) {
		cartItemRepository.deleteById(id);
	}
	//This service update the cartItemQuantity
	public void updateCartItemQuantity(int id, int quantity) {
		CartItem cartItem=cartItemRepository.findById(id).orElse(null);
		System.out.println(cartItem);
		cartItem.setProductQuantity(quantity);
	}

	//This service finds the cartItem
	public CartItem findById(int id) {
		return cartItemRepository.findById(id).orElse(null);
	}
	
	public double getcartItemProductPrice(int id) {
		CartItem cartItem=cartItemRepository.findById(id).orElse(null);
		return cartItem.getProductPrice();
	}
	

	//@Override
	//public List<CartItem> getCartItemByCartId(int id) {
		
		//return cartItemRepository.findByCartId(id);
	//}

	//Service which adds the cartIem
	public void addCartItem(CartItem cartItem) {
		cartItemRepository.save(cartItem);
	}

	@Override
	public List<CartItem> getCartItemByCartId(int id) {
		
		return null;
	}
	

	}



