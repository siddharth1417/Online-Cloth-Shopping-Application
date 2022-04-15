package com.iacsd.entities;

import java.util.Date;

import javax.persistence.*;

import org.hibernate.annotations.CreationTimestamp;

//import lombok.*;
//import lombok.experimental.Accessors;
//
//@Getter
//@Setter
//@Accessors(chain=true)
//@NoArgsConstructor
//@AllArgsConstructor
@Entity
@Table(name = "payment")
public class Payment {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "paymentId")
	private int paymentId;
	@Column(name = "totalAmount")
	private double totalAmount;
	@Column(name = "paymentMode")
	private String paymentMode;

	@Column(name = "paymentDate")
	@CreationTimestamp
	@Temporal(TemporalType.TIMESTAMP)
	private Date paymentDate;

	@Column(name = "paymentStatus")
	private boolean paymentStatus;

	@OneToOne
	@JoinColumn(name = "orderId", referencedColumnName = "orderId")
	private OrderDetail orderDetail;

	@ManyToOne(cascade = CascadeType.MERGE)
	@JoinColumn(name = "userId")
	private User user;

	public Payment(int paymentId, double totalAmount, String paymentMode, Date paymentDate, boolean paymentStatus,
			OrderDetail orderDetail, User user) {
		super();
		this.paymentId = paymentId;
		this.totalAmount = totalAmount;
		this.paymentMode = paymentMode;
		this.paymentDate = paymentDate;
		this.paymentStatus = paymentStatus;
		this.orderDetail = orderDetail;
		this.user = user;
	}

	public int getPaymentId() {
		return paymentId;
	}

	public void setPaymentId(int paymentId) {
		this.paymentId = paymentId;
	}

	public double getTotalAmount() {
		return totalAmount;
	}

	public void setTotalAmount(double totalAmount) {
		this.totalAmount = totalAmount;
	}

	public String getPaymentMode() {
		return paymentMode;
	}

	public void setPaymentMode(String paymentMode) {
		this.paymentMode = paymentMode;
	}

	public Date getPaymentDate() {
		return paymentDate;
	}

	public void setPaymentDate(Date paymentDate) {
		this.paymentDate = paymentDate;
	}

	public boolean isPaymentStatus() {
		return paymentStatus;
	}

	public void setPaymentStatus(boolean paymentStatus) {
		this.paymentStatus = paymentStatus;
	}

	public OrderDetail getOrderDetail() {
		return orderDetail;
	}

	public void setOrderDetail(OrderDetail orderDetail) {
		this.orderDetail = orderDetail;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	@Override
	public String toString() {
		return "Payment [paymentId=" + paymentId + ", totalAmount=" + totalAmount + ", paymentMode=" + paymentMode
				+ ", paymentDate=" + paymentDate + ", paymentStatus=" + paymentStatus + ", orderDetail=" + orderDetail
				+ ", user=" + user + "]";
	}
	
	
}
