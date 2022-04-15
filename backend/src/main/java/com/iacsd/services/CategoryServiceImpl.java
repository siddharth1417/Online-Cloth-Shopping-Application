package com.iacsd.services;

import java.util.Optional;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.iacsd.entities.Category;
import com.iacsd.entities.Product;
import com.iacsd.repository.ICategoryRepository;

@Transactional
@Service
public class CategoryServiceImpl {

	
	@Autowired
	private ICategoryRepository categoryDao;
	
	
	
}
