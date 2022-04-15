package com.iacsd.services;

import java.util.List;

import com.iacsd.entities.CartItem;

public interface ICartItemService {

	void addCartItemByProduct(CartItem cart);
	void deleteCartItemById(int id);
	List<CartItem> getCartItemByCartId(int id);//Similar api i have written in cart sevice impl with some logic in service
	void addCartItem(CartItem cartItem);
}