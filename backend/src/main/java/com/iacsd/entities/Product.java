package com.iacsd.entities;

import java.util.Date;
import java.util.List;

import javax.persistence.*;

import org.hibernate.annotations.CreationTimestamp;


@Entity
@Table(name="product")
public class Product {

	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="productId")
	@Id
	private int id;
	
	@Column(name="productName")
	private String productName;
	
	@Column(name="productDescription")
	private String productDescription;
	
	@Column(name="productPrice")
	private double productPrice;
	
	@Column(name="totalSoldQuantity")
	private int totalSoldQuantity;
	
	@Column(name="productAddedDate")
	@CreationTimestamp
	@Temporal(TemporalType.TIMESTAMP)
	private Date productAddedDate;
	
	@Column(name="smallQuantity")
	private int smallQuantity;
	
	@Column(name="mediumQuantity")
	private int mediumQuantity;
	
	@Column(name="largeQuantity")
	private int largeQuantity;
	
	@Column(name="extraLargeQuantity")
	private int extraLargeQuantity;
	
	@Column(name="size")
	private String size;

	@Column(name = "imageUrl")
	private String imageUrl;

	@Column(name = "productDetails")
	private String productDetails;
	

	@ManyToOne(cascade = CascadeType.ALL) // we can write this field in toString
	@JoinColumn(name = "categoryId")
	private Category category;
	
	
	@OneToMany(mappedBy = "product")	//don't write this field in toString else it will give stackOverflow exception 
	private List<OrderItem> orderItemList;
	
	@OneToMany(mappedBy = "product")//don't write this field in toString else it will give stackOverflow exception
	private List<UserProductMeta> userProductMetaList;

	@OneToMany(fetch = FetchType.EAGER, mappedBy = "product")//don't write this field in toString else it will give stackOverflow exception
	private List<Feedback> feedbackList;

	@OneToMany(mappedBy = "product")//don't write this field in toString else it will give stackOverflow exception
	private List<CartItem> cartItemList;
	
	
	public Product() {
		super();
	}

	public Product(int id) {
		super();
		this.id = id;
	}

	public Product(int id, String productName, String productDescription, double productPrice, int totalSoldQuantity,
			Date productAddedDate, int smallQuantity, int mediumQuantity, int largeQuantity, int extraLargeQuantity,
			String size, String imageUrl, String productDetails) {
		super();
		this.id = id;
		this.productName = productName;
		this.productDescription = productDescription;
		this.productPrice = productPrice;
		this.totalSoldQuantity = totalSoldQuantity;
		this.productAddedDate = productAddedDate;
		this.smallQuantity = smallQuantity;
		this.mediumQuantity = mediumQuantity;
		this.largeQuantity = largeQuantity;
		this.extraLargeQuantity = extraLargeQuantity;
		this.size = size;
		this.imageUrl = imageUrl;
		this.productDetails = productDetails;
	}

	public Product(int id, String productName, String productDescription, double productPrice, int totalSoldQuantity,
			Date productAddedDate, int smallQuantity, int mediumQuantity, int largeQuantity, int extraLargeQuantity,
			String size) {
		super();
		this.id = id;
		this.productName = productName;
		this.productDescription = productDescription;
		this.productPrice = productPrice;
		this.totalSoldQuantity = totalSoldQuantity;
		this.productAddedDate = productAddedDate;
		this.smallQuantity = smallQuantity;
		this.mediumQuantity = mediumQuantity;
		this.largeQuantity = largeQuantity;
		this.extraLargeQuantity = extraLargeQuantity;
		this.size = size;
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


	public int getTotalSoldQuantity() {
		return totalSoldQuantity;
	}


	public void setTotalSoldQuantity(int totalSoldQuantity) {
		this.totalSoldQuantity = totalSoldQuantity;
	}


	public Date getProductAddedDate() {
		return productAddedDate;
	}


	public void setProductAddedDate(Date productAddedDate) {
		this.productAddedDate = productAddedDate;
	}


	public int getSmallQuantity() {
		return smallQuantity;
	}


	public void setSmallQuantity(int smallQuantity) {
		this.smallQuantity = smallQuantity;
	}


	public int getMediumQuantity() {
		return mediumQuantity;
	}


	public void setMediumQuantity(int mediumQuantity) {
		this.mediumQuantity = mediumQuantity;
	}


	public int getLargeQuantity() {
		return largeQuantity;
	}


	public void setLargeQuantity(int largeQuantity) {
		this.largeQuantity = largeQuantity;
	}


	public int getExtraLargeQuantity() {
		return extraLargeQuantity;
	}


	public void setExtraLargeQuantity(int extraLargeQuantity) {
		this.extraLargeQuantity = extraLargeQuantity;
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

	public String getProductDetails() {
		return productDetails;
	}

	public void setProductDetails(String productDetails) {
		this.productDetails = productDetails;
	}

	public Category getCategory() {
		return category;
	}


	public void setCategory(Category category) {
		this.category = category;
	}

	
	

	public List<Feedback> getFeedbackList() {
		return feedbackList;
	}




	public void setFeedbackList(List<Feedback> feedbackList) {
		this.feedbackList = feedbackList;
	}




	@Override
	public String toString() {
		return "Product [id=" + id + ", productName=" + productName + ", productDescription=" + productDescription
				+ ", productPrice=" + productPrice + ", totalSoldQuantity=" + totalSoldQuantity + ", productAddedDate="
				+ productAddedDate + ", smallQuantity=" + smallQuantity + ", mediumQuantity=" + mediumQuantity
				+ ", largeQuantity=" + largeQuantity + ", extraLargeQuantity=" + extraLargeQuantity + ", size=" + size
				+ ", imageUrl=" + imageUrl + ", productDetails=" + productDetails + ", category=" + category +"feedback.rating = "+feedbackList.stream().mapToInt(p-> p.getRating()).average()+ "]";
	}

	
	
}
