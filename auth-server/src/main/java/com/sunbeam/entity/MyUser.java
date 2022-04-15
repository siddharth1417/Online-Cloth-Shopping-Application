package com.sunbeam.entity;

import javax.persistence.*;

@Entity
@Table(name = "users")
public class MyUser {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "userId")
    private Long id;
    @Column(name = "userEmail")
    private String email;
    @Column(name = "password")
    private String password;
    @Column(name = "enabled")
    private boolean enable;
    @Column(name = "role")
    private String role;

    public MyUser() {
    }

    public MyUser(Long id, String email, String password, boolean enable, String role) {
        this.id = id;
        this.email = email;
        this.password = password;
        this.enable = enable;
        this.role = role;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public boolean isEnable() {
        return enable;
    }

    public void setEnable(boolean enable) {
        this.enable = enable;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }
}
