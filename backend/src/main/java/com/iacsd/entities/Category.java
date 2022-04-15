package com.iacsd.entities;

import java.util.List;

import javax.persistence.*;

@Entity
@Table(name = "category")
public class Category {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="categoryId")
	private int id;
	@Column(name="categoryName")
	private String categoryName;
	@Column(name="subcategoryName")
	private String subcategoryName;
	
	
	@OneToMany(mappedBy = "category")
	private List<Product> productList;

	
	public Category() {
		super();
	}


	public Category(int id, String categoryName, String subcategoryName, List<Product> productList) {
		super();
		this.id = id;
		this.categoryName = categoryName;
		this.subcategoryName = subcategoryName;
		this.productList = productList;
	}


	public Category(int id, String categoryName, String subcategoryName) {
		super();
		this.id = id;
		this.categoryName = categoryName;
		this.subcategoryName = subcategoryName;
	}


	public int getId() {
		return id;
	}


	public void setId(int id) {
		this.id = id;
	}


	public String getCategoryName() {
		return categoryName;
	}


	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}


	public String getSubcategoryName() {
		return subcategoryName;
	}


	public void setSubcategoryName(String subcategoryName) {
		this.subcategoryName = subcategoryName;
	}


	public List<Product> getProductList() {
		return productList;
	}


	public void setProductList(List<Product> productList) {
		this.productList = productList;
	}


	@Override
	public String toString() {
		return "Category [id=" + id + ", categoryName=" + categoryName + ", subcategoryName=" + subcategoryName + "]";
	}


	
	
	
	
	
}
