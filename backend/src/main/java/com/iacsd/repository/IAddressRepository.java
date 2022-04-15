package com.iacsd.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.iacsd.entities.Address;
import com.iacsd.entities.User;

import java.util.List;

public interface IAddressRepository extends JpaRepository<Address, Long> {
    List<Address> findByUser(User user);
}
