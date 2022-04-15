package com.iacsd.entities;

import javax.persistence.*;

//import lombok.*;
//import lombok.experimental.Accessors;

//@Getter
//@Setter
//@Accessors(chain=true)
//@NoArgsConstructor
//@AllArgsConstructor
@Entity
@Table(name = "cartItem")
public class CartItem {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "cartItemId")
	private int cartItemId;
	@Column(name = "productPrice")
	private double productPrice;
	@Column(name = "productQuantity")
	private int productQuantity;

	@ManyToOne(cascade = CascadeType.MERGE)
	@JoinColumn(name = "productId")
	private Product product;

	@ManyToOne(cascade = CascadeType.MERGE)
	@JoinColumn(name = "cartId")
	private Cart cart;

	public CartItem(int cartItemId, double productPrice, int productQuantity) {
		super();
		this.cartItemId = cartItemId;
		this.productPrice = productPrice;
		this.productQuantity = productQuantity;
	}

	public CartItem() {
		super();
	}

	public int getCartItemId() {
		return cartItemId;
	}

	public void setCartItemId(int cartItemId) {
		this.cartItemId = cartItemId;
	}

	public double getProductPrice() {
		return productPrice;
	}

	public void setProductPrice(double productPrice) {
		this.productPrice = productPrice;
	}

	public int getProductQuantity() {
		return productQuantity;
	}

	public void setProductQuantity(int productQuantity) {
		this.productQuantity = productQuantity;
	}

	public Cart getCart() {
		return cart;
	}

	public void setCart(Cart cart) {
		this.cart = cart;
	}

	@Override
	public String toString() {
		return "CartItem [cartItemId=" + cartItemId + ", productPrice=" + productPrice + ", productQuantity="
				+ productQuantity + "]";
	}

}
