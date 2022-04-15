package com.iacsd.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.iacsd.entities.Category;

public interface ICategoryRepository extends  JpaRepository<Category, Integer> {

}
