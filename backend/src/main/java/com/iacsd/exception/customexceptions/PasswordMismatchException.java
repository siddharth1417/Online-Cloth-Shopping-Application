package com.iacsd.exception.customexceptions;

public class PasswordMismatchException extends RuntimeException{
    public PasswordMismatchException(String msg) {
        super(msg);
    }
}
