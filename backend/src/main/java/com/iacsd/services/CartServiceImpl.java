package com.iacsd.services;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.iacsd.entities.Cart;
import com.iacsd.entities.CartItem;
import com.iacsd.models.responseDto.*;
import com.iacsd.repository.ICartRepository;

@Transactional
@Service
public class CartServiceImpl implements ICartService {

	@Autowired
	private ICartRepository cartRepository;
	
	@Autowired
	private CartDtoEntityConverter cartEntityConverter;

	@Override
	public CartDto findById(int id) {
		Optional<Cart> cart=cartRepository.findById(id);
		//return cartRepository.findById(id).orElse(null);
		return cartEntityConverter.toCartDto(cart);
		
		
	}

	@Override
	public Void save(Cart cart) {
		cartRepository.save(cart);
		return null;
	}

	@Override
	public void updateQuantity(int id,int quantity) {
	Cart cart=cartRepository.findById(id).orElse(null);
	
	if(cart!=null) {
		cart.setQuantity(quantity);
	}
	
		
	}

	//@Override//Written the same functionality in cartItem as well within a single line
//	public List<CartItem> getCartItemByCartId(int id) {
//		List<CartItem> cartItemList=new ArrayList<CartItem>();
//		
//		Cart cart=cartRepository.findById(id).orElse(null);
//		
//		for(CartItem ci:cart.getCartItemList()) {
//			cartItemList.add(ci);
//		}
//		
//		return cartItemList;
//	}
	
	
	public double getTotalPriceOfCart(int id) {
	    double totalPrice=0;
		Cart cart=cartRepository.findById(id).orElse(null);
		for(CartItem ci:cart.getCartItemList()) {
			totalPrice+=ci.getProductPrice()*ci.getProductQuantity();
		}		return totalPrice;
	}

}

