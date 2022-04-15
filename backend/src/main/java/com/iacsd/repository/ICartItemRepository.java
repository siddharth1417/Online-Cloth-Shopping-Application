package com.iacsd.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import org.springframework.stereotype.Repository;

import com.iacsd.entities.CartItem;


@Repository
public interface ICartItemRepository extends JpaRepository<CartItem, Integer>{
	//sList<CartItem> findByCartId(int id);
}
