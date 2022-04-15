package com.iacsd.entities;

import java.util.List;

import javax.persistence.*;

//import lombok.*;
//import lombok.experimental.Accessors;

//@Getter
//@Setter
//@Accessors(chain=true)
//@NoArgsConstructor
//@AllArgsConstructor
@Entity
@Table(name = "cart")
public class Cart {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "cartId")
	private int cartId;
	@Column(name = "quantity")
	private int quantity;
	@Column(name = "isPurchased")
	private boolean isPurchased;

	@ManyToOne(cascade = CascadeType.MERGE)
	@JoinColumn(name = "userId")
	private User user;

	@OneToMany(mappedBy = "cart")
	private List<CartItem> cartItemList;

//	@OneToMany(mappedBy = "cart")
//	private List<Size> sizeList;

	public Cart(int cartId, int quantity, boolean isPurchased) {
		super();
		this.cartId = cartId;
		this.quantity = quantity;
		this.isPurchased = isPurchased;
	}

	public Cart() {
		super();
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

//	public List<Size> getSizeList() {
//		return sizeList;
//	}
//
//	public void setSizeList(List<Size> sizeList) {
//		this.sizeList = sizeList;
//	}

	public int getCartId() {
		return cartId;
	}

	public void setCartId(int cartId) {
		this.cartId = cartId;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public boolean isPurchased() {
		return isPurchased;
	}

	public void setPurchased(boolean isPurchased) {
		this.isPurchased = isPurchased;
	}

	public List<CartItem> getCartItemList() {
		return cartItemList;
	}

	public void setCartItemList(List<CartItem> cartItemList) {
		this.cartItemList = cartItemList;
	}

	@Override
	public String toString() {
		return "Cart [cartId=" + cartId + ", quantity=" + quantity + ", isPurchased=" + isPurchased + "]";
	}

}
