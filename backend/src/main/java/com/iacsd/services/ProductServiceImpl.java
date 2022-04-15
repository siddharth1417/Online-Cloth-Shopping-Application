package com.iacsd.services;

import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;
import java.util.stream.Collectors;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.iacsd.entities.Feedback;
import com.iacsd.entities.Product;
import com.iacsd.models.responseDto.DtoEntityConverter;
import com.iacsd.models.responseDto.FeedbackDto;
import com.iacsd.models.responseDto.NewFeedbackDtoForCommentOnProduct;
import com.iacsd.models.responseDto.ProductDto;
import com.iacsd.repository.IFeedbackRepository;
import com.iacsd.repository.IProductRepository;

@Transactional
@Service
public class ProductServiceImpl implements IProductService {

	@Autowired
	private IProductRepository productDao;

	@Autowired
	private IFeedbackRepository feedbackRepository;

	@Autowired
	private DtoEntityConverter converter;

	// ****************************** -GET/
	// ****************************************************

	public List<ProductDto> findAllProduct() { // find all product
		List<Product> productList = productDao.findAll();
		return productList.stream().map(product -> converter.toProductDto(product)).collect(Collectors.toList());
	}

	public ProductDto findProductById(int id) { // get product details by id
		Product product = productDao.findById(id);
		return converter.toProductDto(product);
	}

	public List<ProductDto> findProductByCategoryId(int categoryId) { // find product By categoryId
		List<Product> productList = productDao.findByCategoryId(categoryId);
		return productList.stream().map(product -> converter.toProductDto(product)).collect(Collectors.toList());
	}

	public List<ProductDto> findProductByProductPriceGreaterThan(double productPrice) { // find all product by price
																						// greater than specified
		List<Product> productList = productDao.findByProductPriceGreaterThanOrderByProductPriceAsc(productPrice);
		return productList.stream().map(product -> converter.toProductDto(product)).collect(Collectors.toList());
	}

	public List<ProductDto> findProductByProductPriceLessThan(double productPrice) { // find all product by price less
																						// than specified
		List<Product> productList = productDao.findByProductPriceLessThanOrderByProductPriceAsc(productPrice);
		return productList.stream().map(product -> converter.toProductDto(product)).collect(Collectors.toList());
	}

	public List<ProductDto> findProductByProductSize(String productSize) { // find all product by price less than
																			// specified
		List<Product> productList = productDao.findBySizeContaining(productSize);
		return productList.stream().map(product -> converter.toProductDto(product)).collect(Collectors.toList());
	}

	public List<ProductDto> findByProductDescriptionContaining(String tag) { // find product by tag
		List<Product> productList = productDao.findByProductDescriptionContainingIgnoreCase(tag);
		return productList.stream().map(product -> converter.toProductDto(product)).collect(Collectors.toList());
	}

	public int getTotalProductQuantity() { // get total product quantity
		return productDao.getTotalQuantity();
	}

	public List<ProductDto> findByNewlyAddedProducts() { // find by latest product
		List<Product> productList = productDao.findByNewlyAddedProducts();
		return productList.stream().map(product -> converter.toProductDto(product)).collect(Collectors.toList());
	}

	public List<ProductDto> findByAllProductWithDiscount(int discount) { // find All Product with discount by final
																			// discounted price
		List<Product> productList = productDao.findByAllProductWithDiscount(discount);
		return productList.stream().map(product -> converter.toProductDto(product)).collect(Collectors.toList());
	}

//****************************************************************

	// ADDED BY HANUMANT
	public List<FeedbackDto> findAllFeedbackByProductId(int id) {
		List<Feedback> feedbackList = productDao.findById(id).getFeedbackList();
		return feedbackList.stream().map(feedback -> converter.toFeedbackDto(feedback)).collect(Collectors.toList());
	}

	public List<Object[]> findAllCommentByProductId(int id) {
		return feedbackRepository.findAllCommentByProductId(id);
	}

	public List<Object[]> findAllRatingByProductId(int id) {
		return feedbackRepository.findAllRatingByProductId(id);
	}

	public double getAvgRatingByProductId(int id) {
		return productDao.getAvgRatingByProductId(id);
	}

	public int getSumOfRatingByProductId(int id) {
		return productDao.getSumOfRatingByProductId(id);
	}

//	 Added on 03/02/2022 by HANUMANT
	public Map<String, Object> addProductFeedbackByProductId(int productId, NewFeedbackDtoForCommentOnProduct newFeedbackDto) {
		newFeedbackDto.setProductId(productId);
		Feedback feedback = converter.toFeedbackEntity(newFeedbackDto);
		feedback = feedbackRepository.save(feedback);
		return Collections.singletonMap("insertedId", feedback.getFeedbackId());
	}
	
//	public Map<String, Object> addBlogComment(int blogId, BlogCommentDTO commentDto) {
//		commentDto.setBlogId(blogId);
//		BlogComment comment = converter.toCommentEntity(commentDto);
//		comment = commentDao.save(comment);
//		return Collections.singletonMap("insertedId", comment.getId());
//	}
	
//	public Map<String, Object> addProductFeedback(NewFeedbackDtoForCommentOnProduct newFeedbackDto) {
//		Feedback feedback = converter.toFeedbackEntity(newFeedbackDto);
//		feedback = feedbackRepository.save(feedback);
//		return Collections.singletonMap("insertedId", feedback.getFeedbackId());
//	}
	
	

	// ****************************** -GET/
	// ****************************************************

}
