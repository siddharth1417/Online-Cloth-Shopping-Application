package com.iacsd.models.responseDto;

import java.util.ArrayList;
import java.util.List;

import com.iacsd.entities.CartItem;

public class CartDto {

	private int quanity;
	private boolean isPurchased;
	private int totalAmount;
	private List<CartItem> cartItemList=new ArrayList<>();
	
	public CartDto() {
		super();
	}

	public CartDto(int quanity, boolean isPurchased, int totalAmount, List<CartItem> cartItemList) {
		super();
		this.quanity = quanity;
		this.isPurchased = isPurchased;
		this.totalAmount = totalAmount;
		this.cartItemList = cartItemList;
	}

	public int getQuanity() {
		return quanity;
	}

	public void setQuanity(int quanity) {
		this.quanity = quanity;
	}

	public boolean getIsPurchased() {
		return isPurchased;
	}

	public void setIsPurchased(boolean b) {
		this.isPurchased = b;
	}

	public int getTotalAmount() {
		return totalAmount;
	}

	public void setTotalAmount(int totalAmount) {
		this.totalAmount = totalAmount;
	}

	public List<CartItem> getCartItemList() {
		return cartItemList;
	}

	public void setCartItemList(List<CartItem> cartItemList) {
		this.cartItemList = cartItemList;
	}

	@Override
	public String toString() {
		return "CartDto [quanity=" + quanity + ", isPurchased=" + isPurchased + ", totalAmount=" + totalAmount
				+ ", cartItemList=" + cartItemList + "]";
	}
	
	
}

