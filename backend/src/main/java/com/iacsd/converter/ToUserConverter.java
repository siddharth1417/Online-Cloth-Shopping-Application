package com.iacsd.converter;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Component;

import com.iacsd.entities.User;
import com.iacsd.models.requestDto.UserSignupDto;

@Component
public class ToUserConverter {
    @Autowired
    private PasswordEncoder passwordEncoder;

    public ToUserConverter() {
    }

    public User apply(UserSignupDto userSignupDto) {
        User user = new User();
        user.setUserEmail(userSignupDto.getEmail());
        user.setUsername(userSignupDto.getName());
        user.setPassword(passwordEncoder.encode(userSignupDto.getPassword()));
        user.setEmailVerified(false);
        user.setUserMobileNumber(null);
        user.setRole("user");
        user.setGender(userSignupDto.getGender());
        user.setUserMobileNumber(Long.parseLong(userSignupDto.getMobile()));
        return user;


    }

    public String encodePassword(String password) {
        return passwordEncoder.encode(password);
    }
}
