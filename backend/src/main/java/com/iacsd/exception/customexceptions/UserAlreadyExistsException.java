package com.iacsd.exception.customexceptions;

public class UserAlreadyExistsException extends RuntimeException{
    public UserAlreadyExistsException(String msg) {
        super(msg);
    }
}
