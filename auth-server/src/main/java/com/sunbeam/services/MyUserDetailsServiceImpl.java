package com.sunbeam.services;

import com.sunbeam.entity.MyUser;
import com.sunbeam.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import java.util.Collections;
import java.util.List;

@Service(value = "userService")
public class MyUserDetailsServiceImpl implements UserDetailsService {

    private MyUser myUser;

    @Autowired
    private UserRepository userRepository;

    @Override
    public UserDetails loadUserByUsername(String email) throws UsernameNotFoundException {
        myUser = userRepository.findByEmail(email).orElseThrow(() -> new UsernameNotFoundException("Invalid Username or password"));

        return new org.springframework.security.core.userdetails.User(myUser.getEmail(), myUser.getPassword(), myUser.isEnable(), true, true, true, getAuthority());

    }

    private List<SimpleGrantedAuthority> getAuthority() {
        return Collections.singletonList(new SimpleGrantedAuthority(myUser.getRole()));
    }
}
