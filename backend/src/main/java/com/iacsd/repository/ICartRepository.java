package com.iacsd.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.iacsd.entities.Cart;

@Repository
public interface ICartRepository extends JpaRepository<Cart, Integer> {
	

}