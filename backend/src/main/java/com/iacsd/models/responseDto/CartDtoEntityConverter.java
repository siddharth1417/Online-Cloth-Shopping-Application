package com.iacsd.models.responseDto;

import java.util.Optional;

import org.springframework.stereotype.Component;

import com.iacsd.entities.Cart;
import com.iacsd.entities.CartItem;

@Component
public class CartDtoEntityConverter {
	private int totalPrice;
	private int totalQuantity;

	public CartDto toCartDto(Cart cart) {
		int totalPrice = 0;
		int totalQuantity = 0;

		CartDto cartDto = new CartDto();

		cartDto.setCartItemList(cart.getCartItemList());

		for (CartItem cartItem : cartDto.getCartItemList()) {
			totalPrice += cartItem.getProductQuantity() * cartItem.getProductPrice();
			totalQuantity += cartItem.getProductQuantity();
		}

		cartDto.setQuanity(totalQuantity);
		cartDto.setTotalAmount(totalPrice);

		cartDto.setIsPurchased(cart.isPurchased());

		return cartDto;

	}

	public CartDto toCartDto(Optional<Cart> cart) {
		// TODO Auto-generated method stub
		return null;
	}
}
