package com.iacsd.models.responseDto;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.hibernate.annotations.CreationTimestamp;

//ADDED BY HANUMANT  + amit
public class ProductDto {
	private int id;
	private String productName;
	private String productDescription;
	private double productPrice;
	private String size;
	private String imageUrl;
	public ProductDto() {
		super();
	}
	
	

	public ProductDto(int id, String productName, String productDescription, double productPrice, String size,
			String imageUrl) {
		super();
		this.id = id;
		this.productName = productName;
		this.productDescription = productDescription;
		this.productPrice = productPrice;
		this.size = size;
		this.imageUrl = imageUrl;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public String getProductDescription() {
		return productDescription;
	}

	public void setProductDescription(String productDescription) {
		this.productDescription = productDescription;
	}

	public double getProductPrice() {
		return productPrice;
	}

	public void setProductPrice(double productPrice) {
		this.productPrice = productPrice;
	}

	public String getSize() {
		return size;
	}

	public void setSize(String size) {
		this.size = size;
	}

	public String getImageUrl() {
		return imageUrl;
	}

	public void setImageUrl(String imageUrl) {
		this.imageUrl = imageUrl;
	}

	@Override
	public String toString() {
		return "ProductDto [id=" + id + ", productName=" + productName + ", productDescription=" + productDescription
				+ ", productPrice=" + productPrice + ", size=" + size + ", imageUrl=" + imageUrl + "]";
	}

}

