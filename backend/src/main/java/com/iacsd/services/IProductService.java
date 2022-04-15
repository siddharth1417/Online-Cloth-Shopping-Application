package com.iacsd.services;

import java.util.List;
import java.util.Map;

import com.iacsd.entities.Feedback;
import com.iacsd.entities.Product;
import com.iacsd.models.responseDto.FeedbackDto;
import com.iacsd.models.responseDto.NewFeedbackDtoForCommentOnProduct;
import com.iacsd.models.responseDto.ProductDto;

public interface IProductService {
	
	//ADDED BY AMIT  ******** get
		List<ProductDto> findAllProduct();
		ProductDto findProductById(int id);
		List<ProductDto> findProductByCategoryId(int categoryId);
		List<ProductDto> findProductByProductPriceGreaterThan(double productPrice);
		List<ProductDto> findProductByProductPriceLessThan(double productPrice);
		List<ProductDto> findProductByProductSize(String size);
		List<ProductDto> findByProductDescriptionContaining(String tag);
		int getTotalProductQuantity();
		List<ProductDto> findByNewlyAddedProducts();
		List<ProductDto> findByAllProductWithDiscount(int discount);
	
	//ADDED BY HANUMANT
	List<FeedbackDto> findAllFeedbackByProductId(int id);
	List<Object[]> findAllCommentByProductId(int id);
	List<Object[]> findAllRatingByProductId(int id);
	double getAvgRatingByProductId(int id);
	int getSumOfRatingByProductId(int id);
	
	//ADDED BY HANUMANT
//	Map<String, Object> addProductFeedback(NewFeedbackDtoForCommentOnProduct newFeedbackDto);
	Map<String, Object> addProductFeedbackByProductId(int productId, NewFeedbackDtoForCommentOnProduct newFeedbackDto);
	
}
